"use strict";

const _ = require("./i18n").text;
const expect = require("chai").expect;
const App = require("./app");

describe("", function () {
  this.timeout(10000);

  let app;
  beforeEach("", async () => {
    app = await App.create();
  });

  afterEach("", async () => {
    app.close();
  });

  it(_`[Step 1] track-button が存在する`, () => {
    expect(app.elements.track_button(), _`track-button が見つかりません`).to.exist;
  });
  it(_`[Step 2] track-button を押すと、"hello track" という文字列が表示される`, async () => {
    const beforeTexts = app.elements.track_text().textContent;
    expect(beforeTexts, `track-button を押す前に、body 内に "hello track" という文字列が含まれています`).to.not.have.string("hello track");
    await app.clickTrackButton();
    const afterTexts = app.elements.track_text().textContent;
    expect(afterTexts, `track-button を押した後に、body 内に "hello track" という文字列が含まれていません`).to.have.string("hello track");
  });
});
