// # Desafio da semana #2

// Nesse exercício, você está livre para escolher os nomes para suas variáveis e funções! :smile:

// Crie uma função que receba dois argumentos e retorne a soma dos mesmos.
function soma (n1, n2) {
    return n1+n2;
};

// Declare uma variável que receba a invocação da função criada acima, passando dois números quaisquer por argumento, e somando `5` ao resultado retornado da função.
let somar = soma(10, 2) + 5;
// console.log(somar);

// Qual o valor atualizado dessa variável


// Declare uma nova variável, sem valor.
let semValor;

/*
Crie uma função que adicione um valor à variável criada acima, e retorne a string:
    O valor da variável agora é VALOR.
Onde VALOR é o novo valor da variável.
*/

semValor = function (valor) {
    return `O valor da variável agora é ${valor}`; //template literals -> refere-se à utilização de crases e ${} na string. Mais cômodo e prático.
};



// Invoque a função criada acima.
semValor(10);

// Qual o retorno da função (Use comentários de bloco).
// console.log(semValor(10))



/*
Crie uma função com as seguintes características:
1. A função deve receber 3 argumentos;
2. Se qualquer um dos três argumentos não estiverem preenchidos, a função deve retornar a string:
    Preencha todos os valores corretamente!
3. O retorno da função deve ser a multiplicação dos 3 argumentos, somando `2` ao resultado da multiplicação.
*/

let qualquer = (n1,n2,n3)=>{
    if(n1 == undefined || n2 == undefined || n3 ==  undefined){
        return 'Preencha todos os valores corretamente!'
    } 
    else {
        return (n1*n2*n3)+2
    }
}



// Invoque a função criada acima, passando só dois números como argumento.
// console.log(qualquer(2,3,))

// Qual o resultado da invocação acima (Use comentários para mostrar o valor retornado).
//'Preencha todos os valores corretamente!'

// Agora invoque novamente a função criada acima, mas passando todos os três argumentos necessários.
// console.log(qualquer(5,2,3))


// Qual o resultado da invocação acima (Use comentários para mostrar o valor retornado).
//32

/*
Crie uma função com as seguintes características:
1. A função deve receber 3 argumentos.
2. Se somente um argumento for passado, retorne o valor do argumento.
3. Se dois argumentos forem passados, retorne a soma dos dois argumentos.
4. Se todos os argumentos forem passados, retorne a soma do primeiro com o segundo, e o resultado, dividido pelo terceiro.
5. Se nenhum argumento for passado, retorne o valor booleano `false`.
6. E ainda, se nenhuma das condições acima forem atendidas, retorne `null`.
*/
let miniCalculadora=function (n1,n2,n3){        //-> uma observação: com arrow function arguments.length não funcionou.
    if(arguments.length === 1){
        return n1
    }
    else if (arguments.length === 2){
        return n1+n2
    }
    else if (arguments.length === 3){
        return (n1+n2)*n3
    }
    else if (arguments.length === 0) {
        return false
    }
    return null
}


// Invoque a função acima utilizando todas as possibilidades (com nenhum argumento, com um, com dois e com três.) Coloque um comentário de linha ao lado da função com o resultado de cada invocação.
console.log(miniCalculadora(1))
console.log(miniCalculadora(1,3))
console.log(miniCalculadora(1,3,2))
console.log(miniCalculadora())
console.log(miniCalculadora(1,3,2,4))