const updateBasketByOrderQuantity = () => {
  var basketNumber = parseInt(document.getElementById("refresh").innerHTML);
  if (basketNumber >= 0) {
    basketNumber += 1;
    document.getElementById("refresh").innerHTML = basketNumber;
  }
};

const basketUpdate = () => {
  document.querySelectorAll(".refresh-basket").forEach((card) => {
    card.addEventListener("click", updateBasketByOrderQuantity);
  });
}

export { basketUpdate };
