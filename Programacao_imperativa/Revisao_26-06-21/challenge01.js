//# Desafio Semana #1


//Declarar uma variável chamada `myvar`, sem valor.
var myVar; //var não é ideal, pois sempre será acessível em escopo global, independente de onde for declarada.
let myVar; 
const myVar; //uma vez declarda, a variável const não poderá ter seu valor modificado,

//exemplo
let nome = 'Rafa';
nome = 'Pedro';

const nome = 'Rafa';
nome = 'Pedro'; //não haverá atribuição do novo valor de string 'Pedro', será conservado o valor 'Rafa'.

for (let i = 0; i<5, i++) { //caso fosse utilizada const i no lugar de let i, somente seria retornado o valor 0, e não haveria mais iterações. i++ não seria executado.
    console.log(i)
};


//Após declarada, atribua o valor 10 à variável `myvar`.
myVar = 10;  //lembrar que declarar uma variável é diferente de atribuir valor.
// =    recebe
// ==   igual a 
// ===  estritamente igual a -> aqui há uma análise do valor do dado e do TIPO de dado.

//  let a = 100; (number)
//  let b = '100'; (string)

//  a == b; retorna TRUE
//  a === b; retorna FALSE

//Declare uma nova variável chamada `soma`, e adicione uma instrução somando os valores 15 e 8.
let soma = 15 + 8;

//Atribua à variável `soma` todo o valor dela, somando 1, usando o operador de soma abreviado.
soma += 1; //atende ao enunciado
// soma = soma+1; ambas as linhas seguintes equivalem, em resultado, à primeira.
// soma++;

//Atribua à variável `soma` todo o valor dela, multiplicando por 3, usando o operador de multiplicação abreviado.
soma *=3;

//Qual é o valor da variável `soma` até aqui
console.log(soma);

//Declare uma variável chamada `souninja`, atribuindo à ela o valor booleano que representa `verdadeiro`.
let souNinja = true; //lembrar de utilizar camelCase quando declarar variáveis.

//Declare uma variável chamada `comida` que recebe um array com os valores 'arroz', 'feijão' e 'ovo'.
let comida = ['arroz', 'feijão', 'ovo'];

//Digite a instrução que imprime o valor de 'feijao', que está na variável `comida`.
console.log(comida[2]);

// comida.length retornará a extensão do array comida, neste caso = 3
//lembre-se que os elementos do array são indexados a partir de 0. São 3 elementos, com index: [0], [1] e [2]
//caso seja passado index de elemento inexistente, ele retornará undefined
//experimentar com console.log(comida[3]);

// Digite o código que verifica se a variável `soma' é igual a variável `myvar` (testando também o tipo).
// let myVar = '72';
// let soma = 72;
// // console.log(myVar === soma);


// // Digite o código que verifica se a variável `myvar` é menor ou igual à variável `soma`.
// console.log(myVar<=soma);
// <= ou >= não se preocupa se os elementos compardos são estritamente iguais, ou seja, não há avaliação do tipo de dado.
// lembrando que para diferente: != e !==. No segundo caso, também será avaliado o tipo de dado.

// Crie uma função chamada `divisao` que receba como parâmetro dois números, e retorne o resultado da divisão entre eles.
// function divisao (num1, num2) {      -> função declarada
//     return num1/num2;
// };
// console.log(divisao(10,2));


// const dividir = function (num1, num2) {      -> expressão de função
//     return num1/num2;
// };
// console.log(dividir(10,2));

// const dividir = (num1, num2) => {        -> arrow function
//     num1 = num1**2;
//     return num1/num2;
// };
// console.log(dividir(5, 5));


// Invoque a função criada acima, passando os parâmetros 10 e 2. -> já foi feito

// console.log(10, );
// caso seja passado um número de argumentos inferior ao número de parâmetros, nossa função retornará NaN. 
// Isto porque ela tentou realizar uma operação de divsão com 10 / undefined.