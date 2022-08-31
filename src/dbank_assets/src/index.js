import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
  displayAmount();
})

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();
  let button = document.querySelector("#submit-btn");
  button.setAttribute("disabled", true);

  //for depositing the amount in the bank
  let depositAmount = parseFloat(document.getElementById("input-amount").value);
  if (document.getElementById("input-amount").value.length != 0){
    await dbank.topUp(depositAmount);
  }
  document.getElementById("input-amount").value = ""

  //for withdrawing the amount from the bank
  let withdrawlAmount = parseFloat(document.getElementById("withdrawal-amount").value);
  if (document.getElementById("withdrawal-amount").value.length != 0){
    await dbank.withdrawl(withdrawlAmount);
  }
  document.getElementById("withdrawal-amount").value = ""

  //compound the money
  await dbank.compound();

  //resetting the form
  displayAmount();
  button.removeAttribute("disabled");
})

async function displayAmount(){
  let currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
}