# LeaderBoard Challenge!

# 1. O quê?
O desafio consiste em desenvolver um conjunto de classes representando uma LeaderBoard, que possa ser (re-)usada nos diversos jogos criados no T4. 

Este é um desafio opcional para grupos que implementaram os requisitos do T4 e desejam ir além.

# 2. Por quê?
As vantagens da Programação Orientada a Objetos podem ficar mais evidentes quando criamos classes para serem reaproveitadas em diferentes projetos.

# 3. Como?

Uma LeaderBoard requer armazenamento (persistência) de dados de diferentes rodadas de um jogo. Isto pode ser feito com banco de dados e servidores de aplicações, mas também há soluções mais simples.

Para facilitar esta parte, foi criado um web service que escreve/lê dados em uma planilha no Google Sheets (cada jogo fica em uma aba da planilha). Também foram criados 2 exemplos com LibGDX para escrita e leitura dos dados (`postScore` e `getScores`).

Assim, o desafio se divide em 2 etapas: (1) Entender os exemplos fornecidos e (2) Criar um conjunto de classes aproveitando os códigos fornecidos, de forma que possam ser reusadas (e possivelmente estendidas) em diferentes games.


## 3.1 Entendendo os códigos fornecidos

### Onde os dados ficam armazenados?

Esta planilha no Google Sheets foi criada para armazenar uma LeaderBoard em cada aba:

https://docs.google.com/spreadsheets/d/1PwkAISzG2FX2-kd6j5ETP6XaVFqSs9d-Yr6iJgoOqoQ/edit#gid=1688103552

Para adicionar uma aba para seu jogo, o grupo deve entrar em contato com a professora.

### Como escrever dados na planilha?

Para escrever dados na planilha, é preciso enviar uma requisição HTTP com os seguintes parâmetros:

|  Parâmetro  |  Valor  |
|---|---|
| `action` | `postScore` |
| `gameId` | nome do jogo |
| `userId` | nome/id de jogador | 
| `score` | pontuação/tempo |

Abaixo está um exemplo de URL que envia uma requisição de escrita na aba/game `testgame`:
https://script.google.com/macros/s/AKfycby_66cv7hxuwGnRYx2-kZDm4YvlWy0gXiHAgjsO2jSENfWI9OO69mOqjk5goGIEr1rf5Q/exec?action=postScore&gameId=testgame&userId=name&score=7

Para enviar a requisição a partir do código Java, usamos algumas classes para comunicação em rede da libGDX: https://libgdx.com/wiki/networking

Este repositório tem um código de exemplo que envia uma requisição `postScore`: [libgdx-httprequest-postscore](libgdx-httprequest-postscore)


### Como ler dados da planilha?

Para ler dados da planilha, é preciso enviar uma requisição HTTP com os seguintes parâmetros:

|  Parâmetro  |  Valor  |
|---|---|
| `action` | `getScores` |
| `gameId` | nome do jogo |


Abaixo está um exemplo de URL que envia uma requisição de leitura da aba/game `testgame`:
https://script.google.com/macros/s/AKfycby_66cv7hxuwGnRYx2-kZDm4YvlWy0gXiHAgjsO2jSENfWI9OO69mOqjk5goGIEr1rf5Q/exec?action=getScores&gameId=testgame

O resultado desta requisição contém apenas "dados brutos", ou seja, não é feito nenhum agrupamento/ordenação/interpretação dos dados. Todos os dados são tratados como strings no servidor.


Para ler dados a partir do código Java, usamos novamente as classes para comunicação em rede da libGDX (https://libgdx.com/wiki/networking) e também recursos para ler dados em formato JSON (https://libgdx.com/wiki/utils/reading-and-writing-json), que é o formato dos dados retornados pelo web service.

Este repositório tem um código de exemplo que envia uma requisição `getScores`: [libgdx-httprequest-getscores](libgdx-httprequest-getscores)

## 3.2 Criando um conjunto de classes reusáveis

Depois de entender os códigos fornecidos, é hora de desenvolver uma solução que funcione no seu jogo, mas que também possa ser aproveitada em outros jogos da turma.

Algumas dicas:

1. O envio de requisições `postScore` e `getScores` é aproveitável por diferentes jogos, mas precisa ser encapsulado de outra forma (não deve ficar implementado na classe MyGdxGame como nos exemplos).

2. O código que configura os parâmetros das requisições deve permitir variar os valores de `userId` e `score`. Cada jogo terá um único `gameId`.

3. A leitura dos dados retornados pelo `getScores` pode continuar usando a conversão automática de JSON para uma classe. Outra opção, mais flexível mas um pouco mais trabalhosa, é fazer a conversão por partes, usando métodos que percorrem o JSON para obter valores de cada atributo, e a partir disso instanciar cada objeto. 

4. O uso dos dados retornados pelo `getScores` vai exigir algum processamento (por exemplo, agrupar, ordenar, filtrar, etc.). Isso pode ser feito usando Collections do Java e também pode ser aproveitado entre diferentes jogos. 

5. Cada jogo pode adotar diferentes interpretações dos scores (pontuação? tempo?). Como o web service só retorna strings, pode ser necessário converter os scores para números antes de ordená-los, compará-los, etc.
