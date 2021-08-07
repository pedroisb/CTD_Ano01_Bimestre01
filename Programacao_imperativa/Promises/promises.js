// Micro Desafio 1
// Dado o seguinte código de leitura de arquivos com FileSystem, necessitamos modificá-lo para a sintaxe de Promises, de modo que possamos ver os arquivos corretamente através do console.

const fs = require('fs');

// fs.readFile('./file.json', (err, content) => {
//     if (err) {
//         console.log(err); //reject entra aqui
//     } else {
//         console.log(JSON.parse(content)); //resolve entra aqui
//     }
// });

const lerArq = arq => new Promise ((resolve, reject) => {
    fs.readFile(arq, (err, content) => {
        if (err) {
            reject(err);
        } else {
            resolve(content);
        };
    });
});

// lerArq('file.json')
// .then(content => console.log(JSON.parse(content)))
// .catch(err => console.log(err));



// Micro Desafio 2
// Agora temos um código com callbacks aninhados e precisamos executá-los todos ao mesmo tempo — com as funções de callbacks não poderíamos fazer isso —. Precisamos usar o método Promise.all() para poder transcrever nossos callbacks aninhados em Promises e obter por console os 3 arquivos lidos e impressos por eles.

// function leitorDeArquivosMultiplos(){
//     return fs.readFile('file.json', (err, data1) => {
//         fs.readFile('file2.json', (err, data2) => {
//             fs.readFile('file3.json', (err, data3) => {
//                 console.log(JSON.parse(data1));
//                 console.log(JSON.parse(data2));
//                 console.log(JSON.parse(data3));
//             });
//         });
//     });
// }
    
// leitorDeArquivosMultiplos()


// Promise.all([lerArq('./file.json'), lerArq('./file2.json'), lerArq('./file3.json')])
// .then(content => console.log(String(content))) //com JSON.parse não funcionou. Por quê? Pesquisar.
// .catch(err => console.log(err));


// Micro Desafio 3
// Em um arquivo, cole o código abaixo. Em seguida, exporte a função promessa e importe-a em um arquivo diferente. Por fim, precisamos ler o arquivo file.json após os segundos especificados na função.

const promessaImportada = require('./modPromise');

promessaImportada()
.then(resolve => lerArq('./file.json')
.then(content => console.log(String(content))));