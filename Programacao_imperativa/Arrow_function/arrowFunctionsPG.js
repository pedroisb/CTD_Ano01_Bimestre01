// Transformar as funções a seguir em arrow functions


//01

// function print(mensagem){
//     console.log(mensagem)
//   }
  
//   print("Olá, bom dia")


let print = (mensagem) => console.log(mensagem);

print('Olá, bom dia!');


//02

// function soma(n1, n2){
//     return n1 + n2
//   }
  
//   console.log(soma(10, 10))

let soma = (n1, n2) => n1+n2;

console.log(soma(10,10));