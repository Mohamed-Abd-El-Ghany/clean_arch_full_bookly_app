import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failure.dart';
import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> searchResultBooks(
      {required String category});
}