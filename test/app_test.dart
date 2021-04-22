import 'dart:convert';

import 'package:clean_archtecture/core/app_module.dart';
import 'package:clean_archtecture/modules/search/domain/entity/resultSearch.dart';
import 'package:clean_archtecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_archtecture/modules/utils/consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();

  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });

  test('Deve trazer uma lista de ResultSearch', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(githubResponse), statusCode: 200));

    final usecase = Modular.get<SearchByText>();
    final result = await usecase("Felipe");
    expect(result | null, isA<List<ResultSearch>>());
  });
}
