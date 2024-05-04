const getOrSetupCounter = (localStorageCounterKey: string, counterElement: HTMLElement):number => {
    let counter:string | null = localStorage.getItem(localStorageCounterKey);
   
    if(counter == null){
        counter = "0";
        localStorage.setItem(localStorageCounterKey, counter);
    }

    counterElement.innerHTML = counter.toString();

    return parseInt(counter);
}

export default getOrSetupCounter;