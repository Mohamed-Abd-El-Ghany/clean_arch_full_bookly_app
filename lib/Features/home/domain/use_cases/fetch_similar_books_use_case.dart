import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String param = '']) async {
    return await homeRepo.fetchSimilarBooks(category: param);
  }
}
