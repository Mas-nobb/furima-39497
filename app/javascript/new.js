function pullDown() {
  document.getElementById('item-price').addEventListener('input', (e) => {
    const price = e.target.value;
    if (!price) {
        document.getElementById('add-tax-price').innerHTML = '';
        document.getElementById('profit').innerHTML = '';
        return;
    }

    const fee = Math.floor(price * 0.1); // 10%の手数料を計算
    const profit = price - fee;

    document.getElementById('add-tax-price').innerHTML = fee;
    document.getElementById('profit').innerHTML = profit;
  });
}

document.addEventListener('turbo:load', pullDown); // or 'turbolinks:load' depending on your Rails version
