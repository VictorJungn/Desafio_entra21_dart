import 'dart:io';
import 'package:intl/intl.dart';
import '../model/aluno.dart';
import '../model/curso.dart';
import '../model/nota_aluno.dart';
import '../model/pessoa.dart';
import '../model/professor.dart';
import '../repositorio/implementacao/curso_repository_impl.dart';
import '../repositorio/implementacao/pessoa_repository_impl.dart';
import '../service/curso_service.dart';
import '../service/geren_notas_service.dart';
import '../service/pessoa_service.dart';

class Interface {
  late CursoService cursoService;
  late PessoaService pessoaService;
  late GerenNotasService gerenNotasService;

  Interface() {
    cursoService = CursoService(CursoRepositoryImpl());
    pessoaService = PessoaService(PessoaRepositoryImpl());

    pessoaService.cursoService = cursoService;
    cursoService.pessoaService = pessoaService;
  }

  DateFormat formatter = DateFormat('dd/MM/yyyy');

  void mostrar() {
    String opc = '';
    do {
      print(
          'Escolha a opção que você deseja, sendo: \n1 - Gerenciar Aluno\n2 - Gerenciar Professor\n3 - Gerenciar Curso\n4 - Sair');
      opc = stdin.readLineSync()!;
      switch (opc) {
        case '1':
          gerenciarAluno();
          break;
        case '2':
          gerenciarProfessor();
          break;
        case '3':
          gerenciarCurso();
          break;
        case '4':
          break;

        default:
          print('Opção Inválida:');
          break;
      }
    } while (opc != '4');
  }

  void gerenciarAluno() {
    String opc = '';
    do {
      print('1- Cadastrar\n2- Alterar\n3- Listar\n4- Adicionar notas do aluno \n5- Excluir\n6- Voltar');
      opc = stdin.readLineSync()!;
      switch (opc) {
        case '1':
          cadastroNovoAluno();
          print('');
          break;
        case '2':
          alterarAluno();
          print('');
          break;
        case '3':
          listarAlunos();
          print('');
          break;
        case '4':
          adicionarNotaAluno();
          print('');
          break;
        case '5':
          excluirAluno();
          print('');
          break;
      }
    } while (opc != '6');
  }

  void cadastroNovoAluno() {
    print('Informe o nome:');
    String nome = stdin.readLineSync()!;

    print('Informe o email:');
    String email = stdin.readLineSync()!;

    if (pessoaService.buscarPorEmail(email) == null) {
    } else {
      print('Email já cadastrado!');
    }

    print('Informe data de nascimento: (dd/MM/yyyy)');
    DateTime dataDeNascimento = formatter.parse(stdin.readLineSync()!);

    print('Informe o endereço:');
    String? endereco = stdin.readLineSync()!;
    stdin.readLineSync()!;
    print('Cadastro realizado!');

    Pessoa aluno = Aluno(
        email: email,
        nome: nome,
        nascimento: dataDeNascimento,
        endereco: endereco);

    pessoaService.adicionar(aluno);
  }

  void alterarAluno() {
    print('Informe o código do aluno para alterar:');
    int codigo = int.parse(stdin.readLineSync()!);

    if (pessoaService.buscarPorCodigo(codigo) != null) {
      print('Informe o nome: ');
      String nome = stdin.readLineSync()!;
      print('Informe o email: ');
      String email = stdin.readLineSync()!;
      print('Informe a Data de Nascimento: (dd/MM/yyyy)');
      DateTime nascimento = formatter.parse(stdin.readLineSync()!);
      print('Informe o endereço:');
      String endereco = stdin.readLineSync()!;
      double? salario;
      stdin.readLineSync()!;
      print('Alteração no cadastro realizada!');

      pessoaService.alterar(codigo, nome, email, nascimento, endereco, salario);
    } else {
      print('Código Inválido');
    }
  }

  void listarAlunos() {
    print(pessoaService.listar(true));
  }

  void excluirAluno() {
    print('Informe o código para excluir:');
    int codigo = int.parse(stdin.readLineSync()!);
    pessoaService.excluirPorCodigo(codigo);
    stdin.readLineSync()!;
    print('Exclusão realizada!');
  }

  void adicionarNotaAluno() {
    for (int i = 0; i <= 3; i++) {
      print('Informe a nota do aluno:');
      double nota = double.parse(stdin.readLineSync()!);
      Aluno notasAluno = NotaAluno as Aluno;
      return gerenNotasService.adicionarNota(notasAluno);
    }
    print('Notas cadastradas!');
  }

  void gerenciarProfessor() {
    String opc = '';
    do {
      print('1- Cadastrar\n2- Alterar\n3- Listar\n4- Excluir\n5- Voltar');
      opc = stdin.readLineSync()!;
      switch (opc) {
        case '1':
          cadastrarProfessor();
          print('');
          break;
        case '2':
          alterarProfessor();
          print('');
          break;
        case '3':
          listarProfessores();
          print('');
          break;
        case '4':
          excluirProfessores();
          break;
      }
    } while (opc != '5');
  }

  void cadastrarProfessor() {
    print('Informe o Nome:');
    String nome = stdin.readLineSync()!;
    print('Informe o Email:');
    String email = stdin.readLineSync()!;
    print('Informe data de nascimento: (dd/MM/yyyy)');
    DateTime nascimento = formatter.parse(stdin.readLineSync()!);
    print('Informe o Endereço:');
    String endereco = stdin.readLineSync()!;
    print('Informe o salário:');
    double salario = double.parse(stdin.readLineSync()!);
    stdin.readLineSync()!;
    print('Cadastro realizado!');

    Pessoa professor = Professor(
        email: email,
        nome: nome,
        nascimento: nascimento,
        endereco: endereco,
        salario: salario);

    pessoaService.adicionar(professor);
  }

