import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Main {
    private static Connection criarConexao() {
        // Define parâmetros de configuração da conexão.
        String url = "jdbc:postgresql://localhost:5432/db-2sem";
        Properties props = new Properties();
        props.setProperty("user", "postgres");
        props.setProperty("password", "Bf7wvnjz");

        // Tenta iniciar a conexão.
        Connection conexao = null;
        try {
            conexao = DriverManager.getConnection(url, props);
        } catch (SQLException e) {
            System.out.println("Erro ao criar conexao com o banco de dados.\n" + e.getMessage());
        }

        return conexao;
    }

    public static void main(String[] args) {
        Connection conexao = criarConexao();

        // Loop do menu com as funcionalidades da aplicação.
        Menu.menu(conexao);

        // Tenta fechar a conexão
        try {
            conexao.close();
        } catch (SQLException e) {
            System.out.println("Erro ao fechar a conexão com o banco de dados.\n" + e.getMessage());
        }
    }
}
