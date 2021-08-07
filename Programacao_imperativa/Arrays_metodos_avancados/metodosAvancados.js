// 1. Crie um array de números pares, e utilizando a função .map() nesse array, crie um novo array com apenas números ímpares.

const pares = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20];

const impares = pares.map(num => --num);

console.log(impares);

// 2. Crie um array de nomes, que possua dois índices com o nome Maria. Utilize o .filter() para obter apenas esses dois índices com o nome Maria.

const nomes = ['João', 'Pedro', 'Maria', 'Lucas', 'Felipe', 'Gustavo', 'Maria'];

const duasMarias = nomes.filter(item => item == 'Maria');

console.log(duasMarias);

// 3. Crie um array de números e utilize a função .reduce() para devolver uma string com os números formatados.
// Exemplo [1,5,9,3,7] => “1 – 5 – 9 – 3 – 7”

const numeros = [23, 56, 7, 893, 1, 68];

const formatados = numeros.reduce((total, el) => total = total+' '+el);

console.log(formatados);

// 4. Crie um array de animais, após isso passe por cada índice utilizando o .forEach() e imprima a frase “O animal é NOME_DO_ANIMAL”.

const zoo = ['Gorila', 'Jiboia', 'Leão', 'Urso', 'Girafa', 'Arara'];

const apresentaAnimal = zoo.forEach(animal => console.log('O animal é '+animal));
