import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase) : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await fetchSimilarBooksUseCase.call(category);
    result.fold(
      (failure) {
        emit(
          SimilarBooksFailure(failure.message),
        );
      },
      (books) {
        emit(
          SimilarBooksSuccess(books),
        );
      },
    );
  }
}
