import '../../model/pessoa.dart';

abstract class IPessoaRepository {
  void adicionar(Pessoa aluno);

  void alterar(int codigo, String? nome, String? email, DateTime? nascimento, String? endereco, double? salario);

  void excluir(int codigo);

  Pessoa? buscarPessoa(String email);

  Pessoa? buscarPorCodigo(int codigo);

  void excluirPorCodigo(int codigo);

  List<Pessoa> listar(bool aluno);
}
