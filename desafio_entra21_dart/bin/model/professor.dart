import 'pessoa.dart';

class Professor extends Pessoa {
  double salario = 0;

  Professor({
    required email,
    required nome,
    required nascimento,
    required this.salario,
    endereco,
  }) : super(
            email: email,
            nome: nome,
            nascimento: nascimento,
            endereco: endereco);

  @override
  String toString() {
    return '\nCódigo: $codigo \nNome: $nome \nData de Nascimento: $nascimento \nSalário: $salario \nEndereço: $endereco \n';
  }
}
