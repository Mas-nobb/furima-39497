function pullDown() {
  document.getElementById('item-price').addEventListener('input', (e) => {
    const price = e.target.value;
    if (!price) {
        document.getElementById('add-tax-price').innerHTML = '';
        document.getElementById('profit').innerHTML = '';
        return;
    }

    const fee = Math.floor(price * 0.1); // 10%の手数料を計算
    const profit = Math.floor(price - fee); // 利益（小数点以下切り捨て）

    document.getElementById('add-tax-price').innerHTML = fee;
    document.getElementById('profit').innerHTML = profit;
  });
}

document.addEventListener('turbo:load', () => {
  const itemPrice = document.getElementById('item-price');
  if (itemPrice) {
    pullDown();
  }
});

