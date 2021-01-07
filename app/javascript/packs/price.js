document.addEventListener('turbolinks:load', function(){
  const charge_rate = 0.1;
  const input = document.getElementById('item-price');
  const v1 = document.getElementById('add-tax-price');
  const v2 = document.getElementById('profit');
  if(!input == false){
    input.addEventListener('input', updateValue);
  }
  function updateValue(e){
    if((e.target.value).match(/^\d+$/)){
      v1.textContent = Math.floor(parseFloat(e.target.value) * charge_rate);
      v2.textContent = Math.floor(parseFloat(e.target.value)) - Math.floor(parseFloat(e.target.value) * charge_rate);
    }else{
      v1.textContent = '';
      v2.textContent = '';
    }
  }
}, false);
