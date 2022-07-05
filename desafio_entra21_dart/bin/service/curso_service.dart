import '../model/curso.dart';
import '../model/pessoa.dart';
import '../repositorio/interface/inter_curso_repository.dart';
import 'pessoa_service.dart';

class CursoService {
  late ICursoRepository cursoRepository;
  late PessoaService pessoaService;

  CursoService(this.cursoRepository);

  void criaCurso(Curso curso) {
    cursoRepository.criarCurso(curso);
  }

  void alteraCurso(int? codigo, String? nome) {
    cursoRepository.alterarCurso(codigo, nome);
  }

  Curso? buscarCurso(int codigo) {
    return cursoRepository.buscarCurso(codigo);
  }

  void excluirCurso(int codigo) {
    cursoRepository.excluirCurso(codigo);
  }

  List<Curso> listar() {
    return cursoRepository.listarCursos();
  }

   List<Pessoa> listarDoCurso(int codigo, bool aluno) {
    Curso? curso = buscarCurso(codigo);
    return cursoRepository.listarDoCurso(curso!, aluno);
  }

  void excluirDoCurso(int codigo, int codigo1, bool aluno) {
    Pessoa? pessoa = pessoaService.buscarPorCodigo(codigo1);
    Curso? curso = buscarCurso(codigo);
    cursoRepository.exluirDoCurso(curso!, pessoa!, aluno);
  }

  
  void adicionaNoCurso(int codigo, int codigo1) {
    Pessoa? pessoa = pessoaService.buscarPorCodigo(codigo1);
    Curso? curso = buscarCurso(codigo);
    cursoRepository.adicionaNoCurso(curso!, pessoa!);
  }
}
