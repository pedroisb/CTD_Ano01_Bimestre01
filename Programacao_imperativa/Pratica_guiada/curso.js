//const Aluno = require('./funcAluno'); devo importar?

let curso = {
    nome: 'Curso',
    notaAprovacao: 7,
    faltasMax: 3,
    listaEstudantes: [],
    addAluno: function (...alunos) {
        return this.listaEstudantes.splice(0, 0, ...alunos);
    },
    aprovacao: function (nome) {
        let estudante = this.listaEstudantes.find(el => el.nome == nome);
        if ((estudante.faltas < this.faltasMax)&&((estudante.calcMedia()) >= this.notaAprovacao)){
            return true;
        } else if ((estudante.faltas  == this.faltasMax)&&(estudante.calcMedia()) >= (this.notaAprovacao)*1.10){
            return true;
        } else {
            return false;
        };
    },
    listaAprovados: function () { //alterada para remeter nome dos aprovados para array. alterado nome do método para ficar mais claro
        let resultados = [];
        for (let i = 0; i < this.listaEstudantes.length; i++) {
           if (this.aprovacao(this.listaEstudantes[i].nome) == true){
               resultados.push(this.listaEstudantes[i].nome);
           }
        }
        return resultados;
    }
};

module.exports = curso;

