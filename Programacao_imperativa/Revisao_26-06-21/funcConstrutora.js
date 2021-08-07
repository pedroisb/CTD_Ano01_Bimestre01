/* Crie uma função construtora chamada Restaurante, que receba como parâmetros o nome do restaurante e o cardápio (que será um array de strings).
Após isso chame a função entrada() dentro do objeto, que irá trazer uma mensagem de boas-vindas, informando o nome do restaurante, e o cardápio.*/
class Restaurante {
    constructor(nome, cardapio) {
        this.nome = nome;
        this.cardapio = cardapio;
        this.entrada = function () {
            return `Seja bem vindo á ${this.nome} temos
${this.cardapio}`;
        };
    }
}

function Restaurante(nome, cardapio){
    this.nome = nome;
    this.cardapio = cardapio;
    this.entrada = function(){
        return `Seja bem vindo á ${this.nome} temos
${this.cardapio}`
    }
}

let nome = new Restaurante('Kitanda', ['Pão', 'Arroz', 'Manteiga', 'Feijão'])
console.log(nome.entrada())