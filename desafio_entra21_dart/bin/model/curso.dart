import 'pessoa.dart';

class Curso {
  int codigo = 0;
  String nome;
  int totalAlunos;
  List<Pessoa> pessoas = [];
  int gerador = 0;

  Curso({required this.nome, required this.totalAlunos}) {
    codigo = gerador++;
  }
  
  @override
  String toString() {
    return '\nCódigo: $codigo \nNome: $nome \nTotal de alunos: $totalAlunos';
  }
}
