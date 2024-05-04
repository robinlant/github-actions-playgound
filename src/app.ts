import config from "./config"
import getOrSetupCounter from "./getOrSetupCounter"

console.log("app is loaded")

const counterElement = document.getElementById(config.counterId) as HTMLElement;
const updateCounterBtn = document.getElementById(config.updateCounterBtnId) as HTMLButtonElement;

let counter = getOrSetupCounter(config.localStorageCounterKey, counterElement);

updateCounterBtn.onclick = () => {
    localStorage.setItem(config.localStorageCounterKey, (++counter).toString());
    counterElement.innerHTML = counter.toString();
    
    console.log(`counter: ${counter}`)
}