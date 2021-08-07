//1) Criar let filmes e acessar 'clube da luta'

let filmes = ["star wars", "clube da luta", "o poderoso chefão", "top gun",
"interestelar"];

console.log(filmes[1]);

//2) Colocar todos os elementos em letras maiúsculas

let stringFilmes = filmes.toString();
console.log(stringFilmes);

console.log(stringFilmes.toUpperCase());

/*3) e 4) criar array cartoons
e uma função que adicione cada elemento deste array a filmes*/

let cartoons = ["toy story", "Procurando Nemo", "kung-fu panda", "wally",
"fortnite"]

let listaCompleta = filmes.concat(cartoons);
console.log(listaCompleta);

//5) Eliminar última elemento do novo array

listaCompleta.pop();
console.log(listaCompleta);

/*6) criar uma função que compare as notas e nos diga se elas são iguais ou diferentes. 
Eles confirmam que estão na respectiva ordem e que trazem apenas valores numéricos de 1 a 10.*/

const asiaScores = [8, 10, 6, 9, 10, 6, 6, 8];
const euroScores = [8, 10, 6, 8, 10, 6, 7, 9];

//for (início; condição; modificador) {}
//forEach?
//If else?

for (let i = 0; i <= 7; i++){
    if (asiaScores[i] !== euroScores[i]){
        console.log('Notas Diferentes!');
    } else {
        console.log('Notas Iguais!');
    }
}