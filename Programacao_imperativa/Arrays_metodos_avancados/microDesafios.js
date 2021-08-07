// 1) Crie uma função que receba um array composto por números e retorna uma nova matriz (array) com todos os valores divididos pela soma de toda a matriz, usando map() e reduce().

let num = [25, 14, 89, 16, 22, 8];

const divPorSoma = arr => arr.map(el => el/arr.reduce((total, el) => total+el));

//console.log(divPorSoma(num));

// 2) Crie uma função que receba um array de palavras e um número, e que retorna uma matriz (array) com apenas as palavras que têm uma quantidade de letras maior do que o número informado. (verifique como funciona o método filter ())

//para1 = arr[strings, num];
// return = arr[string.length>num]

let letras_Num = ['Paralelepípedo', 'Otorrinolaringologista', 'Bebê', 'Caipirinha', 'Luz', 5];
let letras_Num2 = ['Pato', 'Galinha', 'Boi', 4, 'Búfalo', 'Girino'];

const sopaDeLetras = arr => arr.filter(el => el.length > arr.find(Number));

console.log(sopaDeLetras(letras_Num2));


// 3) Crie um array de objetos literais, onde cada objeto será um aluno e terá dois atributos: nome e nota. Crie duas funções que ordenam o array: uma ordenará os alunos em ordem alfabética e a outra o fará por nota, da mais alta para a mais baixa. (Analise qual método seria apropriado para este caso. Recomendamos que você consulte a documentação do MDN:
// https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array)

const alunos = [
    {nome: 'Fulano', nota: 8.0},
    {nome: 'Sicrano', nota: 4.8},
    {nome: 'Beltrano', nota: 7.5},
    {nome: 'Caio', nota: 6.8},
    {nome: 'Tício', nota: 2.7},
    {nome: 'Mévio', nota: 10}
];

const ordemAlfa = arr => arr.sort((a,b) => {
    if (a.nome > b.nome) {
        return 1; //"b" é alocado em um índice anterior ao de "a" 
    } else if (a.nome < b.nome) {
        return -1;//"b" é alocado em um índice posterior ao de "a"
    } else {
    return 0;
    }
});

console.log(ordemAlfa(alunos));

const ordemNumDec = (arr) => arr.sort((a,b) => { //ordemNum deve ser decrescente. Há 02 opções: a)inverter os retornos "1" e "-1" ou sinais de comparação; b) ou aplicar o método reverse() ao final.
    if (a.nota > b.nota) {
        return 1; //"b" é alocado em um índice anterior ao de "a" 
    } else if (a.nota < b.nota) {
        return -1;//"b" é alocado em um índice posterior ao de "a"
    } else {
    return 0;
    }
}).reverse(); // reverse() aplicado ao final, conforme comentário anterior

console.log(ordemNumDec(alunos));
