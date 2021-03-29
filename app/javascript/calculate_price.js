window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('input', function(){
    const inputValue = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor(inputValue / 10);
    profit.innerHTML = inputValue - Math.floor(inputValue / 10);
  })
})