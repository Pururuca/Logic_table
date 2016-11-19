#include <stdio.h>
#include "parser.tab.h"
#include "lex.yy.h"
#include <stdbool.h>
#include <string.h>
#include <bitset>
#include <iostream>
#include <math.h>
extern int var;
extern char *T[100];
extern int ReV[100];
extern int RES;
extern bool tab;

bool marca = false;


int strToInt(char a){
if(a == '1')
	return 1;
if(a == '0')
	return 0;
}


void separador(){

	int len;
if(tab){

	for(int i = 0 ; i < var ; i++){
		std::cout << "+-";
	   for(len = 0; T[i][len] != '\0'; ++len)
	   std::cout << "-";
	   std::cout << "-";
	}
	std::cout<<"+-------+\n"; 


}
}

char Marca(){
if(marca)
	return '=';

	return ' ';
}
char espaco(){
	if(tab)
return '|';
return ' ';
}
void PRINT(int inicio){
int len;
	
	if(!inicio){
separador();	
	for(int i = 0 ; i < var ; i++){
		
		std::cout << espaco()<<" " << T[i] << " ";
	}
	std::cout <<espaco() << " SAIDA "<<espaco();
	std::cout << "\n";
separador();
	}


for(int i = 0 ; i < var ; ++i){
	int j;
	for(len = 0; T[i][len] != '\0'; ++len);
	std::cout <<espaco()<<" ";
	for(j = 0 ; j < len/2; j++)
		std::cout << " ";
	std::cout << ReV[i];
	for(j=len/2;j<len;j++)
		std::cout << " ";
}
	std::cout << espaco() <<"  "<<Marca()<<RES<<"   "<<espaco() <<"\n";
separador();
}

int main(int argc, char *argv[]) {

    int opt;

    while ((opt = getopt(argc, argv, "cm")) != -1) {
        switch (opt) {
        case 'c': tab = false; break;
        case 'm': marca = true; break;
        default:
            fprintf(stderr, "Usage: %s [-cm]\n", argv[0]);
            exit(EXIT_FAILURE);
        }
    }


int j=0;
int cic = 0;
for(j=0;j<100;j++)
	ReV[j]=0;
var = 0;
char input[200];
fprintf(stderr,"digite a expressão:\n");
 
while(fgets(input,sizeof(input),stdin)!=NULL){

do{

std::string binary = std::bitset<100>(cic).to_string(); 
    
for( j =0 ; j < var; j++){
	
    ReV[j] = strToInt(binary.at(99-j)); 
}
    
  yyscan_t scanner;
  yylex_init(&scanner); 
  yy_scan_string(input,scanner);
  yyparse(scanner);
  if(var == 0)
	exit(0);
  if(cic==0){
  printf("\n\nexpressão:\n");
  printf("%s",input);
  std::cout << "\n";
  }
  PRINT(cic);
  yyrestart(stdin,scanner);
  cic++;
  yylex_destroy(scanner);
}while(cic <= pow(2,var)-1);

cic = 0;
var = 0;
}
  return 0;
}
