import '../../model/aluno.dart';
import '../../model/pessoa.dart';
import '../../model/professor.dart';
import '../interface/inter_pessoa_repository.dart';

class PessoaRepositoryImpl implements IPessoaRepository {
  List<Pessoa> listaPessoas = [];

  @override
  void adicionar(Pessoa aluno) {
    listaPessoas.add(aluno);
  }

  @override
  void alterar(int codigo, String? nome, String? email, DateTime? nascimento,
      String? endereco, double? salario) {
    listaPessoas.firstWhere((element) {
      if (element.codigo == codigo) {
        nome != null ? element.nome = nome : '';
        email != null ? element.email = email : '';
        nascimento != null ? element.nascimento = nascimento : '';
        endereco != null ? element.endereco = endereco : '';
        if (element is Professor) {
          salario != null ? element.salario = salario : '';
        }
        return true;
      }
      return false;
    });
  }

  @override
  void excluir(int codigo) {
    return listaPessoas.removeWhere((element) => element.codigo == codigo);
  }

  @override
  Pessoa? buscarPessoa(String email) {
    if (listaPessoas.isNotEmpty) {
      try {
        return listaPessoas.firstWhere((element) => element.email == email);
      } catch (e) {}
    }
    return null;
  }

  @override
  Pessoa? buscarPorCodigo(int codigo) {
    if (listaPessoas.isNotEmpty) {
      try {
        return listaPessoas.firstWhere((element) => element.codigo == codigo);
      } catch (e) {}
      return null;
    }
  }

  @override
  void excluirPorCodigo(int codigo) {
    listaPessoas.removeWhere((element) => element.codigo == codigo);
  }

  @override
  List<Pessoa> listar(bool aluno) {
    List<Pessoa> pessoas = [];

    for (Pessoa pessoa in listaPessoas) {
      if (pessoa is Aluno && aluno) {
        pessoas.add(pessoa);
      } else if (pessoa is Professor && !aluno) {
        pessoas.add(pessoa);
      }
    }
    return pessoas;
  }

  excluirAluno(int codigoDoAluno) {
    listaPessoas.removeWhere(
        (pessoa) => pessoa is Aluno && pessoa.codigo == codigoDoAluno);
  }
}
