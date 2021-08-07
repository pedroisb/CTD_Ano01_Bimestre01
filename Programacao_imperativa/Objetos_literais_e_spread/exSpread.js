/*1. Crie um array numerosPrimos e atribua alguns valores a ele que correspondam ao seu nome. 
Além disso, crie outro array, desta vez chamado numeros, que deve conter os valores do array numerosPrimos adicionados através do spread, juntos com outros números.*/

let numerosPrimos = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31];

let numeros = [1, 4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20, 21, 22, 24, 25, 26, 27, 28, 30, ...numerosPrimos];

console.log(numeros);


/*2. Crie uma função maiorNumero() que receba N parâmetros, e retorne o menor número entre eles, utilizando a função Math.min(). 
Uma observação importante é que a função Math.min() NÃO deve receber um array como parâmetro, sendo portanto, necessário expandir os valores.*/

let maiorNumero = function (...parametro) {
    return Math.min(...parametro);
};

console.log(maiorNumero(61, 11, 789, 56, 72, 6));

