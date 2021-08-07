/*1) Crie uma função podeSubir() que receba dois parâmetros:
- altura da pessoa;
- se está acompanhada.
Deve retornar um valor booleano (TRUE, FALSE) que indique se a pessoa pode
subir ou não, baseado nas seguintes condições:
a) A pessoa deve medir mais de 1.40m e menos de 2 metros.
b) Se a pessoa medir menos de 1.40m, deverá ir acompanhada.
c) Se a pessoa medir menos de 1.20m, não poderá subir, nem
acompanhada.*/

//let altura = numero
//let acompanhada = booleano
//a) 1.40 < altura > 2.00; -> pode subir
//b) if altura < 1.40, e acompanhada(true) -> pode subir
//c) if altura < 1.20, mesmo acompanhada (true or false) -> não poderá subir


let podeSubir = function (altura, acompanhada) {
    if (altura > 1.40 && altura < 2.00) {
        console.log('Acesso autorizado!');
    } else if (altura < 1.40 && altura > 1.20) {
        if (acompanhada === true) {
            console.log('Acompanhante presente. Acesso autorizado!');
        } else {
            console.log('Acompanhante ausente. Acesso negado!');
        }
    } else {
        console.log('Acesso negado!');
    }
}

//ternário - condição ? primeira expressão : segunda expressão;
//switch

podeSubir (1.80, true);
podeSubir(1.80, false);
podeSubir(1.30, true);
podeSubir(1.30, false);
podeSubir(1.00, true);
podeSubir(1.00, false);
podeSubir(2.10, false);