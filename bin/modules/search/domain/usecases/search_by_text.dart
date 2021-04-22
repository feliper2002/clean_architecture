import 'package:dartz/dartz.dart';

import '../entity/resultSearch.dart';
import '../error/errors.dart';
import '../repositories/searchRepository.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;
  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText == '') {
      return Left(InvalidTextError());
    }

    return repository.search(searchText);
  }
}
