function Aluno (nome, faltas, notas) {
    this.nome = nome;
    this.faltas = faltas;
    this.notas = notas;
    this.calcMedia = function () {
        return (this.notas.reduce((total, el) => total+el)/this.notas.length).toFixed(2);
    };
    this.somaFaltas = function () {
        return ++this.faltas;
    };
};

module.exports = Aluno;