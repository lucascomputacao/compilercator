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
#include <string.h>

int main(int argc, char * argv []){
//    compilar analizador léxico com o lex
    system("lex ruleslexicalAnalyzer.l");
//    compilar o arquivo de regras gerado pelo lex
    system("gcc lex.yy.c -lfl");

//    teste quantidade de argumentos na linha de comando
    if (argc >= 2){
        char command [100];
        strcpy(command,"./a.out < ");
        char sourceFile[30];
        strcpy(sourceFile,argv[1]);
        printf("arquivo código fonte: %s\n", sourceFile);
        strcat(command,sourceFile);
        printf("command: %s\n",command);
        // "./a.out < soucecode"
        system(command);

        printf("\nSAÍDA DO ANALIZADOR LÉXICO:\n");
//    rodar pelo terminal pois a IDE cria uma sandbox e não acha o arquivo
//        arquivo criado pelo analizador léxico com os tokens lidos
        system("cat tokens.txt");
    } else{
        printf("Faltam parâmetros");
    }

    return 0;
}