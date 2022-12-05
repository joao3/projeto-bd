import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class Voluntario {
    private String cpf;
    private String nome;
    private LocalDate dataNascimento;

    public String getCpf() {
        return cpf;
    }

    public String getNome() {
        return nome;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public boolean cpfEhValido(String cpf, Connection conexao) {
        // Verifica se é uma string com 11 algarismos.
        if(!cpf.matches("^[0-9]{11}$")) {
            System.out.println("CPF inválido. Deve conter 11 algarismos.");
            return false;
        }

        // Verifica se o cpf já está cadastrado no banco.
        try {
            boolean cpfJaCadastrado = this.existeVoluntario(conexao, cpf);
            if(cpfJaCadastrado) {
                System.out.println("CPF já cadastrado no banco de dados. Tente outro CPF.");
                return false;
            }
        } catch (Exception e) {
            System.out.println("Erro ao verificar se o cpf já está cadastrado.\n" + e.getMessage());
            return false;
        }
        return true;
    }

    public static boolean nomeEhValido(String nome) {
        // Verifica se é uma string com comprimento menor ou igual que 30 (limite do atributo no banco).
        return nome.length() <= 30;
    }

    private String lerCpf(Scanner in, Connection conexao) {
        // Lê o cpf pela primeira vez.
        System.out.println("Digite o cpf, somente números (ex: 99999999999):");
        String cpf = in.nextLine();

        // Enquanto o cpf lido não é válido, lê denovo.
        while (!cpfEhValido(cpf,conexao)) {
            cpf = in.nextLine();
        }

        return cpf;
    }

    private String lerNome(Scanner in) {
        // Lê o nome pela primeira vez.
        System.out.println("Digite o nome (comprimento máximo de 30 caracteres):");
        String nome = in.nextLine();

        // Enquanto o nome lido não é válido, lê denovo.
        while (!nomeEhValido(nome)) {
            System.out.println("Nome inválido, tente novamente.");
            nome = in.nextLine();
        }

        return nome;
    }

    private LocalDate lerDataNascimento(Scanner in) {
        // Lê a string referente a data pela primeira vez.
        System.out.println("Digite a data de nascimento (dd/mm/aaaa):");
        String linha = in.nextLine();
        LocalDate dataNascimento = null;

        // Se conseguiu convertar a string para data sai do loop, se não, lê de novo.
        boolean conseguiuLer = false;
        while (!conseguiuLer) {
            try {
                dataNascimento =  LocalDate.parse(linha, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                conseguiuLer = true;
            } catch (DateTimeParseException e) {
                System.out.println("Data inválida, tente novamente.\n" + e.getMessage());
                linha = in.nextLine();
            }
        }

        return dataNascimento;
    }

    public void lerDoTerminal(Connection conexao) {
        Scanner in = new Scanner(System.in);
        this.cpf = lerCpf(in, conexao);
        this.nome = lerNome(in);
        this.dataNascimento = lerDataNascimento(in);
    }

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

    public boolean existeVoluntario(Connection conexao, String cpf) throws Exception {
        // Cria objeto para realizar a declaração SQL.
        String sql = "SELECT count(cpf) FROM Voluntario WHERE cpf = ?";
        PreparedStatement st = null;
        try {
            st = conexao.prepareStatement(sql);

        } catch (SQLException e) {
            throw new Exception("Erro ao criar declaração no banco de dados.\n" + e.getMessage());
        }

        try {
            // Substitui os caracteres coringas '?' da query.
            st.setString(1, cpf);
        } catch (SQLException e) {
            throw new Exception("Erro ao adicionar parâmetros à consulta no banco de dados.\n" + e.getMessage());
        }

        // Tenta executar a query e fechar o objeto da declaração.
        try {
            ResultSet rs = st.executeQuery();
            return !rs.next();
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

    @Override
    public String toString() {
        return "Voluntario{" +
                "cpf='" + cpf + '\'' +
                ", nome='" + nome + '\'' +
                ", dataNascimento=" + dataNascimento +
                '}';
    }
}
