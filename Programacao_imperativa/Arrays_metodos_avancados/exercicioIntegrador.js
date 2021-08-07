// Temos que fazer um sistema para um Agricultor controlar suas vendas. Ele tem um controle de vendas em um caderno, onde os produtos estão organizados por nome, preço e quantidade vendida. Portanto, crie um array de objetos literais com essas informações. No sistema, você tem que adicionar uma função (ou várias) que realize os seguintes passos:

const controleVenda = [
    {nome: 'Abóbora', preco: 5.00, qntVenda: 8},
    {nome: 'Laranja', preco: 0.99, qntVenda: 15},
    {nome: 'Manga', preco: 1.50, qntVenda: 23},
    {nome: 'Feijão', preco: 1.30, qntVenda: 32},
    {nome: 'Tomate', preco: 2.20, qntVenda: 12},
    {nome: 'Milho', preco: 4.50, qntVenda: 18},
    {nome: 'Beterraba', preco: 1.80, qntVenda: 16}
];


// 1. Calcular o lucro total de todos os produtos; 

//R: utilizar .map() e concatenar com .reduce() para somar os valores obtidos no novo array


const receitaBruta = arr => Math.round(arr.map(el => el.preco*el.qntVenda).reduce((total, el) => total + el)).toFixed(2);

console.log(receitaBruta(controleVenda));


// 2. Permitir pesquisar um produto pelo nome e calcular seu lucro total; 

//R: será utilizado método .find(). Pensei que também utilizaria .map(), como acima, mas não vai servir aqui. .find() retornará um objeto do array controleVenda e não um outro array, daí .map() se torna inaplicável.


const produtoLucro = (arr, nome) => {
    let item = arr.find(el => el.nome === nome);
    return item.nome+' proporcionou um lucro de: R$ '+Math.round(item.preco*item.qntVenda).toFixed(2); //.find() retornou um el do array, que, neste exercício, sempre será um objeto. Daí, concatenar um retorno com as propriedades do objeto armazenado na variável item - item.nome, item.preco e item.qntVenda.
};

console.log(produtoLucro(controleVenda, 'Feijão'));


// 3. Permite receber um valor e indicar todos os produtos que venderam mais que esse valor;

//R: Aqui será usado o método .filter(). Será confrontado valor obtido em .map() com valor-parâmetro. Lembrar que quero os nomes dos produtos e não o lucro obtido com cada um. Devo usar .find() para resgatar os nomes?

//const filtroLucro = (arr, num) => arr.map(el => el.preco*el.qntVenda).filter(el => el > num);

//R.2: Não. .find() acha apenas o 1º el a corresponder ao parâmetro passado. Ideal seria montar apenas com .filter().


const filtroLucro = (arr, num) => arr.filter (el => el.preco*el.qntVenda > num)

console.log(filtroLucro(controleVenda, 40))


// 4. Classifique todos os produtos pela quantidade de dinheiro que geraram.

//R: Falou em classificar, falou em .sort(). Classificação com base no valor de item.preco*item.qntVenda. Vou usar reverse para começar com maior lucro


const ordenar = arr => arr.sort((a,b) => {
    if (a.preco*a.qntVenda > b.preco*a.qntVenda) {
        return 1; //"b" é alocado em um índice anterior ao de "a" 
    } else if (a.preco*a.qntVenda < b.preco*b.qntVenda) {
        return -1;//"b" é alocado em um índice posterior ao de "a"
    } else {
    return 0;
    }
}).reverse();

//console.log(ordenar(controleVenda));


// 5. Encontre um produto e atribua a ele um novo valor (reutilize o código que permite encontrar o produto pelo nome).

const novoPreco = (arr, nome, num) => {
    let item = arr.find(el => el.nome === nome);
    item.preco = num.toFixed(2);
    return 'O novo preço para '+item.nome+' é de: R$ '+item.preco;
};

console.log(novoPreco(controleVenda, 'Abóbora', 6.50));


// 6. Calcule o lucro total após pagar 45% do lucro em impostos.

//R: lucroTotal -= lucroTotal*0.45; ou lucroTotal *= 0.55; ou, ainda (caso impostos fossem variáveis), lucroTotal *= 1-impostos;

const receitaLiq = arr => {
    let receitaBruta = arr.map(el => el.preco*el.qntVenda).reduce((total, el) => total + el)
    return Math.round(receitaBruta*0.55).toFixed(2);
};

console.log(receitaLiq(controleVenda));