const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY)//PAY.JPテスト公開鍵
  const elements = payjp.elements();//elementsインスタンスを作成
  const numberElement = elements.create('cardNumber');//入力フォーム作成(カード番号入力欄)
  const expiryElement = elements.create('cardExpiry');///有効期限
  const cvcElement = elements.create('cardCvc');//CVC

  //引数で要素のid属性を指定。指定した要素をelementsインスタンスが情報を持つフォームに置き換える
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');



  ///フォームクリックしたらイベント発火
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error){
       }
       else{
        const token = response.id;
        console.log(token);
        const renderDom = document.getElementById("charge-form"); //form_withのid取得
        const tokenObj = `<input value=${token} name='token' type="hidden">` //input内に代入するために変数定義？
        renderDom.insertAdjacentHTML("beforeend", tokenObj); ///上記で取得した要素renderDomをinsertAdjacentHTMLメソッドでHTMLを挿入
       }
       //トークン生成し、サーバーサイドへはトークンを送信する為、カード情報を削除
       numberElement.clear();//カード番号削除
       expiryElement.clear();//有効期限削除
       cvcElement.clear();//セキュリティコード削除
       document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);