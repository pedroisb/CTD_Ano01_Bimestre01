/*Neste exercício, você terá que criar uma função "FizzBuzz" que recebe
dois parâmetros numéricos. A função deve atender aos seguintes requisitos:
● Você deve imprimir os números de 1 a 100;
● Se o número a ser impresso for um múltiplo de seu PRIMEIRO
parâmetro, você deve imprimir a palavra “Fizz” em vez do número
correspondente;
● Se o número a ser impresso for um múltiplo do seu SEGUNDO parâmetro,
você deve imprimir a palavra "Buzz" em vez do número correspondente;
● Se o número for um múltiplo de AMBOS os parâmetros, você deve imprimir
a palavra “FizzBuzz”.*/

let FizzBuzz = (n1, n2) => {
    for (let i = 1; i <= 100; i++) {
        if (i % (n1*n2) === 0) {
            console.log('FizzBuzz')
        } else if (i % n1 === 0) {
            console.log('Fizz');
        } else if (i % n2 === 0) {
            console.log('Buzz');
        } else {
            console.log(i);
        }
    }
};

//FizzBuzz(2, 3);

/*Solução Silas: Resolve o problema dos parâmetros múltiplos entre si

let fizzBuzzN1 = (i, n1) => i%n1==0 ? "Fizz" : ""
let fizzBuzzN2 = (i, n2) => i%n2==0 ? "Buzz" : ""
let fizzBuzzT = (n1,n2) => {
    for(let i=1; i <= 100; i++){
        console.log(i + " - " + fizzBuzzN1(i,n1) + fizzBuzzN2(i,n2))
    }
}
fizzBuzzT(10,3)*/


/*Avançado: Como crédito extra, pense em como otimizar seu programa para que
as palavras sejam passadas de forma dinâmica e seja você quem decide quais
palavras ele deve dizer.*/

let creditoExtra = (nome1, nome2, n1, n2) => {
    let a = nome1;
    let b = nome2;
    for (let i = 1; i <= 100; i++) {
        if (i % (n1*n2) === 0) {
            console.log(a+b)
        } else if (i % n1 === 0) {
            console.log(a);
        } else if (i % n2 === 0) {
            console.log(b);
        } else {
            console.log(i);
        }
    }
};

creditoExtra('Beetle', 'Juice', 5, 7);