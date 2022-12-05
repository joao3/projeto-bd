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

    public static boolean cpfEhValido(String cpf) {
        // Verifica se é uma string com 11 algarismos.
        return cpf.matches("^[0-9]{11}$");
    }

    public static boolean nomeEhValido(String nome) {
        // Verifica se é uma string com comprimento menor ou igual que 30 (limite do atributo no banco).
        return nome.length() <= 30;
    }

    private String lerCpf(Scanner in) {
        // Lê o cpf pela primeira vez.
        System.out.println("Digite o cpf, somente números (ex: 99999999999):");
        String cpf = in.nextLine();

        // Enquanto o cpf lido não é válido, lê denovo.
        while (!cpfEhValido(cpf)) {
            System.out.println("Cpf inválido, tente novamente.");
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

    public void lerDoTerminal() {
        Scanner in = new Scanner(System.in);
        this.cpf = lerCpf(in);
        this.nome = lerNome(in);
        this.dataNascimento = lerDataNascimento(in);
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
