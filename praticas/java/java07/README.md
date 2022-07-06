# Prática: Programação Concorrente em Java


## Objetivos
Nesta prática você vai exercitar conceitos de programação concorrente e orientada a objetos em Java.

## Pré-requisitos

Antes de fazer esta prática, consulte este material:
- [Introdução à programação concorrente](https://docs.google.com/presentation/d/1qQr7Z4zU-8rvCBOykYSwq0LegSGVs7hip8Yq9Ptyu7Q/edit?usp=sharing) (independente de linguagem)
- [Programação concorrente em Java](https://docs.google.com/presentation/d/1-Iov6eVFL5L2IzsxK0wT_RPjxCSDsgEf9d8wtXnErFI/edit?usp=sharing) (classe Thread, interface Runnable, métodos run, start e join)



## Entrega

Esta prática vai ser entregue em um repositório específico no GitHub Classroom. Clique [aqui](https://classroom.github.com/a/ZMznF5pB) para criá-lo.



## Exercícios

1. Baixe o programa [ThreadRace.java](src/ThreadRace.java). Este programa cria 2 threads concorrentes que representam animais em uma corrida (Rabbit e Turtle), usando as abordagens explicadas nos slides. Compile o programa e execute-o mais de uma vez, observando as saídas. Você conseguiu notar o não-determinismo característico da execução concorrente? 

2. Copie o programa para um arquivo nomeado `AnotherThreadRace.java` e renomeie a classe principal para `AnotherThreadRace`. Acrescente uma terceira classe de animal à corrida e ajuste o método `main` para executar o novo animal em uma nova thread. Para isso, você poderá criar uma classe derivada de `Thread` (como Rabbit) ou implementar a interface `Runnable` (como Turtle).

3. Observe que os métodos `run()` são muito semelhantes. Ou seja, há redundâncias nas classes dos animais, o que é indesejável. Resolva este problema criando um novo programa em um arquivo `BetterThreadRace.java`, contendo uma classe base `AnimalRunner`, da qual serão derivadas as 3 classes de animais. Faça as modificações necessárias para que o novo programa funcione como o anterior.

## Extra

Veja um exemplo de uso de Thread no código-fonte da libGDX: https://github.com/libgdx/libgdx/blob/master/backends/gdx-backend-lwjgl/src/com/badlogic/gdx/backends/lwjgl/LwjglApplication.java (este extra não é "entregável")
