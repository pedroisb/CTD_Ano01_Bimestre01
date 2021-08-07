/* Crie uma função construtora chamada Restaurante, que receba como parâmetros o nome do restaurante e o cardápio (que será um array de strings).
Após isso chame a função entrada() dentro do objeto, que irá trazer uma mensagem de boas-vindas, informando o nome do restaurante, e o cardápio.*/

class Restaurante {
    constructor(nome, cardapio, telefone) {
        this.nome = nome;
        this.cardapio = cardapio;
        this.telefone = telefone;
        this.entrada = function () { return 'Seja bem-vindo à ' + nome + '! No cardápio de hoje temos: ' + cardapio + 'entre contato conosco em: ' + telefone};
    }
};

function Restaurante (nome, cardapio, telefone) {
    this.nome = nome;
    this.cardapio = cardapio;
    this.telefone = telefone;
    this.entrada = function () {return 'Seja bem-vindo à ' + nome + '! No cardápio de hoje temos: ' + cardapio + ' Entre contato conosco em: ' + telefone}
};

const cantina = new Restaurante ('Cantina della Mamma', ['Bruschetta Margarita', ' Filetto del Doge', ' Gelato al pistacchio.'], '(71)3351-9951');
console.log(cantina.entrada());