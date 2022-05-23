# Prática: Programação lógica em Prolog


## Objetivos
Nesta prática, você vai ter um primeiro contato com fatos, regras, consultas em Prolog.



## Pré-Requisitos

Antes de fazer esta prática, você deve consultar os slides disponibilizados sobre "Introdução à programação lógica" e "Introdução à linguagem Prolog: fatos, regras, consultas e variáveis".


## Aquecimento

Vamos usar o SWI-Prolog online no ambiente SWISH: https://swish.swi-prolog.org/

No primeiro acesso ao SWISH, clique em "(Create a) Program" para abrir o editor. Na área de edição que vai aparecer, copie a seguinte base de fatos e regras sobre pessoas e localizações geográficas ([prolog01.pl](prolog01.pl)):

   ```prolog
   localizado_em(santa_maria, rs). 
   localizado_em(salvador, bahia). 
   localizado_em(rs, brasil). 
   localizado_em(bahia, brasil). 
   localizado_em(paris, franca). 
   localizado_em(franca, europa). 
   
   nasceu_em(andre, santa_maria). 
   nasceu_em(joao, salvador). 
   nasceu_em(X, Y) :- localizado_em(Z, Y), nasceu_em(X, Z). 
   
   mora_em(andre, paris). 
   mora_em(joao, salvador). 
   mora_em(X, Y) :- localizado_em(Z, Y), mora_em(X, Z). 

   idade(andre, 25). 
   idade(joao, 32). 

   gaucho(X) :- nasceu_em(X, rs). 
   brasileiro(X) :- nasceu_em(X, brasil). 
   europeu(X) :- nasceu_em(X, europa).
   ```


Para outras práticas, você pode continuar usando o SWISH ou fazer download do [SWI-Prolog](https://www.swi-prolog.org/Download.html) para usá-lo localmente. Para ver um resumo de comandos úteis no SWI-Prolog, consulte este [cheatsheet](https://github.com/alhassy/PrologCheatSheet).

<!-- Depois de tentar um primeiro contato com um desses ambientes, veja este [vídeo](https://drive.google.com/file/d/13mAGl5BLEcruIgG7tLuxa2TnoeRKQdx5/view?usp=sharing) que explica o programa e sua execução no SWISH.
-->

## Exercícios

1. Depois de copiar o programa para o editor, execute cada uma das consultas abaixo na área de consulta interativa (?-). Observe as respostas e compare-as com os fatos e regras do programa.

   ```prolog
   ?- europeu(andre).
   ?- gaucho(andre).
   ?- brasileiro(X).
   ```
   Obs.: Quando a resposta estiver acompanhada de botões, clique em "Next" no SWISH para ver as próximas. Se estiver usando o SWI-Prolog localmente e a resposta não tiver um ponto no final, tecle ";" após cada resposta para descobrir se existem outras, ou tecle "Enter" (ou ".") após a primeira resposta se quiser continuar sem procurar outras.
   
2. Agora você vai acrescentar fatos ao programa, seguindo o formato dos predicados já definidos (`nasceu_em`, `idade`). Expresse as seguintes afirmações em um ou mais **fatos** Prolog (coloque cada fato antes do primeiro que usar o mesmo predicado):

   ```
   "Joana nasceu em Salvador."
   "Joana tem 22 anos."
   "Michel nasceu em Paris e tem 40 anos." 
   ```
   
3. Expresse as seguintes perguntas sob forma de **consultas** Prolog (teste-as na área de consulta/interpretador):

   ```
   "José nasceu no Brasil?"
   "Quais são as pessoas nascidas na Europa?"
   "Quais são as pessoas com mais de 30 anos?"
   "Quem são os brasileiros com menos de 30 anos?"
   ```
   
4. Crie um predicado `maisVelho(A,B)` que permita deduzir se a pessoa A é mais velha que a pessoa B. Use o predicado `idade`. Exemplo de uso:

   ```prolog
   ?- maisVelho(joao, andre).
   true.
   ```

5. Em Prolog, o operador `is` serve para calcular uma expressão aritmética e atribuir seu valor a uma variável, como nos exemplos abaixo:

   ```prolog
   soma(A,B,C) :- C is A + B. 
   pred(A,B,C) :- X is (A+B)^2, C is X*2-1.
   ```
   
   Sabendo disso, incorpore os predicados acima ao programa e verifique qual será o resultado das consultas abaixo:

   ```prolog
   ?- soma(8,9,3).
   ?- pred(3,2,X).
   ```

6. Usando o operador `is`, crie um predicado `anoNasc(P,A)` que permita deduzir o ano aproximado de nascimento (A) de uma pessoa (P). Use o predicado idade e o ano corrente como referência. Exemplo de uso: 

   ```prolog
   ?- anoNasc(joao, A).
   A = 1989.
   ```
   
7. Em Prolog, listas são tipos de dados nativos e são representadas com colchetes, assim como em Haskell. Existem também vários predicados pré-definidos que manipulam listas. O predicado [`length`](https://www.swi-prolog.org/pldoc/man?predicate=length/2) é um exemplo disso. Dada uma lista, este predicado obtém ou verifica o comprimento da lista. Teste as consultas abaixo com o predicado `length`.

   ```prolog
   ?- length([a,b,c], L).
   ?- length([], X).
   ?- length(a, X).
   ?- length([a,b,c], 2).
   ```


8. O predicado [`findall`](https://www.swi-prolog.org/pldoc/doc_for?object=findall/3) cria uma lista de valores que satisfazem uma consulta. Teste as consultas abaixo com este predicado:
   ```prolog
   ?- findall(Age,idade(_,Age), List).
   ?- findall(B,brasileiro(B), List).
   ?- findall(P,mora_em(P,brasil), List).
   ```

9. Considerando os predicados pré-definidos mostrados acima, deduza o que está definido no predicado abaixo: 
   ```
   mystery(M) :-
      findall(Age,idade(_,Age), List),
      sum_list(List,S),
      length(List,L),
      M is S/L.
  ```    

10. Complete este predicado para obter a quantidade de pessoas (representadas no programa) que moram na Europa:
    ```
    count_euro_resid(C) :-
    ```



## Entrega
Esta prática não precisa ser entregue, mas deve ser feita o mais rápido possível.

## Soluções
O arquivo [prolog01-solucao.pl](prolog01-solucao.pl) tem soluções e comentários sobre cada questão.
