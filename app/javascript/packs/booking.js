function decrease(id, price) {

  var total = document.getElementById("total");
  var tag = document.getElementById(id);
  var qty = tag.value;
  if (!isNaN(qty) && qty >= 1) {
    tag.value--;
    total.value = parseInt(total.value, 10) - ((id === "adults") ? price : (price / 2));
  }

  return false;
}

function increase(id, price) {

  var total = document.getElementById("total");
  var tag = document.getElementById(id);
  var qty = tag.value;

  if (!isNaN(qty)) {

    tag.value++;
    total.value = parseInt((id === "adults") ? price : (price / 2), 10) + parseInt(total.value, 10);
  }

  return false;
}

export { decrease, increase };