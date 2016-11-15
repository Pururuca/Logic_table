Pururuca tabela verdade:
========================

Precisamos de colaboradores! 
----------------------------
Seja um colaborador! 
---------------------



Programa para criar tabela verdade.

|Operações lógicas | operador|
|------------------|---------| 
|	AND        |    +    |     
|	AND        |    &    |     
|	AND        |    &&   | 
|	OR         |    +    | 
|	OR         |    \|   | 
|	OR         |    \|\| | 
|	NEG        |    !    | 



Uso:
====
1) Expressão no programa
-------------------------------
**2$ ./plogica**
<pre>
digite a expressão:
a * b
</pre>

**Saída:**
<pre>
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

</pre>

2) Saída limpa
---------------
**$ ./plogica -c**
<pre>
digite a expressão:
a + b
</pre>
**Saída:**
<pre>
expressão:
a + b


  a   b   SAIDA
  0   0     0 
  1   0     1
  0   1     1 
  1   1     1 
</pre>
3) Saída limpa com resultado marcado(=)
----------------------------------------
**$ ./plogica -mc**

<pre>
digite a expressão:
a1 & a2 
</pre>
**Saída:**
<pre>
expressão:
a1 & a2


  a1   a2   SAIDA  
   0    0    =0    
   1    0    =0    
   0    1    =0    
   1    1    =1    
</pre>
Casos práticos de uso(UNIX-LIKE): 
==================================
Selecionar todas as entradas que resultem saída 0 (expressão fora do programa):
------------------------------------------------------
**$ echo "a1 + (b1*a2) + (a1 + \!a2 * \!b1 * b3)" | ./plogica -mc | grep '=0'**

**Saída:**
<pre>
digite a expressão:
   0    0    0    0    =0    
   0    1    0    0    =0 
   0    0    1    0    =0    
   0    1    0    1    =0    
   0    0    1    1    =0 
</pre>
Selecionar  todas as entradas que resultem saídas  1:
------------------------------------------------------
**$ ./plogica -mc | grep '=1'**

**Saída**
<pre>
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
</pre>


O que Falta Fazer?
-------------------

1- colocar cada função em um arquivo separado

2- Substituir variaveis globais por locais

3- melhorar regras do scanner para caracteres inválidos (que não tem utilidade no programa)
