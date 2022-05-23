

% 2 - Expresse as seguintes afirmações em um ou mais **fatos** Prolog (coloque cada fato antes do primeiro que usar o mesmo predicado):
% "Joana nasceu em Salvador."
% nasceu_em(joana, salvador).
% "Joana tem 22 anos."
% idade(joana, 22).
% "Michel nasceu em Paris e tem 40 anos."
% nasceu_em(michel, paris).
% idade(michel, 40).

% 3 - Expresse as seguintes perguntas sob forma de **consultas** Prolog (teste-as na área de consulta/interpretador):

% "José nasceu no Brasil?"
% ?- brasileiro(jose). 
% false.

% "Quais são as pessoas nascidas na Europa?"
% ?- europeu(X). 
% X = michel ;
% false.

% "Quais são as pessoas com mais de 30 anos?"
% ?- idade(Pessoa, Idade), Idade > 30. 
% Pessoa = michel,
% Idade = 40 ;
% Pessoa = joao,
% Idade = 32.  

% "Quem são os brasileiros com menos de 30 anos?"
% ?- brasileiro(Pessoa), idade(Pessoa, Idade), Idade < 30. 
% Pessoa = andre,
% Idade = 25 ;
% Pessoa = joana,
% Idade = 22 ;
% false.

% 4 - Crie um predicado maisVelho(A,B) que permita deduzir se a pessoa A é mais velha que a pessoa B. Use o predicado idade.
maisVelho(Velho, Novo) :- idade(Velho, IdadeVelho), idade(Novo, IdadeNovo), IdadeVelho > IdadeNovo.
% Dados os nomes Velho e Novo, buscamos a idade de cada um, para depois fazer a comparação.

% 5 - Em Prolog, o operador `is` serve para calcular uma expressão aritmética e atribuir seu valor a uma variável.
soma(A,B,S) :- S is A + B. 
pred(A,B,C) :- X is (A+B)^2, C is X*2-1. % aqui calculamos X a partir de A e B, e C a partir de X
% Verifique qual será o resultado das consultas abaixo:
% ?- soma(8, 9, 3). 
% false.
% ?- pred(3, 2, C).
% 49.

% 6 - Usando o operador is, crie um predicado anoNasc(P,A) que permita deduzir o ano aproximado de nascimento (A) de uma pessoa (P). Use o predicado idade e o ano corrente como referência.
anoNasc(P, A) :- idade(P, I), A is (2022 - I).

% 7 - Em Prolog, listas são tipos de dados nativos e são representadas com colchetes, assim como em Haskell. Existem também vários predicados pré-definidos que manipulam listas. O predicado [`length`](https://www.swi-prolog.org/pldoc/man?predicate=length/2) é um exemplo disso. Dada uma lista, este predicado obtém ou verifica o comprimento da lista. Teste as consultas abaixo com o predicado `length`.
 
%?- length([a,b,c], L).
%L = 3. 

%?- length([], X).
%X = 0.

%?- length(a, X). % erro porque o primeiro argumento deveria ser uma lista

%ERROR: Type error: `list' expected, found `a' (an atom)
%ERROR: In:
%ERROR:    [9] throw(error(type_error(list,a),context(...,_4724)))
%ERROR:    [7] <user>
%ERROR: 
%ERROR: Note: some frames are missing due to last-call optimization.
%ERROR: Re-run your program in debug mode (:- debug.) to get more detail.

%?- length([a,b,c], 2).
%false.


%8 - O predicado [`findall`](https://www.swi-prolog.org/pldoc/doc_for?object=findall/3) cria uma lista de valores que satisfazem uma consulta. Teste as consultas abaixo com este predicado:
      
% ?- findall(Age,idade(_,Age), List).
% List vai conter todos os valores de Age no programa, isto é, todos os valores de idades

% ?- findall(B,brasileiro(B), List).
% List vai conter todos os valores de B no programa, ou seja, todos que são brasileiros

% ?- findall(P,mora_em(P,brasil), List).
% List vai conter todos os valores de P no programa, isto é, todas as pessoas que moram no Brasil
   

% 9 - Considerando os predicados pré-definidos mostrados acima, deduza o que está definido no predicado abaixo: 

%   mystery(M) :-
%      findall(Age,idade(_,Age), List),
%      sum_list(List,S),
%      length(List,L),
%      M is S/L.
% 
% O predicado mystery calcula em M a média de idades das pessoas contidas no programa

% 10 - Complete este predicado para obter a quantidade de pessoas (representadas no programa) que moram na Europa:

count_euro_resid(C) :-
   findall(P,mora_em(P,europa), List),
   length(List,C).




localizado_em(santa_maria, rs). 
localizado_em(salvador, bahia). 
localizado_em(rs, brasil). 
localizado_em(bahia, brasil). 
localizado_em(paris, franca). 
localizado_em(franca, europa). 

nasceu_em(joana, salvador). % adicionado na questão 2
nasceu_em(michel, paris).   % adicionado na questão 2
nasceu_em(andre, santa_maria). 
nasceu_em(joao, salvador). 
nasceu_em(X, Y) :- localizado_em(Z, Y), nasceu_em(X, Z). 

mora_em(andre, paris). 
mora_em(joao, salvador). 
mora_em(X, Y) :- localizado_em(Z, Y), mora_em(X, Z). 

idade(michel, 40). % adicionado na questão 2
idade(joana, 22).  % adicionado na questão 2
idade(andre, 25). 
idade(joao, 32). 

gaucho(X) :- nasceu_em(X, rs). 
brasileiro(X) :- nasceu_em(X, brasil). 
europeu(X) :- nasceu_em(X, europa).
