/**
 * Trabalho de compiladores - UFBA
 * Discentes: Danilo Pires, Lucas Borges.
 *
 * Objetivo: Projetar e construir um compilador consistindo nos seguintes modulos: analisador lexico,
 * analisador sintatico/semantico, e gerador de codigo.
 * Requisitos para implementacao do compilador:
 * Deve ser implementado em C/C++
 * Deve rodar no ambiente Linux/Unix
 * Pode usar ferramentas automaticas (Lex/Flex & Yacc/Bison)
 *
 * O compilador devera' ser implementado de forma a receber dois parametros/argumentos (argv).
 * O primeiro argumento sera' o arquivo em codigo fonte como entrada (e.g., prog.l) e o segundo argumento sera'
 * o arquivo de saida (e.g., prog.s) onde sera' gravado o codigo em assembly MIPS:
 * $ ./compilador prog.l prog.s
 * Para executar e avaliar os resultados gerados pelos programas da linguagem alvo (assembly) iremos usar um simulador
 * de MIPS chamado SPIM.
 */

#include <stdio.h>
#include <stdlib.h>

int main(){
    printf("Saída analizador léxico:\n");
//    rodar pelo terminal pois a IDE cria uma sandbox e não acha o arquivo
    system("cat tokens.txt");

    return 0;

}