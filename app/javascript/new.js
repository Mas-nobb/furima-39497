document.getElementById('item-price').addEventListener('input', (e) => {
  const price = e.target.value;
  if (!price) {
      document.getElementById('add-tax-price').innerText = '';
      document.getElementById('profit').innerText = '';
      return;
  }

  const fee = Math.floor(price * 0.1); // 10%の手数料を計算
  const profit = price - fee;

  document.getElementById('add-tax-price').innerText = fee;
  document.getElementById('profit').innerText = profit;
});