import '../model/pessoa.dart';
import '../repositorio/implementacao/pessoa_repository_impl.dart';
import 'curso_service.dart';

class PessoaService {
  late PessoaRepositoryImpl pessoaRepository;
  late CursoService cursoService;

  PessoaService(this.pessoaRepository);

  Pessoa? buscarPorEmail(String email) {
    return pessoaRepository.buscarPessoa(email);
  }

  void adicionar(Pessoa pessoa) {
    pessoaRepository.adicionar(pessoa);
  }

  void alterar(int codigo, String? nome, String? email, DateTime? nascimento,
      String? endereco, double? salario) {
    pessoaRepository.alterar(
        codigo, nome, email, nascimento, endereco, salario);
  }

  Pessoa? buscarPorCodigo(int codigo) {
    return pessoaRepository.buscarPorCodigo(codigo);
  }

  void excluirPorCodigo(int codigo) {
    pessoaRepository.excluirPorCodigo(codigo);
  }

  List<Pessoa> listar(bool pessoa) {
    return pessoaRepository.listar(pessoa);
  }
}
