import 'dart:io';

import '../../model/aluno.dart';
import '../../model/curso.dart';
import '../../model/pessoa.dart';
import '../../model/professor.dart';
import '../interface/inter_curso_repository.dart';

class CursoRepositoryImpl implements ICursoRepository {
  List<Curso> listaCursos = [];

  @override
  void criarCurso(Curso curso) {
    listaCursos.add(curso);
  }

  @override
  void alterarCurso(int? codigo, String? nome) {
    listaCursos.firstWhere((element) {
      if (element.codigo == codigo) {
        element.nome = nome!;
      }
      return true;
    });
  }

  @override
  Curso? buscarCurso(int codigo) {
    return listaCursos.firstWhere((element) => element.codigo == codigo);
  }

  @override
  void excluirCurso(int codigo) {
    listaCursos.removeWhere(
        (curso) => curso.codigo == codigo && curso.pessoas.length - 1 == 0);
  }

  void addAluno(Aluno aluno, int codigo) {
    for (var curso in listaCursos) {
      if (curso.codigo == codigo && curso.pessoas.length < curso.totalAlunos) {
        curso.pessoas.add(aluno);
      }
    }
  }

  @override
  List<Curso> listarCursos() {
    List<Curso> cursos = [];
    for (Curso? curso in listaCursos) {
      if (curso != null) {
        cursos.add(curso);
      }
    }
    return cursos;
  }

  @override
   void adicionaNoCurso(Curso curso, Pessoa pessoa) {
    for (var item in listaCursos) {
      if (pessoa is Aluno) {
        if (item.codigo == curso.codigo &&
            curso.totalAlunos > curso.gerador) {
          curso.gerador++;
          item.pessoas.add(pessoa);

          print('Aluno adicionado com sucesso!');
          stdin.readLineSync()!;
        } else {
          print('Limite de alunos atingido!');
          stdin.readLineSync()!;
        }
      } else if (pessoa is Professor) {
        if (item.codigo == curso.codigo) {
          item.pessoas.add(pessoa);
          print('Adicionado com sucesso!');
          stdin.readLineSync()!;
        }
      }
    }
  }
  
  @override
   void exluirDoCurso(Curso curso, Pessoa pessoa, bool aluno) {
    for (var item in listaCursos) {
      if (pessoa is Aluno && aluno) {
        if (item.codigo == curso.codigo) {
          item.pessoas.remove(pessoa);
          print('Removido com sucesso!');

          stdin.readLineSync()!;
        }
      } else if (pessoa is Professor && !aluno) {
        if (item.codigo == curso.codigo) {
          item.pessoas.remove(pessoa);
          print('Removido com sucesso!');

          stdin.readLineSync()!;
        }
      }
    }
  }
  
  @override
  List<Pessoa> listarDoCurso(Curso curso, bool aluno) {
    List<Pessoa> pessoas = [];
    for (Pessoa pessoa in curso.pessoas) {
      if (pessoa is Aluno && aluno) {
        pessoas.add(pessoa);
        print(pessoa);
      } else if (pessoa is Professor && !aluno) {
        pessoas.add(pessoa);
        print(pessoa);
      }
    }
    return pessoas;
  }
}