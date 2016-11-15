Pururuca tabela verdade:

Precisamos de colaboradores! 
Seja um colaborador! 




Programa para criar tabela verdade.

|Operações lógicas | operador|
|	AND        |    +    |     
|	AND        |    &    |     
|	AND        |    &&   | 
|	OR         |    +    | 
|	OR         |    |    | 
|	OR         |    ||   | 
|	NEG        |    !    | 

Ex:

1)
./plogica
digite a expressão:
a * b


Saída:
expressão:
a * b


+---+---+-------+
| a | b | SAIDA |
+---+---+-------+
| 0 | 0 |   0   |
+---+---+-------+
| 1 | 0 |   0   |
+---+---+-------+
| 0 | 1 |   0   |
+---+---+-------+
| 1 | 1 |   1   |
+---+---+-------+


2)
./plogica -c
digite a expressão:
a + b

Saída:
expressão:
a + b


  a   b   SAIDA
  0   0     0 
  1   0     1
  0   1     1 
  1   1     1 

3)
 ./plogica -mc
digite a expressão:
a1 & a2 

Saída: 
expressão:
a1 & a2


  a1   a2   SAIDA  
   0    0    =0    
   1    0    =0    
   0    1    =0    
   1    1    =1    

Casos práticos de uso(UNIX-LIKE): 

Selecionar todas as entradas que resultem saída 0:
echo "a1 + (b1*a2) + (a1 + \!a2 * \!b1 * b3)" | ./plogica -mc | grep '=0'

SAÍDA:

digite a expressão:
   0    0    0    0    =0    
   0    1    0    0    =0 
   0    0    1    0    =0    
   0    1    0    1    =0    
   0    0    1    1    =0 

Selecionar  todas as entradas que resultem saídas  1:
./plogica -mc | grep '=1'

digite a expressão:
a1 + (b1*a2) + (a1+!a2*!b1*b3)          
   1    0    0    0    =1    
   1    1    0    0    =1    
   1    0    1    0    =1    
   0    1    1    0    =1    
   1    1    1    0    =1    
   0    0    0    1    =1    
   1    0    0    1    =1    
   1    1    0    1    =1    
   1    0    1    1    =1    
   0    1    1    1    =1    
   1    1    1    1    =1  



O que Falta Fazer?

1- colocar cada função em um arquivo separado
2- Substituir variaveis globais por locais
3- melhorar regras do scanner para caracteres inválidos (que não tem utilidade)
