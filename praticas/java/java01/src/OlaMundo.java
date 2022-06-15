/** 
 * Esta classe implementa uma versao em Java do programa que
 * imprime "Ola, <colega>!" na saida padrao.
 */
import java.util.Random;
import java.util.Collections;
import java.util.Arrays;

class OlaMundo {
  public static void main(String[] args) {
    String[] names = {"Alfredo", "Alice", "Eduardo F.", "Eduardo M.", 
                      "Flavio", "Gilson", "Gregori", "Jhuan", "Joao Carlos", 
                      "Joao Davi", "Luana", "Luis Henrique", "Matheus",
                      "Mauro", "Pedro Henrique", "Ramon", "Raul", "Roberto",
                      "Andre", "Henrique", "Ivan", "Lucas", "Miguel", "Yuri"};
    Random generator = new Random();
    int randomIndex = generator.nextInt(names.length);                      
    System.out.println("Qual colega vai receber um Olá?");
    System.out.println("Olá, " + names[randomIndex] + "!"); // imprime mensagem
    
    // System.out.println("Hora de cumprimentar toda a turma!");
    // Collections.shuffle(Arrays.asList(names));
    // for (String name : names) {
    //   System.out.println("Ola, " + name + "!");
    // }
  }
}
