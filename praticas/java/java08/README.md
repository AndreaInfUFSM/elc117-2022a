# Prática: Programação Concorrente em Java


## Objetivos
Nesta prática você vai exercitar mais conceitos de programação concorrente e orientada a objetos em Java. Em particular, vamos trabalhar com **sincronização** de threads, para tratar **condições de corrida** (*race conditions*) no acesso a **dados compartilhados**.

## Pré-requisitos

Antes de fazer a prática, consulte estes [slides](https://docs.google.com/presentation/d/1171OlQiGUxiISPuFaCIF-zHVFpr03_KUa74tyCpZ0sg/edit?usp=sharing) ou [vídeo](https://drive.google.com/file/d/1R4GQbVf_z3b8Rti-SM_ZrjBzI5poQZdD/view?usp=sharing).




## Operações Bancárias


1. Baixe o programa [OperacoesBancarias.java](src/sharedaccount/OperacoesBancarias.java) e analise seu código. Veja que foi usada a palavra-chave `synchronized`, explicada nos slides. Execute o programa algumas vezes e verifique se o resultado é sempre correto (com saldo inicial de 100, 10 depósitos de 100 e 5 retiradas de 50, o saldo final deve ser de 850).

3. Remova os termos `synchronized` dos métodos `deposita` e `retira`. Recompile o programa e execute-o algumas vezes. Verifique se ocorrem execuções com resultado incorreto.
É possível que você execute o programa algumas vezes e não obtenha um resultado incorreto. **Isso não quer dizer que o programa esteja correto!**

4. Para você não se cansar de executar o programa várias vezes, baixe o script [repete-execucao.sh](src/sharedaccount/repete-execucao.sh), que repete a execução de um programa várias vezes e para quando os resultados forem diferentes.
Por exemplo, para repetir a execução 20 vezes, execute no terminal:
   ```
   bash repete-execucao.sh 20 java OperacoesBancarias
   ```

5. Usando o programa original ou o programa no repl.it, capture uma imagem de alguma execução com resultado correto e outra com resultado incorreto. Entregue estas imagens no repositório de entrega, dentro de uma pasta nomeada `OperacoesBancarias`.


## Tabela Compartilhada


1. Baixe e descompacte o arquivo [sharedtable.zip](src/sharedtable.zip), que contém os arquivos para os próximos exercícios (nos slides, isso corresponde ao exemplo `threadabc`).

2. LEIA ISTO AQUI ANTES: Neste programa, **3 threads** `Runner`s atualizam concorrentemente uma **tabela compartilhada**, inserindo caracteres A, B ou C na próxima posição livre. Cada thread insere 20 caracteres, portanto, no final de cada rodada, a contagem de caracteres no array deve ser: A=20 B=20 C=20.

3. Execute o programa várias vezes e observe como a ordem de execução das threads pode variar. Além disso, observe que o resultado final nem sempre é correto (há uma **condição de corrida** que leva a uma **inconsistência de dados**).

4. Corrija o programa, utilizando um método `synchronized`. Para isso, identifique primeiro a classe que representa o objeto compartilhado, depois identifique o método que deve ser executado em exclusão mútua. 

5. Re-execute o programa algumas vezes para verificar a mudança no comportamento das execuções.



## Entrega

Esta prática vai ser entregue em um repositório específico no GitHub Classroom. Clique [aqui](https://classroom.github.com/a/yg1o8n6s) para criá-lo.


Você vai entregar um arquivo `README.md`, em formato [Markdown](https://docs.github.com/pt/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax), com o seguinte conteúdo:

1. Explicação de uma execução concorrente com resultado incorreto: escolha um dos códigos com *race condition* sobre dados compartilhados (Operações Bancárias ou Tabela Compartilhada), mostre um resultado incorreto e explique em detalhes uma execução concorrente que possa produzir tal resultado. Você pode explicar usando um diagrama (como nos slides 7 ou 16) ou em texto (como neste [tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/interfere.html)). **Atenção**: a ideia aqui é explicar um resultado real, não hipotético.

2. Indo além: esta parte é livre para você complementar a prática com algum tópico relacionado que tenha gerado dúvida ou interesse. Por exemplo: Há alguma parte dos códigos que você não entendeu (OO e/ou concorrência)? Você encontrou algo interessante buscando algum material de apoio relacionado? Há alguma parte dos códigos que você poderia reescrever de forma melhorada? Como será que a concorrência está presente em projetos Java de grande porte? Entregue sua pergunta, formule uma resposta (sua visão) e indique referências.

