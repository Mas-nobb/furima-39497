// Import and register all your controllers from the importmap under controllers/*
import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

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
// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
