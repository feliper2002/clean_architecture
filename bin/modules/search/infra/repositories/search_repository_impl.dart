import 'package:dartz/dartz.dart';

import '../../domain/error/errors.dart';
import '../../domain/entity/resultSearch.dart';
import '../../domain/repositories/searchRepository.dart';
import '../datasource/searchDatasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource searchDatasource;

  SearchRepositoryImpl(this.searchDatasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await searchDatasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
