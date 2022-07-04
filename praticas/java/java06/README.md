# Prática: Classes abstratas e interfaces em Java + libGDX


## Objetivos
Nesta prática você vai trabalhar com classes abstratas e interfaces em Java, usando a biblioteca [libGDX](https://libgdx.com/).

## Pré-requisitos

Antes desta prática, consulte os slides sobre:
- [classes abstratas e interfaces](https://docs.google.com/presentation/d/10YwDdDeV01SucPbewQR63c1pWgbkdLs1NM76psU8v98/edit?usp=sharing)
- [biblioteca libGDX](https://docs.google.com/presentation/d/18k3x_pKYT1mptiTYN74qq5MVoNm9mFv6uAnEbrjzBS4/edit?usp=sharing)


## Entrega

Esta prática vai ser entregue em um repositório específico no GitHub Classroom. Clique [aqui](https://classroom.github.com/a/9pb4S96Y) para criá-lo. 

O repositório criado vai conter o código de um projeto que você vai modificar. Você irá entregar o projeto completo, contendo as modificações e o restante do código não modificado.


## Repositórios com exemplos de códigos

Esta prática requer que você examine 3 repositórios que contêm exemplos de uso da libGDX:
- [java-libgdx-simple-example](https://github.com/AndreaInfUFSM/java-libgdx-simple-example/): exemplo de um projeto libGDX que mostra uma imagem na tela (corresponde ao exemplo gerado pela ferramenta [gdx-setup](https://libgdx.com/wiki/start/project-generation)). É o projeto que você vai modificar!

- [java-libgdx-simple-drop-example](https://github.com/AndreaInfUFSM/java-libgdx-simple-drop-example): exemplo de um jogo bem simples com imagens em movimento e controle pelo teclado, conforme descrito na seção [A Simple Game](https://libgdx.com/dev/simple-game/) do [Wiki](https://libgdx.com/wiki/) da libGDX

- [java-libgdx-extended-drop-example](https://github.com/AndreaInfUFSM/java-libgdx-extended-drop-example): versão melhorada do jogo anterior, conforme descrito na seção [Extending the Simple Game](https://libgdx.com/wiki/start/simple-game-extended) do [Wiki](https://libgdx.com/wiki/) da libGDX

Todos os projetos usam Gradle para gerenciar dependências, compilar e executar os códigos. Você pode importar o projeto no seu IDE favorito com suporte a Gradle e/ou usar linha de comando.

No Linux, execute dentro da pasta do projeto:
```
./gradlew desktop:run
```
No Windows, use:
```
.\gradlw.bat desktop:run
```


## Alterando um projeto

Observe que, em todos os códigos, o comportamento do jogo é definido em métodos `create()` e `render()`, que são sobrescritos (override) em classes derivadas de `ApplicationAdapter` ou `Game`.

Sua tarefa vai ser alterar o [java-libgdx-simple-example](https://github.com/AndreaInfUFSM/java-libgdx-simple-example/), fazendo a imagem se mover para qualquer direção, usando as setas do teclado.

Como fazer isso? Você vai ter que usar classes definidas na libGDX e ilustradas nos exemplos [java-libgdx-simple-drop-example](https://github.com/AndreaInfUFSM/java-libgdx-simple-drop-example) e [java-libgdx-extended-drop-example](https://github.com/AndreaInfUFSM/java-libgdx-extended-drop-example).

Se quiser, você também pode alterar outras partes do código (por exemplo, trocar imagens e cores, etc.).

