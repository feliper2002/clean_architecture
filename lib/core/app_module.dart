import 'package:clean_archtecture/core/app_widget.dart';
import 'package:clean_archtecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_archtecture/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_archtecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:clean_archtecture/modules/search/presenter/pages/search.page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDatasource(i())),
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => SearchRepositoryImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SearchPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
