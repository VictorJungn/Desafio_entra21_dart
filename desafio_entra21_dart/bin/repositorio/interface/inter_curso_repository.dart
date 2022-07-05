import '../../model/curso.dart';
import '../../model/pessoa.dart';

abstract class ICursoRepository {
  void criarCurso(Curso aluno);

  void alterarCurso(int? codigo, String? nome);

  void excluirCurso(int codigo);

  List<Curso> listarCursos();

  Curso? buscarCurso(int codigo);

  void adicionaNoCurso(Curso curso, Pessoa pessoa);

  void exluirDoCurso(Curso curso, Pessoa pessoa, bool aluno);

  List<Pessoa> listarDoCurso(Curso curso, bool aluno);
}
