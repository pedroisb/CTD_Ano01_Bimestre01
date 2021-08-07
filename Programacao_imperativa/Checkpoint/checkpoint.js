const pratos = ['Pipoca', 'Macarrão', 'Carne', 'Feijão', 'Brigadeiro'];
const tempo = [10, 8, 15, 12, 8];

let cozinhando = (prato, segundos) => {
    let mensagem = '\nPrato pronto. Tenha um bom apetite!'
    if(segundos < tempo[prato-1]*2 && segundos >= tempo[prato-1]) {
        mensagem = `${pratos[prato-1]} ficou pronto em ${segundos} segundos! ` + mensagem;
    } else if(segundos >= tempo[prato-1]*2 && segundos < tempo[prato-1]*3) {
        mensagem = `${pratos[prato-1]} queimou em ${segundos} segundos de cozimento. ` + mensagem;
    } else if(segundos >= tempo[prato-1]*3) {
        mensagem = `KABUM!!!` + mensagem
    } else if(segundos < tempo[prato-1]) {
        mensagem = `O tempo de ${segundos} segundos é insuficiente. ${pratos[prato-1]} ainda não está pronto.` + mensagem
    } else {
        mensagem = 'Opção incorreta. Prato inexistente.'
    }   
    return mensagem;
};

console.log(cozinhando(1, 12));
console.log(cozinhando(6, 12));
console.log(cozinhando(5, 20));
console.log(cozinhando(3, 60));
console.log(cozinhando(2, 12));
console.log(cozinhando(4, 5));