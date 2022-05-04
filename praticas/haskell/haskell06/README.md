# Prática: Programação funcional em Haskell


## Objetivos


Nesta aula prática com Haskell, nosso objetivo é usar **recursão** e **pattern matching**.


## Repositório de Entrega 


Clique aqui para criar seu repositório desta prática de Haskell: https://classroom.github.com/a/kMtlvA55



## Aquecimento

Os exercícios abaixo não precisam ser entregues. São apenas um aquecimento.


1. Qual será o resultado das seguintes operações em Haskell? (procure deduzir antes de testar no interpretador)

   ```
   > 2:[4,6]
   > 36:49:[]
   > [2]:[3]:[5]:[7]:[]
   > '0':"1010"
   > (2,4):[(3,9)]
   > "No":["Problem"]
   ```
   
2. As operações abaixo retornam erro no GHCi. Você consegue identificar os motivos?

   ```
   > 'a':[2,3]
   > 1:2:3:[[]]
   > "abra":"cadabra"
   > (5,25):[6,36]
   ```
   


3. A função recursiva abaixo usa o operador de construção de lista (`:`). O que faz esta função?
   ```
   deduzame :: [Integer] -> [Integer]
   deduzame [] = []
   deduzame lst = (2 * head lst) : deduzame (tail lst)
   ```

4. A função recursiva abaixo também usa o operador ':'. Deduza o que faz esta função.
   ```
   deduzame2 :: [Integer] -> [Integer]
   deduzame2 [] = []
   deduzame2 lst = if (head lst) > 2
     then head lst : deduzame2 (tail lst) 
     else deduzame2 (tail lst)
   ```



## Exercícios de Programação


### Parte 1

Entregue os exercícios abaixo no arquivo `haskell06a.hs`. Você deverá criar este arquivo no repositório de entrega.


1. Escreva uma função `ends :: [Int] -> [Int]` que receba uma lista e retorne outra lista contendo o primeiro e o último elementos da primeira lista. Use o operador de construção de lista (`:`).

2. Reescreva a função `deduzame` do Aquecimento usando a notação `(x:xs)` para representar a lista `lst`. Ajuste o restante do código da função. Você verá que o código ficará mais enxuto.


3. Reescreva também a função `deduzame2` do Aquecimento, usando a notação `(x:xs)` para representar a lista `lst`. 


4. Usando **recursão**, escreva uma função `geraTabela :: Int -> [(Int,Int)]` que produza uma lista com `n` tuplas, cada tupla com números de `n` a `1` e seus respectivos quadrados. Exemplo: 

   ```
   > geraTabela 5
   [(5,25),(4,16),(3,9),(2,4),(1,1)]
   > geraTabela 0
   []
   ```

5. Defina uma função **recursiva** que verifique se um dado caracter está contido numa string, conforme os exemplos abaixo:

   ```
   > contido 'e' "andrea"
   True
   > contido 'x' "andrea"
   False
   > contido 'a' ""
   False
   ```
   Obs.: Neste exercício, não vale usar `elem`.
   Obs.: A tipagem da função `contido` é por sua conta!
   
   
6. Defina uma função recursiva `translate`, que receba uma lista de coordenadas de pontos 2D e desloque esses pontos em 2 unidades. A tipagem da função é por sua conta! Confira o exemplo abaixo:

   ```
   > translate [(0.1,0.2),(1.1,6.0),(2.0,3.1)]
   [(2.1,2.2),(3.1,8.0),(4.0,5.1)]
   ```

7. Defina uma função recursiva `countLongs`, que receba uma lista de palavras e retorne a quantidade dessas palavras que tenham mais de 5 caracteres. A tipagem da função é por sua conta! Exemplo de uso:
   ```
   > countLongs ["limao", "banana", "pera", "maracuja"]
   2
   ```

8. Defina uma função recursiva `onlyLongs :: [String] -> [String]` que receba uma lista de palavras e retorne outra lista somente com as palavras que tenham mais de 5 caracteres. Exemplo de uso: 
   ```
   > onlyLongs ["limao", "banana", "pera", "maracuja"]
   ["banana","maracuja"]
   ```

### Parte 2

Entregue esta parte no arquivo `haskell06b.hs`. Você deverá criar este arquivo no repositório de entrega.


Sua tarefa será criar um programa em Haskell que produza uma **imagem em formato SVG**, com N formas **geométricas** (círculos, retângulos, etc.) em posições **(pseudo-)aleatórias**.


Em computação, é comum o uso de geradores de números pseudo-aleatórios, que usam uma fórmula e uma *seed* para calcular uma sequência de números (ou seja, é possível predizer os números, portanto eles não são verdadeiramente aleatórios).

Um algoritmo simples para geração de números pseudo-aleatórios é o LCG (*linear congruential generator*). No site [RosettaCode](https://rosettacode.org/wiki/Linear_congruential_generator) há implementações de 2 geradores LCG populares escritos em várias linguagens, incluindo Haskell.

Em [lcgexample.hs](lcgexample.hs) há um exemplo de código com esses geradores, que você pode aproveitar para realizar este exercício. Veja os comentários no código para executá-lo.




