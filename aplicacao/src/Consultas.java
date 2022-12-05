import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Consultas {
    public static void inserirVoluntario(Connection conexao, Voluntario voluntario) throws Exception {
        // Cria objeto para realizar a declaração SQL.
        String sql = "INSERT INTO Voluntario VALUES(?, ?, ?)";
        PreparedStatement st = null;
        try {
            st = conexao.prepareStatement(sql);
        } catch (SQLException e) {
            throw new Exception("Erro ao criar declaração no banco de dados.\n" + e.getMessage());
        }

        try {
            // Substitui os caracteres coringas '?' da query.
            st.setString(1, voluntario.getCpf());
            st.setString(2, voluntario.getNome());
            st.setDate(3, Date.valueOf(voluntario.getDataNascimento().toString()));
        } catch (SQLException e) {
            throw new Exception("Erro ao adicionar parâmetros à consulta no banco de dados.\n" + e.getMessage());
        }

       // Tenta executar a query e fechar o objeto da declaração.
        try {
            st.execute();
        } catch (SQLException e) {
            throw new Exception("Erro ao executar declaração no banco de dados.\n" + e.getMessage());
        } finally {
            try {
                st.close();
            } catch (SQLException e) {
                throw new Exception("Erro ao fechar declaração.\n" + e.getMessage());
            }
        }
    }
}
