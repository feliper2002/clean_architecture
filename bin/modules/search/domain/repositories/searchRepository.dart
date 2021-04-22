import 'package:dartz/dartz.dart';

import '../entity/resultSearch.dart';
import '../error/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
