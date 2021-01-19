function price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price")
    const addProfit = document.getElementById("profit")
    addTax.innerHTML = (inputValue * 0.1)
    addProfit.innerHTML = (inputValue - addTax.innerHTML)
  })
}
window.addEventListener('load', price)