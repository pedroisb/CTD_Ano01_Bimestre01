let pessoa = {
    nome: 'Silas',
    idade: 20,
    andar: 'Andando'
}

let calculadora = {
    cor: 'Cinza',
    somar: function(n1,n2){
        return n1+n2
    },
    subtracao: function(n1,n2){
        return n1-n2
    },
    propriedades: function(){
        return 'A minha soma é '+ this.cor
    }
}

console.log(calculadora.propriedades())