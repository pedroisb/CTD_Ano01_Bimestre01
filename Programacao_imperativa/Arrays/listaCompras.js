let listaCompras = ['maçã', 'água sanitária' , 'café', 'pão'];

//join
console.log('Reúne os elementos do array usando um separador determinado');
console.log(listaCompras.join('; '));
console.log(listaCompras);

//pop
console.log('Elimina o último elemento e o retorna');
console.log(listaCompras.pop());
console.log(listaCompras);

//push
console.log('Adiciona um ou mais elementos ao final do array e retorna seu novo comprimento');
console.log(listaCompras.push('tapioca', 'leite'));
console.log(listaCompras);

//shift
console.log('Elimina o primeiro elemento do array e o retorna');
console.log(listaCompras.shift());
console.log(listaCompras);

//unshift
console.log('Adiciona um ou mais elementos ao array e retorna seu novo comprimento');
console.log(listaCompras.unshift('sal', 'açúcar'));
console.log(listaCompras);