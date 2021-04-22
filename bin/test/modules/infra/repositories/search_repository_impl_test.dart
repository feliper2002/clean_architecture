import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../modules/search/domain/error/errors.dart';
import '../../../../modules/search/infra/datasource/searchDatasource.dart';
import '../../../../modules/search/infra/models/result_search_model.dart';
import '../../../../modules/search/infra/repositories/search_repository_impl.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test('Deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search('Felipe');

    expect(result | null, isA<List<ResultSearchModel>>());
  });

  test('Deve retornar um DatasourceError se o Datasource falhar', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search('Felipe');

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
