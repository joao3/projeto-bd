import java.sql.Connection;
import java.util.Scanner;

public class Menu {
    private static void imprimirOpcoes() {
        System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
        System.out.println("-=-=-=-=-=-=-=-=-=-=-=FUNCIONALIDADES=-=-=-=-=-=-=-=-=-=-=-");
        System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
        System.out.println("1 -> Inserir novo voluntario");
        System.out.println("0 -> Sair");
        System.out.println("Digite o número referente a operação desejada.");
    }

    private static void inserirVoluntario(Connection conexao) {
        // Cria objeto voluntário, lê os dados do terminal e tenta fazer a inserção no banco.
        Voluntario voluntario = new Voluntario();
        voluntario.lerDoTerminal();
        Consultas.inserirVoluntario(conexao, voluntario);
    }

    public static void menu(Connection conexao) {
        System.out.println("MENU ONG INGLES");

        Scanner in = new Scanner(System.in);

        boolean sair = false;
        while (!sair) {
            imprimirOpcoes();

            // Decodifica operação inserida
            int operacao = in.nextInt();

            switch (operacao) {
                case 1 -> inserirVoluntario(conexao);
                case 0 -> sair = true;
                default -> System.out.println("Operação desconhecida.");
            }
        }
    }
}
