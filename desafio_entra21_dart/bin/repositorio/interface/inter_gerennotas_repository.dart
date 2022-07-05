
import '../../model/nota_aluno.dart';

abstract class IGerenNotas {
  void adicionarNota (NotaAluno nota);

  void alterarNota(int teste, NotaAluno novaNota);

  void excluirNota(int teste);

  void exibirMedia(int codigoCurso);
}
