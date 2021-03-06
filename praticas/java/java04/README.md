# Prática: Herança em Java


## Objetivos
Nesta prática você vai exercitar conceitos relacionados a herança em Java, ao mesmo tempo em que continua a aproveitar o que aprendeu sobre encapsulamento, classes e objetos em Java.

## Pré-requisitos

Consulte os [slides sobre herança](https://docs.google.com/presentation/d/17mn_CtmAb2PVita0lcaveXE0T7ojU2IHTMUn-f47PBE/edit?usp=sharing) antes desta prática.


## Entrega

Esta prática vai ser entregue em um repositório específico no GitHub Classroom. Clique [aqui](https://classroom.github.com/a/umZS6jfv) para criá-lo. 

:warning: Somente a Parte 1 será entregue no repositório. As outras partes são para você pensar sobre conceitos e suas aplicações.

## Parte 1: Compartilhe código

Você terá 2 conjuntos de tarefas:

1. Criar uma **classe-mãe** que servirá de base para uma hierarquia de classes que será completada por colegas. Por exemplo, você pode implementar a classe `Shape` ilustrada nos slides, ou qualquer outra à sua escolha.
   - Esta classe-mãe deve possuir pelo menos um atributo e um método de instância, além de um construtor.
   - O código deve ter comentários sugerindo nomes de classes derivadas que podem ser implementadas.
   - Faça commit-push desta classe no repositório de entrega, para que colegas tenham acesso.

2. Escolher um repositório de colega e fazer o seguinte:
   - em um segundo arquivo, criar uma **classe derivada** da classe que estiver neste repositório.
   - em um terceiro arquivo, criar uma classe que use a classe derivada criada por você.
   - fazer commit-push dos novos arquivos no repositório de entrega que contém a classe-mãe.


## Parte 2: Questões sobre Herança

Baixe o programa [Inheritance.java](src/Inheritance.java). 

1. Qual será a saída deste programa? Tente responder sem executá-lo. Depois compile o programa e execute-o. Comente na resposta se a saída foi igual ou não à que você esperava.

2. Em [Inheritance.java](src/Inheritance.java), inclua o código abaixo na classe `Student`. Este código testa se o nome do estudante começa com um dado caracter.
   ```java
   public boolean checkName(char c) {
     return name.toCharArray()[0] == c;
   }
   ```

3. Compile o programa modificado. O que acontece? Explique.

4. Na classe `Person`, substitua a visibilidade `private` por `protected` e compile novamente o programa. O que acontece?

5. Na classe `Main`, inclua no método `main` uma chamada ao método `checkName` em um objeto da classe `Student`.

6. Crie uma classe `PhDStudent` derivada de `Student`. No seu construtor, mostre uma mensagem na saída padrão para saber quando ele foi chamado.

7. Altere o método `main` para criar um objeto da classe `PhDStudent`. Qual a sequência de construtores chamados?

8. Em Java, todas as classes derivam da classe [`Object`](https://docs.oracle.com/en/java/javase/16/docs/api/java.base/java/lang/Object.html). Consulte os métodos definidos nesta classe e descubra para que servem os métodos `equals` e `getClass`. Teste estes métodos com um objeto da classe `PhDStudent`, inserindo código no método `main` da classe `Main`.


## Parte 3: Herança na LibGDX

A LibGDX é um framework em Java para criação de jogos 2D para múltiplas plataformas (desktop, web, mobile).
No tutorial "Getting Started" deste framework, você encontra a [descrição](https://libgdx.com/dev/simple-game/) de um jogo bem simples, que ilustra tanto o uso da LibGDX como conceitos de POO em Java que você já conhece ou aprenderá mais adiante.

Teste o jogo aqui: http://www.inf.ufsm.br/~andrea/libgdx/ (essa versão do jogo é ligeiramente melhorada, conforme esta outra [descrição](https://libgdx.com/dev/simple-game-extended/)). 


Abra os 2 arquivos que contêm o código do jogo simples para desktop:
   - [desktop/src/com/badlogic/drop/DesktopLauncher.java](https://github.com/AndreaInfUFSM/java-libgdx-simple-drop-example/blob/master/desktop/src/com/badlogic/drop/DesktopLauncher.java) 
   - [core/src/com/badlogic/drop/Drop.java](https://github.com/AndreaInfUFSM/java-libgdx-simple-drop-example/blob/master/core/src/com/badlogic/drop/Drop.java)

Examine os códigos e responda às questões abaixo:

1. Quais as classes definidas nos arquivos DesktopLauncher.java e Drop.java?
2. Explique como o conceito de herança em Java se aplica às classes definidas nestes arquivos.
3. Em qual classe estão os atributos que representam as gotas que "caem" no balde?
4. Quais são os atributos que representam a imagem e a posição das gotas?
5. Em Drop.java, no método `spawnRaindrop()`, o que você consegue deduzir sobre a visibilidade (public, private, protected) do atributo `raindrop.x`?
6. Ainda no método `spawnRaindrop()`, `MathUtils` é um nome de classe ou uma referência para um objeto?
7. Também em `spawnRaindrop()`, por que `lastDropTime` pode ser usado sem estar declarado dentro deste método?
8. O mecanismo de herança permite que uma classe filha aproveite "algo" definido em uma classe mãe. Também se pode dizer que a classe mãe transmite "algo" para a classe filha. O que está sendo transmitido neste exemplo de jogo?



















