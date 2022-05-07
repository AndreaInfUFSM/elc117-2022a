
![pattern.png](pattern.png)
# Trabalho 1: Tem um padrão aqui?




## Motivação
O [raciocínio (ou pensamento) computacional](https://www.bbc.co.uk/bitesize/guides/zp92mp3/revision/1) é um conjunto de habilidades e processos que ajudam a entender e resolver problemas complexos, com ou sem uso de computadores. **Decomposição** e identificação de **padrões** são algumas das técnicas relacionadas ao raciocínio computacional. Muitas esferas educacionais e profissionais, no exterior e no Brasil, apostam no desenvolvimento dessas habilidades desde a infância e em qualquer área do conhecimento, não só para quem se interessa por profissões na área de Computação. Você, como estudante da área, tem domínio dessas técnicas, não é mesmo?! 


Não por acaso, a **programação funcional** se relaciona muito bem com técnicas do pensamento computacional. Decomposição se refere a quebrar um problema complexo em partes menores e mais fáceis de resolver, exatamente como fazemos quando encadeamos funções simples para criar uma mais complexa. Identificação de padrões se refere a procurar características que se repetem, exatamente como fazemos antes de selecionar funções existentes para resolver parte de um novo problema. 

Neste trabalho, você vai mostrar (literalmente) que consegue aplicar decomposição e identificação de padrões. 


## Objetivo
Seu objetivo neste trabalho é produzir um programa capaz de gerar imagens que seguem um padrão visual, usando programação funcional em Haskell.

## Requisitos

1. Cada execução do programa deve gerar uma **imagem parametrizada** pela sua **largura** e por outras características à sua escolha (altura, cores, ou outros parâmetros de acordo com o algoritmo).

2. A imagem de saída do programa deve ser no formato SVG, ou seja, uma imagem vetorial (estática ou até mesmo animada). Esse formato pode ser facilmente gerado com strings, o que facilita o trabalho a partir dos exemplos fornecidos nas aulas.

3. Os parâmetros para a geração da imagem devem ser lidos da linha de comando e passados para as funções que implementam o algoritmo e produzem strings.

4. A função principal do seu programa deve ficar dentro de um arquivo `Main.hs`.


5. O programa deve usar recursos de programação funcional e trabalhar com listas.


6. O código não deve usar valores *hard-coded* para gerar a imagem. Tudo deve ser calculado a partir dos parâmetros recebidos (largura da imagem, etc.). Também é permitido usar números (pseudo-)aleatórios para seleção de cores, formas, posições, etc. (mas não para o tamanho da imagem). 

7. Operações repetitivas devem ser preferencialmente expressas com funções pré-definidas em Haskell (*higher order* ou outras que você pode procurar) e/ou com *list comprehension*. Você também pode usar recursão, mas lembre que em muitos casos isso é desnecessário, pois existem muitas funções pré-definidas que podem ser combinadas para expressar um padrão de repetição.

8. Este trabalho deve ser desenvolvido **individualmente**.


## Dicas de desenvolvimento



- Lembre sempre que você está exercitando **programação funcional**, então resista à tentação de pensar como se estivesse programando numa linguagem procedimental e imperativa como C. 

- Na programação funcional, decompomos um algoritmo "complicado" em diversas funções simples. Uma função chama outra, e assim por diante. Cada função recebe alguns argumentos e produz um resultado, que serve de entrada para outra função. O código de entrada/saída não se mistura às funções que transformam os dados e expressam a lógica do algoritmo. Basicamente, seu programa terá apenas uma função que faz I/O (main) e várias funções que se encadeiam para produzir elementos da imagem.


- Você tem liberdade para trocar ideias com colegas e procurar trechos de código que ajudem no desenvolvimento, mas tenha sempre em mente que as ideias e o código devem ser produções suas. 

- Você deverá entregar código compatível com seus conhecimentos e deverá ser capaz de explicar seu código em detalhes caso solicitado. Se você usar recursos não explicados em aula, busque entender como funcionam. Resista à tentação de copiar trechos de código com sintaxe desconhecida e que você não entende como funciona.

- Se você sentiu dificuldade nos exercícios, procure aproveitar este trabalho para exercitar um pouco mais o que já foi visto nas práticas e não se preocupe tanto em criar imagens com algoritmos complicados.

- Se você realizou os exercícios sem maiores dificuldades, procure se desafiar e ir além do que já conhece. Você também pode conversar com a professora para adaptar alguns requisitos a seus interesses. Só tenha cuidado com o prazo, pois é fácil complicar o trabalho e acabar não atingindo os objetivos.

- Desenvolva seu programa incrementalmente. Procure partir de alguma ideia simples e vá incrementando seu programa, desenvolvendo novas versões a cada vez. Faça commit e push com frequência no GitHub.

- Você deve dar créditos para sites e pessoas que ajudaram. 

## Critérios de Avaliação

A nota neste trabalho será atribuída da seguinte forma:

- 70%: código e funcionamento do programa de acordo com os requisitos
- 30%: originalidade/dificuldade e aprofundamento na programação funcional em Haskell

## Entrega

- Deadline: 17/05/22, até 23h
- Repositório de entrega: https://classroom.github.com/a/d7fQRxze
- Seu repositório de entrega deverá conter:
  - o código desenvolvido e
  - um arquivo `README.md` contendo
    - explicação sobre como executar o programa 
    - exemplo de imagem de saída
    - créditos para sites/pessoas que ajudaram
  


## Material de apoio


- [Tutorial SVG](https://www.w3schools.com/graphics/svg_intro.asp)  
  Tutorial SVG no W3Schools






