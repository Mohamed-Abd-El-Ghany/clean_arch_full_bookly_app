part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {
  const SimilarBooksState();

  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String message;

  const SimilarBooksFailure(this.message);
}
class SimilarBooksPaginationLoading extends SimilarBooksState {}

class SimilarBooksPaginationFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksPaginationFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  const SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBooksState {}
