const pay = () => {
  const publicKey = gon.payjp_public_key;  // 変数名を修正
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expirymonthElement = elements.create('cardExpiryMonth');
  const expiryyearElement = elements.create('cardExpiryYear');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expirymonthElement.mount('#card-exp-month');
  expiryyearElement.mount('#card-exp-year');
  cvcElement.mount('#card-cvc');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラーハンドリングの処理を追加する場合はここに記述
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expirymonthElement.clear();
      expiryyearElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);

