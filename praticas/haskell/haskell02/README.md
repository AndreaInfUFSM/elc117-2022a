# Prática: Programação funcional em Haskell


## Objetivos 


Nesta aula, vamos trabalhar com **funções de alta ordem** e com **funções anônimas**, que são recursos típicos da programação funcional. Antes desta prática, veja no [repositório da disciplina](../../../README.md) o material sobre esses assuntos.



## Repositório de Entrega

Você vai continuar entregando seus exercícios no GitHub, como na primeira prática, só que em outro repositório.

Clique aqui para criar seu repositório desta prática de Haskell: https://classroom.github.com/a/KfpU0sbj


## Relembrando o ambiente de execução


- Para estes exercícios, você vai continuar usando o ambiente GHC, que inclui um compilador/interpretador para Haskell. Vamos usar o ambiente interativo, que você abre digitando `ghci` num terminal (shell).

- Usar o ambiente **interativo** é uma boa opção para testar/prototipar funções. Basta escrever chamadas de funções na linha de comando para executá-las e obter o resultado.

- Para além do teste de funções, nossos códigos Haskell sempre ficarão em arquivos, por exemplo `haskell02warmup.hs`.

- Para **executar** um programa, ele precisa ser **carregado** no GHCi. Em um terminal de comandos, podemos carregar um programa digitando, por exemplo: `ghci haskell02warmup.hs`. 

- Lembre que, se você alterar o arquivo `.hs`, você precisará carregá-lo novamente no GHCi. 

- Alguns comandos úteis:
  - Para carregar um programa depois de abrir o GHCi: `Prelude> :load main.hs` ou `Prelude> :l main.hs`.
  - Para sair do interpretador: `Prelude> :q` ou `Ctrl-D`.
  - Setas Up e Down ajudam a acessar o histórico de comandos para não ter que redigitá-los.


## Aquecimento


Estes exercícios não precisam ser entregues. São apenas um aquecimento.

1. Abra o programa [haskell02warmup.hs](haskell02warmup.hs) que está no repositório da prática. Observe que ele contém as funções abaixo:

   ```haskell  
   square :: Int -> Int
   square x = x^2
  
   squareAll :: [Int] -> [Int]
   squareAll lis = map square lis 
   
   useHaskell :: String -> String
   useHaskell fulano = fulano ++ ", use Haskell!"
   
   sejamFelizes :: [String] -> [String]
   sejamFelizes pessoas = map useHaskell pessoas
   
   doutor :: String -> Bool
   doutor nome = (take 2 nome) == "Dr"
   
   adulto :: Int -> Bool
   adulto idade = idade >= 18
   ```

2. Qual será o resultado das aplicações de funções abaixo? Confira no interpretador.

   ```haskell  
   squareAll [1,2,3]
   filter (>10) (squareAll [2, 3, 4])
   filter (\x -> square x > 10 && square x < 30) [1, 2, 3, 4, 5, 6]
   sejamFelizes ["Harry", "Hermione"]
   filter adulto [4, 10, 18, 24, 9]
   filter doutor ["Mr. Hyde", "Dr. Jekyll", "Dr. Octopus"]
   map (\s -> s ++ ", use Haskell!") (filter doutor ["Mr. Hyde", "Dr. Jekyll"])
   ```
   
3. Abaixo temos operações com listas de **tuplas** em Haskell. Tuplas agrupam dados que podem ser de diferentes tipos, em um único "registro". É algo um pouco semelhante a `struct` em C. Nos exemplos abaixo, temos 2 tuplas de tipo `(String, Int)`. Uma lista com estas tuplas tem tipo `[(String,Int)]`. Você consegue deduzir o resultado de cada linha abaixo? 
   ```haskell  
   filter (\(_,idade) -> idade > 60) [("Fulano", 32),("Beltrano", 64)] -- aqui temos 2 tuplas (String,Int)
   sejamFelizes (map (\(nome,_) -> nome) [("Fulano", 32),("Beltrano", 64)]) 
   ```

## Exercícios de Programação 

Entregue estes exercícios no arquivo `haskell02.hs`.


1. Médicos consideram que um indivíduo tem febre quando sua [temperatura corpórea está acima de 37,8oC](https://drauziovarella.uol.com.br/doencas-e-sintomas/febre/). Escreva uma função `comFebre :: [Float] -> [Float]` que, dada uma lista de temperaturas de indivíduos, selecione aquelas que representam febre. Resolva esta questão definindo uma função auxiliar nomeada, que verifica se uma dada temperatura é febre ou não.

2. Escreva uma função `comFebre' :: [Float] -> [Float]` que resolva a questão anterior usando lambda.

3. Crie uma função `itemize :: [String] -> [String]` que receba uma lista de strings e adicione tags HTML `<li>` e `</li>` antes e depois de cada string. Resolva esta questão usando lambda.

4. Escreva uma função `bigCircles :: Float -> [Float] -> [Float]` que receba um número e uma lista de raios de círculos. Essa função deverá retornar somente aqueles raios de círculos cuja área seja maior que o número passado como argumento.

5. Escreva uma função `quarentena :: [(String,Float)] -> [(String,Float)]` que receba uma lista de tuplas com nomes de pessoas e suas temperaturas corpóreas, e selecione aquelas que têm febre.

6. Escreva uma função `idadesEm :: [Int] -> Int -> [Int]` que receba uma lista de anos de nascimento de algumas pessoas e um ano de referência. A lista resultante terá idades calculadas considerando o ano de referência (idades aproximadas, já que só consideram o ano, não a data completa de nascimento). Resolva esta questão usando **lambda**.

7. Escreva uma função `changeNames :: [String] -> [String]` que receba uma lista de nomes e adicione o prefixo "Super " às strings que começarem com a letra `A` (maiúscula), deixando as demais inalteradas. A lista resultante, portanto, terá a mesma quantidade de strings da lista original.

8. Escreva uma função `onlyShorts :: [String] -> [String]` que receba uma lista de strings e retorne outra lista contendo somente as strings cujo tamanho seja menor que 5.

## Alterando um Programa


Agora vamos trabalhar com um programa em Haskell que gera uma imagem em formato SVG, com 2 círculos (veja a sintaxe para definir um [círculo em SVG](https://www.w3schools.com/graphics/svg_circle.asp)). 
Você vai modificar um código fornecido para gerar uma imagem diferente.

1. Abra o programa [svgSimple.hs](haskell02svg/svgSimple.hs) que está no repositório da disciplina.

2. Execute o programa abrindo-o no GHCi e veja que ele cria um arquivo `circles.svg`. Clique neste arquivo para ver a figura gerada (isso deve abrir o navegador ou um programa de visualização de imagens).

3. Analise o código do programa e identifique os recursos de Haskell que você já conhece e as novidades que apareceram. 

4. Identifique as linhas de código que criam círculos com diferentes características.

5. Modifique o código para gerar uma imagem diferente, com vários círculos com outras características. Confira a sintaxe para definir um [círculo em SVG](https://www.w3schools.com/graphics/svg_circle.asp).

6. Entregue o arquivo `svgSimple.hs` modificado e a figura `circles.svg` gerada pelo seu programa. 

## Para saber mais sobre Haskell

Consulte as seções abaixo no livro [Learn you a Haskell for Great Good!](http://learnyouahaskell.com), de Miran Lipovača:
- [Funções de alta ordem (map, filter, etc.)](http://learnyouahaskell.com/higher-order-functions) 
- [Funções anônimas](http://learnyouahaskell.com/higher-order-functions#lambdas)
- [Tuplas](http://learnyouahaskell.com/starting-out) (procure por Tuples)

