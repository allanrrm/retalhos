//var nome = "Allan Rezende Moreira";
//var idade = 29;
//var idade2 = 10;
//var frase = "PS5 é o melhor console do mundo"
//alert(nome + " tem " + idade + " anos");
//alert (idade + idade2);
//console.log(nome);
//console.log(idade+idade2);
//console.log(frase.replace("PS5", "Xbox Series X"));
//alert(frase.replace("PS5", "Xbox Series X"));
//console.log(frase.toUpperCase());

//var lista = ["maça", "pera", "laranja"];
//console.log(lista[1]);
//lista.push("uva"); // Adiciona um elemento na lista
//console.log(lista);
// lista.pop(); // Retira o ultimo elemento da lista
// console.log(lista);
// console.log(lista.length);
// console.log(lista.reverse());
// console.log(lista[0]);
// console.log(lista.toString()[0]); //Mostra primeira letra
// console.log(lista.join(" - ")) // altera o separador dos elementos de um array

// var fruta = [{nome:"maça", cor:"vermelha"}, {nome:"uva", cor:"roxa"}];
// console.log(fruta);
// alert(fruta.cor);

// var idade = prompt ("Qual a sua idade?"); // prompt exibe uma caixa de dialogo.
// if(idade > 18){
//    alert("Maior de idade")
// }else{
//    alert("menor de Idade")
// }
/*
var count = 0;

while (count <= 5){
    console.log(count);
    count ++
};
*/
/*
var count;
for (count=0; count <=5; count++){
    alert (count);
}
*/
/*
var d = new Date(); //Traz data atual completa
alert(d.getDay());
*/
/*
function soma(n1, n2){
    return n1 + n2;
}

function setReplace (frase, nome, novo_nome){
    return frase.replace(nome, novo_nome);
}

function validaIdade (idade){
    var validar //variavel local
    if (idade>=18){
        validar = true;
    }else(
        validar = false
    )
        return validar
}

var idade = prompt("Qual sua idade");
console.log(validaIdade(idade));
// alert(setReplace("Vai Japão","Japão","Brasil"));

// alert(soma(5,10));
*/

function trocar(elemento){
    elemento.innerHTML = "e-mail";
}

function voltar(elemento){
    elemento.innerHTML = "allan.rezende@outlook.com"
}

function load(){ //OnLoad
    alert("Pagina carregada");
}
function change(elemento){
    console.log(elemento.value)
}