part of 'search_result_books_cubit.dart';

class SearchResultBooksState {
  const SearchResultBooksState();

  List<Object> get props => [];
}

class SearchResultBooksInitial extends SearchResultBooksState {}

class SearchResultBooksLoading extends SearchResultBooksState {}


class SearchResultBooksSuccess extends SearchResultBooksState {
  final List<BookEntity> books;

  const SearchResultBooksSuccess(this.books);
}

class SearchResultBooksFailure extends SearchResultBooksState {
  final String errMessage;

  const SearchResultBooksFailure(this.errMessage);
}