  void alterarProfessor() {
    print('Informe o código do professor que deseja alterar:');
    int codigo = int.parse(stdin.readLineSync()!);

    if (pessoaService.buscarPorCodigo(codigo) != null) {
      print('Informe o nome:');
      String? nome = stdin.readLineSync()!;
      print('Informe o email:');
      String? email = stdin.readLineSync()!;
      print('Informe data de nascimento: (dd/MM/yyyy)');
      DateTime? nascimento = formatter.parse(stdin.readLineSync()!);
      print('Informe o endereço:');
      String? endereco = stdin.readLineSync()!;
      print('Informe o salário:');
      double? salario = double.parse(stdin.readLineSync()!);
      stdin.readLineSync()!;
      print('Alteração no cadastro realizada!');

      pessoaService.alterar(codigo, nome, email, nascimento, endereco, salario);
    } else {
      print('Código Inválido');
    }
  }

  void listarProfessores() {
    print(pessoaService.listar(false));
  }

  void excluirProfessores() {
    print('Informe o código para excluir:');
    int codigo = int.parse(stdin.readLineSync()!);
    pessoaService.excluirPorCodigo(codigo);
    stdin.readLineSync()!;
    print('Exclusão realizada!');
  }

  void gerenciarCurso() {
    String opc = '';
    do {
      print(
          '1- Cadastrar\n2- Alterar\n3- Listar\n4- Adicionar no curso\n5- Listar Pessoas do Curso \n6- Excluir Pessoas do Curso \n7- Excluir Curso \n8- Voltar');
      opc = stdin.readLineSync()!;
      switch (opc) {
        case '1':
          criarCurso();
          print('');
          break;
        case '2':
          alterarCurso();
          print('');
          break;
        case '3':
          listarCursos();
          print('');
          break;
        case '4':
          addAlunoNoCurso();
          print('');
          break;
        case '5':
          listarDoCurso();
          print('');
          break;
        case '6':
          excluirDoCurso();
          print('');
          break;
        case '7':
          excluirCurso();
          print('');
          break;
      }
    } while (opc != '8');
  }

  void criarCurso() {
    print('Informe o nome do curso:');
    String nome = stdin.readLineSync()!;

    print('Informe o total de alunos:');
    int totalAlunos = int.parse(stdin.readLineSync()!);

    Curso curso = Curso(nome: nome, totalAlunos: totalAlunos);

    cursoService.criaCurso(curso);
  }

  void alterarCurso() {
    print('Informe o código do curso:');
    int codigo = int.parse(stdin.readLineSync()!);

    if (cursoService.buscarCurso(codigo) != null) {
      print('Informe o nome para alterar');
      String nome = stdin.readLineSync()!;

      cursoService.alteraCurso(codigo, nome);
    } else {
      print('Código inválido');
    }
  }

  void listarCursos() {
    print(cursoService.listar());
  }

  void excluirCurso() {
    print('Informe o código para excluir:');
    int? codigo = int.parse(stdin.readLineSync()!);

    cursoService.excluirCurso(codigo);
  }

  void addAlunoNoCurso() {
    print('Informe o código do curso:');
    int codigo = int.parse(stdin.readLineSync()!);

    if (cursoService.buscarCurso(codigo) != null) {
      print('Informe a opção: \n1.Adicionar Aluno \n2.Adicionar Professor');
      String opc = stdin.readLineSync()!;

      switch (opc) {
        case '1':
          print('Informe o código do aluno:');
          int codigo1 = int.parse(stdin.readLineSync()!);

          if (pessoaService.buscarPorCodigo(codigo1) != null) {
            cursoService.adicionaNoCurso(codigo, codigo1);
          } else {
            print('Aluno não encontrado');
            stdin.readLineSync()!;
          }
          break;

        case '2':
          print('Informe o código do professor:');
          int codigo1 = int.parse(stdin.readLineSync()!);

          if (pessoaService.buscarPorCodigo(codigo1) != null) {
            cursoService.adicionaNoCurso(codigo, codigo1);
          } else {
            print('Professor não encontrado');
            stdin.readLineSync()!;
          }
          break;

        default:
          print('Opção Inválida');
          stdin.readLineSync()!;
          break;
      }
    } else {
      print('Curso não encontrado');
      stdin.readLineSync()!;
    }
  }

  void listarDoCurso() {
    print('Informe o código do curso:');
    int codigo = int.parse(stdin.readLineSync()!);

    if (cursoService.buscarCurso(codigo) != null) {
      print(
          'Informe a opção: \n1.Listar Alunos do curso \n2.Listar Professores do curso');
      String opc = stdin.readLineSync()!;

      switch (opc) {
        case '1':
          cursoService.listarDoCurso(codigo, true);
          break;
        case '2':
          cursoService.listarDoCurso(codigo, false);
          break;
        default:
          print('Opção Inválida');
          break;
      }
    } else {
      print('Código inválido');
      stdin.readLineSync()!;
    }
  }

  void excluirDoCurso() {
    print('Informe o código do curso:');
    int codigo = int.parse(stdin.readLineSync()!);

    if (cursoService.buscarCurso(codigo) != null) {
      print('Informe a opção: \n1.Excluir aluno \n2.Excluir Professor');
      String opc = stdin.readLineSync()!;

      switch (opc) {
        case '1':
          print('Informe o código do aluno:');
          int codigo1 = int.parse(stdin.readLineSync()!);

          cursoService.excluirDoCurso(codigo, codigo1, true);
          break;
        case '2':
          print('Informe o código do professor:');
          int codigo1 = int.parse(stdin.readLineSync()!);

          cursoService.excluirDoCurso(codigo, codigo1, false);
          break;

        default:
          print('Opção inválida');
          break;
      }
    }
  }
}
