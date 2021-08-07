// Prática Guiada - Parte 1

// Micro desafio - Passo 1
// Crie um objeto aluno que tenha como atributos: nome (string), quantidade de faltas (number) e notas (array de números). Crie um construtor para ele e importe-o como o módulo aluno.


const Aluno = require('./funcAluno');

let alunoPedro = new Aluno ('Pedro', 0, [5, 8, 9, 6, 9.6]);
let alunaGeorgia = new Aluno ('Georgia', 5, [6, 10, 9, 7, 8.5]);
let alunoTiago = new Aluno ('Tiago', 3, [8, 9, 8.5, 6.3, 9.5])

//ALTERNATIVAMENTE:
// let alunos = [
//     new Aluno ('Pipo', 2, [6, 9, 6.5]),
//     new Aluno ('Pepo', 0, [7, 8.7, 2.9]),
//     new Aluno ('Papo', 5, [6.2, 8, 5.5])


// Micro desafio - Passo 2
// Nosso objeto aluno terá o método calcularMedia que retorna a média de suas notas. Também terá um método chamado faltas, que simplesmente aumenta o número de faltas em 1.


console.log(alunoPedro.calcMedia());
alunoPedro.somaFaltas();
console.log(alunoPedro.faltas)
alunoPedro.somaFaltas();
console.log(alunoPedro.faltas)


// Micro desafio - Passo 3
// Em um arquivo diferente, crie o objeto literal curso que tem como atributos: nome do curso (string), nota de aprovação (number), faltas máximas (number) e uma lista de estudantes (um array composto pelos alunos criados no passo 1).


let curso = require('./curso');


// Micro desafio - Passo 4
// Crie o método que permite adicionar alunos à lista do curso, ou seja, quando chamamos nosso método em nosso objeto curso, deverá adicionar um aluno a mais na propriedade lista de estudantes do objeto curso.


let alunaSandra = new Aluno ('Sandra', 0, [6, 9, 5.5, 8, 7.6])
let alunoJose = new Aluno ('José', 1, [2.4, 6, 3.5, 6.2, 8])

curso.addAluno(alunoPedro, alunoTiago, alunaGeorgia);
console.log(curso.listaEstudantes);
curso.addAluno(alunaSandra, alunoJose);
console.log(curso.listaEstudantes);



// Prática Guiada - Parte 2


// Micro desafio - Passo 5
// Crie um método para o objeto curso que receba um aluno (como parâmetro) e retorne true se ele aprovou no curso ou false em caso de reprovação. Para ser aprovado, o aluno tem que ter uma média igual ou acima da nota de aprovação e ter menos faltas que faltas máximas. Se tiver a mesma quantidade, tem que estar 10% acima da nota de aprovação.

console.log(curso.aprovacao('Pedro'));
console.log(curso.aprovacao('Georgia'));
console.log(curso.aprovacao('Sandra'));
console.log(curso.aprovacao('Tiago'));

// Micro desafio - Passo 6
// Crie um método para o objeto curso que percorra a lista de estudantes e retorne um array de booleanos com os resultados se os alunos aprovaram ou não.


console.log(curso.listaAprovados());


// Micro desafio - Passo 7
// Importe o módulo estudantes.js, que contém uma lista de alunos, dentro do arquivo que contém o objeto curso. Substitua o conteúdo da propriedade lista de estudantes, pela lista de estudantes do arquivo estudantes.js e garanta que sigam funcionando todos os métodos corretamente. (revisar que o arquivo tenha todos os métodos corretamente).

