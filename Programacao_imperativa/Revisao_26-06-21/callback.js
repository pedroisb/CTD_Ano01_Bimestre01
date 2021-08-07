function somar(n1,n2){
    return n1+n2
}

function subtracao(n1,n2){
    return n1-n2
}

function multiplicacao(n1,n2){
    return n1*n2
}

function divisao(n1,n2){
    return n1/n2
}

function calculadora(n1,n2,callback){
    return callback(n1,n2)
}

console.log(calculadora(2,3, divisao))