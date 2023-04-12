"use strict";

const _ = require("./i18n").text;
const jsdom = require("jsdom");
const { JSDOM, VirtualConsole } = jsdom;
const expect = require("chai").expect;
const fetch = require("node-fetch");
const { ms } = require("./util");
const cp = require("child_process");

class App {
  static async create() {
    const http = cp.spawn("python3", ["-m", "http.server", "8888"], { cwd: "./public" });
    const virtualConsole = new VirtualConsole();
    const domOption = {
      resources: "usable",
      runScripts: "dangerously",
      virtualConsole,
    };
    const dom = await App.retrieveDOM("http://localhost:8888/", domOption, 0);
    dom.window.Element.prototype.__defineGetter__("innerText", function () {
      return this.textContent;
    });
    dom.window.Element.prototype.__defineSetter__("innerText", function (val) {
      this.textContent = val;
    });
    dom.window.requestAnimationFrame = () => { };
    dom.window.fetch = fetch;
    await ms();
    const app = new App(dom, http);
    await ms(1500);
    virtualConsole.sendTo(console);
    return app;
  }

  static async retrieveDOM(url, domOptions, retryCount) {
    await ms(500);
    try {
      return await JSDOM.fromURL(url, domOptions);
    } catch(e) {
      if (retryCount >= 10) {
        throw e;
      }
      return await App.retrieveDOM(url, domOptions, retryCount + 1);
    }
  }

  constructor(dom, http) {
    this.http = http;
    this.dom = dom;
    const document = dom.window.document;
    this.elements = {
      track_text: () => document.querySelector("div#track-text"),
      track_button: () => document.querySelector("button#track-button"),
    };
  }

  async close() {
    this.http.kill();
  }

  async clickTrackButton() {
    const trackButton = this.elements.track_button();
    expect(trackButton, _`track-button が見つかりません`).to.exist;
    await this._click(trackButton);
  }

  async _click(el) {
    if (el.click) {
      el.click();
    } else {
      el.dispatchEvent(new this.dom.window.Event("click", { bubbles: true, cancelable: true }));
    }
    await ms();
  }
}

module.exports = App;
