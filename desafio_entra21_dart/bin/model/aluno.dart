import 'nota_aluno.dart';
import 'pessoa.dart';

class Aluno extends Pessoa with NotaAluno {
  List<NotaAluno> notasAluno = [];
  
  Aluno({required email, required nome, required nascimento, endereco})
      : super(
            email: email,
            nome: nome,
            nascimento: nascimento,
            endereco: endereco);

  @override
  String toString() {
    return '\nCódigo: $codigo \nNome: $nome \nEmail: $email \nData Nasc: $nascimento \nEndereço: $endereco \n';
  }

}