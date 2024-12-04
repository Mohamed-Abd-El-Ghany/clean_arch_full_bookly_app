import 'package:clean_arch_full_bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/use_cases/use_case.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }
}
