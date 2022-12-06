import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Aluno {
    public String cpf;

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getCpf() {
        return this.cpf;
    }

    public void mostrarResultadoEmProvas(Connection conexao) throws Exception {
        // Cria objeto para realizar a declaração SQL.
        String sql = "SELECT id_turma,numero,nota FROM resultadoprova WHERE aluno = ?";
        PreparedStatement st = null;
        try {
            st = conexao.prepareStatement(sql);
        } catch (Exception e) {
            throw new Exception("Erro ao criar declaração no banco de dados.\n" + e.getMessage());
        }

        try {
            // Substitui os caracteres coringas '?' da query.
            st.setString(1, cpf);
        } catch (Exception e) {
            throw new Exception("Erro ao adicionar parâmetros à consulta no banco de dados.\n"
             + e.getMessage());
        }

        // Tenta executar a query e fechar o objeto da declaração.
        try {
            ResultSet rs = st.executeQuery();
            if (!rs.next()) {
                System.out.println("Nenhum resultado encontrado.");
            } else {
                System.out.println("Resultados encontrados:");
                System.out.println("Turma\tNúmero\tNota");
                do {
                    System.out.println(rs.getString(
                        1) + "\t" + 
                        rs.getString(2) + "\t" + 
                        rs.getString(3));
                } while (rs.next());
            }
        } catch (Exception e) {
            throw new Exception("Erro ao executar declaração no banco de dados.\n" + e.getMessage());
        } finally {
            try {
                st.close();
            } catch (Exception e) {
                throw new Exception("Erro ao fechar declaração.\n" + e.getMessage());
            }
        }
    }

    public boolean cpfEhValido(String cpf) {
        // Verifica se é uma string com 11 algarismos.
        if (!cpf.matches("^[0-9]{11}$")) {
            System.out.println("CPF inválido. Deve conter 11 algarismos.");
            return false;
        }
        return true;
    }

    public void lerCpf() {
        Scanner in = new Scanner(System.in);
        // Lê o cpf pela primeira vez.
        System.out.println("Digite o cpf, somente números (ex: 99999999999):");
        String cpf = in.nextLine();

        // Enquanto o cpf lido não é válido, lê denovo.
        while (!cpfEhValido(cpf)) {
            cpf = in.nextLine();
        }
        this.setCpf(cpf);
    }
}
