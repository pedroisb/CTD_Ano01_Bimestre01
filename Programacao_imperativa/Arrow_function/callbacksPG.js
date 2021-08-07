// Crie uma função acaoCarro(), que receberá uma callback como parâmetro.
// Após isso, crie duas funções: andar() – deve exibir uma mensagem dizendo que o carro está andando
// e parar() – deve exibir uma mensagem dizendo que o carro parou.
// Execute ambas as ações utilizando a função acaoCarro(), passando suas ações como callbacks.


let acaoCarro = (callback) => callback();

let andar =()=> console.log('O carro está andando');

let parar =()=> console.log('O carro parou');

acaoCarro(andar);
acaoCarro(parar);