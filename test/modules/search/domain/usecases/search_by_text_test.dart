import 'package:clean_archtecture/modules/search/domain/entity/resultSearch.dart';
import 'package:clean_archtecture/modules/search/domain/error/errors.dart';
import 'package:clean_archtecture/modules/search/domain/repositories/searchRepository.dart';
import 'package:clean_archtecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('Deve retornar uma Lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase('Felipe');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar uma Exception caso o texto seja inválido', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
