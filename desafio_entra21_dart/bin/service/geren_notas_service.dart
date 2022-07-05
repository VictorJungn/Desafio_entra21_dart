import '../model/nota_aluno.dart';
import '../repositorio/implementacao/geren_curso_repository.dart';
import 'curso_service.dart';

class GerenNotasService{

  late GerenNotasRepositoryImpl gerenNotasRepositoryImpl;
  late CursoService cursoService;

  GerenNotasService(this.gerenNotasRepositoryImpl);

  void adicionarNota (NotaAluno nota){
    return gerenNotasRepositoryImpl.adicionarNota(nota);
  }

  void alterarNota(int teste, NotaAluno novaNota){
    return gerenNotasRepositoryImpl.alterarNota(teste, novaNota);
  }

  void excluir(int teste){
    return gerenNotasRepositoryImpl.excluirNota(teste);
  }

  double exibirMedia(int codigoCurso){
    return gerenNotasRepositoryImpl.exibirMedia(codigoCurso)
  }
}