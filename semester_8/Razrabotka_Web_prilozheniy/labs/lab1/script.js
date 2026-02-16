// Лабораторная 4
function calc() {
    let firstValue = Number(document.getElementById("firstValue").value);
    let secondValue = Number(document.getElementById("secondValue").value);

    if (firstValue === 0) {
        document.getElementById("output4").innerText = "Деление на 0!";
        return;
    }

    let result = (secondValue / firstValue).toFixed(3);
    document.getElementById("output4").innerText = result;
}

// Лабораторная 5
function lab5() {
    let text = "hello world";
    let result = text[0].toUpperCase() + text.slice(1);
    document.getElementById("output5").innerText = result;
}

// Лабораторная 6
function lab6() {
    const firstCheck = 1;
    const secondCheck = true;

    let result;

    if (firstCheck === 1) {
        result = secondCheck ? "Accept" : "Decline";
    } else {
        result = "false";
    }

    document.getElementById("output6").innerText = result;
}

// Лабораторная 7
function lab7() {
    const processedNumber = 28;
    let sum = 0;

    for (let i = 1; i < processedNumber; i++) {
        if (processedNumber % i === 0) {
            sum += i;
        }
    }

    let result = sum === processedNumber
        ? "Число совершенное"
        : "Число не совершенное";

    document.getElementById("output7").innerText = result;
}

// Лабораторная 8
function reverseNumber(num, result = "") {
    if (num === 0) {
        return result;
    }

    return reverseNumber(
        Math.floor(num / 10),
        result + (num % 10)
    );
}

function lab8() {
    const number = 12345;
    document.getElementById("output8").innerText = reverseNumber(number);
}

// Лабораторная 9
function lab9() {
    const obj1 = {
        a: 1,
        b: "text",
        c: true,
        d: null,
        e: 5,
        f: "hello",
        g: false
    };

    const obj2 = { ...obj1 };

    document.getElementById("output9").innerText = (obj1 === obj2);
}

// Лабораторная 10
function lab10() {
    const array = [3, 8, 95, 64, 72, 55, 49, 300];
    let sum = 0;

    for (let value of array) {
        sum += value;
    }

    let average = sum / array.length;

    document.getElementById("output10").innerText = average;
}

// Лабораторная 11
const rect = document.getElementById("rect");
let currentX = 0;

rect.onclick = function () {
    currentX += 500;
    rect.style.transform = `translateX(${currentX}px)`;
};
