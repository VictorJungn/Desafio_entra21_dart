class Pessoa {
  int codigo = 0;
  String email;
  String nome;
  DateTime nascimento;
  String? endereco;
  static int gerador = 0;

  Pessoa(
      {required this.email,
      required this.nome,
      required this.nascimento,
      this.endereco}) {
    codigo = gerador++;
  }
  @override
  String toString() {
    return '\nCódigo: $codigo, Nome: $nome, Email: $email, Data Nasc: $nascimento, Endereço: $endereco \n';
  }
}
