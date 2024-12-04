import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/functions/custom_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manger/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_list_view.dart';
import 'newest_books_list_view_loading_indicator.dart';

class NewestBooksListViewBlocBuilder extends StatefulWidget {
  const NewestBooksListViewBlocBuilder({super.key});

  @override
  State<NewestBooksListViewBlocBuilder> createState() => _NewestBooksListViewBlocBuilderState();
}

class _NewestBooksListViewBlocBuilderState extends State<NewestBooksListViewBlocBuilder> {

  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return NewestBooksListView(books: books);
        } else if (state is NewestBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const NewestBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
