import java.sql.Connection;
import java.util.Scanner;

public class Menu {
    private static void imprimirOpcoes() {
        // wait for 2 seconds
        System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
        System.out.println("-=-=-=-=-=-=-=-=-=-=-=FUNCIONALIDADES=-=-=-=-=-=-=-=-=-=-=-");
        System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
        System.out.println("1 -> Inserir novo voluntario");
        System.out.println("2 -> Buscar voluntários por nome");
        System.out.println("0 -> Sair");
        System.out.println("Digite o número referente a operação desejada.");
    }

    private static void inserirVoluntario(Connection conexao) {
        // Cria objeto voluntário, lê os dados do terminal e tenta fazer a inserção no banco.
        Voluntario voluntario = new Voluntario();
        voluntario.lerDoTerminal(conexao);
        try {
            Voluntario.inserirVoluntario(conexao, voluntario);
            System.out.println("Usuario inserido com succeso!");
        } catch (Exception e) {
            System.out.println("Erro ao inserir voluntário no banco de dados.\n" + e.getMessage());
        }
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
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        in.close();
    }
}
