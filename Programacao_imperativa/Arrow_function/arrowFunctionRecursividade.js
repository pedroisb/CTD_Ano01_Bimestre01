/*O tech leader da equipe precisa criar um código onde seja calculado o número fatorial de um valor inteiro. 
Para isto, deveremos:
● Criar uma função que calcula o fatorial usando loop (for);
● Recriar esta mesma função usando recursividade (sem o uso de for)*/

//com Loop

const fatoriaLoop = num => {
    let fator = 1;
    for (let i = num; i > 0; i--) {
        fator *= i   
    }
    return fator;
};


//sem Loop (com Recursividade)

const fatorialRec = num => {
    if (num == 0 || num == 1){
        return 1
    } else {
        return num*fatorialRec(--num);
    };
};