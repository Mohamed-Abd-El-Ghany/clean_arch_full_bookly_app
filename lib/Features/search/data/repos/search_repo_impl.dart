import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:clean_arch_full_bookly_app/Features/search/data/repos/search_repo.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/utils/api_service.dart';
import '../../../home/data/models/book_model/book_model.dart';
import '../../../home/domain/entities/book_entity.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookEntity>>> searchResultBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category');
      List<BookEntity> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}