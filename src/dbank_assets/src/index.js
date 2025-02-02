import { dbank } from "../../declarations/dbank"

window.addEventListener("load", async function() {
  const currentAmount = await dbank.checkbalance()
  document.getElementById("value").innerText =  Math.round(currentAmount * 100) / 100; //deixando o retorno com apenas duas casas dps da virgula
})

document.querySelector("form").addEventListener("submit", async function(event){
  event.preventDefault()

  const button = event.target.querySelector("#submit-btn")

  const inputAmount = parseFloat(document.getElementById("input-amount").value)
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value)

  button.setAttribute("disabled", true)

  if(document.getElementById("input-amount").value.length != 0){
    await dbank.topUp(inputAmount)
  }

  if(document.getElementById("withdrawal-amount").value.length != 0){
    await dbank.downUp(outputAmount)
  }

  const currentAmount = await dbank.checkbalance()
  document.getElementById("value").innerText =  Math.round(currentAmount * 100) / 100

  button.removeAttribute("disabled")

})