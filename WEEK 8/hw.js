
// ### `madLib`

// Write a function that takes three strings - a verb, an adjective, and a noun -
// and uppercases and interpolates them into the sentence "We shall **VERB** the
// **ADJECTIVE** **NOUN**". Use ES6 [template literals].


function madLib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
};


console.log(madLib('make', 'best', 'guac'));
// "We shall MAKE the BEST GUAC."


// ### `isSubstring`

// **Input**

// 1. A String called `searchString`.
// 2. A String called `subString`.

// **Output:** A Boolean; `true` if the `subString` is a part of the
// `searchString`.

function isSubstring(searchString, subString){
    return searchString.includes(subString);
}

// ```js
console.log(isSubstring("time to program", "time"));
// true

// > isSubstring("Jump for joy", "joys")
// false
// ```

// ## Phase II: JS looping constructs

// Carry on! Know your loops!

// ### `fizzBuzz`

// 3 and 5 are magic numbers.

// Define a function `fizzBuzz(array)` that takes an array and returns a new array
// of every number in the array that is divisible by either 3 or 5, but not both.

function fizzBuzz(array) {
    let newArr = [];
    array.forEach (ele => {
        if ((ele % 5 === 0) || (ele % 3 === 0 )) {
            newArr.push(ele);
        }
    })
    return newArr;
}

console.log(fizzBuzz([1,2,3,4,5]))

// ### `isPrime`

// Define a function `isPrime(number)` that returns `true` if `number` is prime.
// Otherwise, return `false`. Assume `number` is a positive integer.

function isPrime(number){
    if (number < 2 ) {
        return false;
    } 
    for (let i = 2; i < number; i ++) {
        if (number % i === 0) {
            return false;
        }
    }
    return true;
}
// ```javascript
console.log(isPrime(2))
// true

console.log(isPrime(10))
// false

console.log(isPrime(15485863))
// true

console.log(isPrime(3548563))
// false
// ```

// ### `sumOfNPrimes`

// Using `firstNPrimes`, write a function `sumOfNPrimes(n)` that returns the sum of
// the first `n` prime numbers. **Hint:** use `isPrime` as a helper method.

function sumOfNPrimes(n) {
    let sum = 0;
    let counter = 0;
    let i = 2;
    while (counter < n) {
        if (isPrime(i)){
            sum += i;
            counter++;
        }
        i++;
    }
    return sum;
}
// ```javascript
console.log(sumOfNPrimes(0))
// 0

console.log(sumOfNPrimes(1))
// 2

console.log(sumOfNPrimes(4))
// 17
// ```