import 'dart:convert';

import 'package:clean_archtecture/modules/search/domain/error/errors.dart';
import 'package:clean_archtecture/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_archtecture/modules/utils/consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);

  test('Deve retornar uma lista de ResultSearchModel', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(githubResponse), statusCode: 200));

    final future = datasource.getSearch('Felipe');

    expect(future, completes);
  });

  test('Deve retornar um DatasourceError se o statusCode não for 200',
      () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));

    final future = datasource.getSearch('searchAAAAA');

    expect(future, throwsA(isA<DatasourceError>()));
  });
}
