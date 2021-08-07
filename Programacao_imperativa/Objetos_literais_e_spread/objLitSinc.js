/*Exercício 1 - Conta Bancária

1. Defina um novo objeto ‘conta’ que contenha as seguintes propriedades: ----- OK
a. Número de conta
b. Saldo
c. Nome do Titular

2. Crie um método chamado ‘depósito’ que tem a quantidade de dinheiro ----- OK
como parâmetro de entrada. Ao fazer um depósito, a quantia em
dinheiro deve ser adicionada ao saldo existente. O método também
deve imprimir na tela o tipo de transação realizada e o novo saldo.

3. Crie um novo método chamado saque, como o método de depósito, ----- OK
deve consistir em um parâmetro numérico que será a quantia de
dinheiro que queremos sacar. Esta quantia será subtraída do saldo
existente. Caso o valor do saque seja superior ao saldo disponível,
deve-se imprimir na tela a mensagem “Fundos Insuficientes”, caso contrário deve-se
imprimir o tipo de transação realizada e o novo saldo.

4. Crie uma função construtora de nosso objeto de conta. ----- OK

5. Instancie os objetos com diferentes valores iniciais e teste os métodos. ----- OK */

const conta = {
    numeroConta: 0000000,
    saldo: 0,
    nomeTitular: 'a',
};

function Conta (numeroConta, saldo, nomeTitular) {
    this.numeroConta = numeroConta;
    this.saldo = saldo;
    this.nomeTitular = nomeTitular;
    this.deposito = function(dindin) {
        let novoSaldo = this.saldo + dindin;
        console.log('Realizado depósito no valor de: R$ ' + dindin + '\nSeu novo saldo é de: R$ ' + novoSaldo);
        return this.saldo = novoSaldo;
    }
    this.saque = function(dindin) {
        let novoSaldo = this.saldo - dindin;
        novoSaldo >= 0 ? console.log('Realizado saque no valor de: R$ ' + dindin + '\nseu novo saldo é de: R$ ' + novoSaldo) : console.log('Fundos insuficientes.');
        return this.saldo = novoSaldo;
    }
}

const contaJose = new Conta(169579, 10500, 'José Rizério');

console.log(contaJose.numeroConta);
console.log(contaJose.saldo);
console.log(contaJose.nomeTitular);
contaJose.deposito(525);
contaJose.saque(2025);

const contaMaria = new Conta(895513, 790, 'Maria Pereira');

console.log(contaMaria.numeroConta);
console.log(contaMaria.saldo);
console.log(contaMaria.nomeTitular);
contaMaria.deposito(525);
contaMaria.saque(2025);



/*Exercício 2 - Calcular notas
Crie o objeto de aluno, que consistirá nas seguintes propriedades básicas:
● Nome
● Número do arquivo
● Lista de notas
Gostaríamos de calcular a média do aluno e se o aluno foi aprovado com base
na nota de aprovação que será dada. Para este exercício, vamos deixar você
pensar sobre todos os métodos e propriedades que podem ser necessários
para que nosso programa funcione corretamente da maneira solicitada.*/


const aluno = {
    nome: 'Aluno',
    numArquivo: 00,
    listaNotas: [5, 8, 6.5]
};

function Aluno (nome, numArquivo, [listaNotas]) {
    this.nome = nome;
    this.numArquivo = numArquivo;
    this.listaNotas = [listaNotas],
    this.calcMedia = function () {
        let soma = 0;
        for (i = 0; i< this.listaNotas.length; i++) {
            soma += this.listaNotas[i];
        }
        let media = soma/this.listaNotas.length;
        media >= 5 ? 
        console.log(this.nome+' alcançou uma média final de '+media+' e obteve aprovação') :
        console.log(this.nome+' alcançou uma média final de '+media+' e deverá repetir a disciplina')
    } 
};

const alunoTiago = new Aluno ('Tiago', 01, [2.0, 6, 7.5, 3.0, 1.0]);
alunoTiago.calcMedia();

const alunoCarla = new Aluno ('Carla', 02, [8.0, 6.8, 9.0, 8.5, 7.6]);
alunoCarla.calcMedia();




// listaNotas vai ser uma Array
// vou ter que somar todos os elementos e dividilos pelo length  ---> soma todos iterando ou recursivamente
//if ternário com x>=média e console.log aprovado ou reprovado