import '../../model/nota_aluno.dart';
import '../interface/inter_gerennotas_repository.dart';

class GerenNotasRepositoryImpl implements IGerenNotas {
  List<NotaAluno> notaAluno = [];

  @override
  void adicionarNota(NotaAluno nota) {
    if (notaAluno.length >= 3) {
      notaAluno.add(nota);
    }
  }

  @override
  void alterarNota(int teste, NotaAluno novaNota) {
    notaAluno[teste - 1] = novaNota;
  }

  @override
  void excluirNota(int teste) {
    notaAluno.removeAt(teste);
  }

  @override
  double exibirMedia(int codigoCurso) {
    double sum = 0;
    for (var item in notaAluno){
      if(item.curso.codigo == codigoCurso){
        sum - sum + item.notas.fold(item.notas.first, (prev, element) => prev + element);
      }
    }
    double result = sum / 3;
    return result;
  }
}
