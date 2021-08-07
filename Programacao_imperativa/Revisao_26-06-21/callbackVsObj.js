//podemos realizar as 4 operações básicas via callback ou através de métodos de obj.

function soma (n1,n2) {
    return n1+n2;
};

function subtracao(n1,n2){
    return n1-n2;
};

function multiplicacao(n1,n2){
    return n1*n2;
};

function divisao(n1,n2){
    return n1/n2;
};

function calculadora (n1, n2, funcao){
    return funcao(n1,n2);
};

console.log(calculadora(2,3,soma));
console.log(calculadora(2,3,subtracao));
console.log(calculadora(2,3,multiplicacao));
console.log(calculadora(2,3,divisao));

let calculadoraObj = {
    somar: function () {
        return n1+n2;
    },
    subtracao: function () {
        return n1-n2;
    },
    multiplicacao: function () {
        return n1*n2;
    },
    divisao: function () {
        return n1/n2;
    }
};

console.log(calculadoraObj.somar(2,5));
console.log(calculadoraObj.subtracao(2,5));
console.log(calculadoraObj.multiplicao(2,5));
console.log(calculadoraObj.divisao(2,5));

console.table(calculadoraObj); //o table apresenta o obj em uma tabela organizada. dá para fazer com arrays também.

//Observação e sugestão: nesse caso acima, dá para resolver a mesma situação via callback ou métodos de obj. Experimentem implementar uma terceira opção com módulos.
// module.exports = calculadaObj;