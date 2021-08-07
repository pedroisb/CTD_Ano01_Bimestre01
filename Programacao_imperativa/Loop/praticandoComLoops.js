/*1) Crie um loop utilizando for que se repita 5 vezes. 
Dentro de cada repetição se deve mostrar no console a mensagem “Olá mundo”.*/

for (let i = 1; i <= 5; i++ ) {
    console.log('Olá, mundo!');
}

/*2) Crie um loop for de 1 a 10, em que exiba no console apenas o valor das repetições de números ímpares.*/

for (let numero = 1; numero <= 10; numero++ ) {
    if (numero % 2 !== 0) {
        console.log(numero);
    }
}

/*3) Crie uma tabuada utilizando o for. Dica: Para essa tarefa você irá precisar utilizar dois loops (for).*/

for (let tabuada1 = 1; tabuada1 <= 10; tabuada1++ ) {
    for (let tabuada2 = 1; tabuada2 <= 10; tabuada2++ ){
        console.log(tabuada1*tabuada2);
    }
}