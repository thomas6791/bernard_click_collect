import { Controller } from 'stimulus';
export default class extends Controller { 
    connect() {
        console.log("commande");
        let btns = document.querySelectorAll(".order-btn");
        let amount =  parseFloat(document.querySelector("#order-summary").querySelector("span").innerHTML);
btns.forEach((btn) => {
    btn.addEventListener("click", (event) => {
        if (event.currentTarget.classList.contains("plus")){
            let counterData = event.currentTarget.parentElement.querySelector(".counter").innerHTML;
            let counter = parseFloat(counterData);
            counter = counter += 1;
            event.currentTarget.parentElement.querySelector(".counter").innerHTML = counter;
            let priceQty = parseFloat(event.currentTarget.parentElement.parentElement.querySelector(".click-prix").dataset.prix) * counter;
            amount += parseFloat(event.currentTarget.parentElement.parentElement.querySelector(".click-prix").dataset.prix) * 1;
            document.querySelector("#order-summary").querySelector("span").innerHTML = amount;
        }
        else {
            let counterData = event.currentTarget.parentElement.querySelector(".counter").innerHTML;
            let counter = parseFloat(counterData);
            counter = counter -= 1;
            event.currentTarget.parentElement.querySelector(".counter").innerHTML = counter;
            let priceQty = parseFloat(event.currentTarget.parentElement.parentElement.querySelector(".click-prix").dataset.prix) * counter;
            amount -= parseFloat(event.currentTarget.parentElement.parentElement.querySelector(".click-prix").dataset.prix) * 1;
            document.querySelector("#order-summary").querySelector("span").innerHTML = amount;

        }
      })
  })
    }
    commandeNext() {
        console.log("next commande")
        let nbrePlats = document.querySelector("#contact_mail_quantite").value = parseFloat(document.querySelector(".counter").innerHTML)
      }
}