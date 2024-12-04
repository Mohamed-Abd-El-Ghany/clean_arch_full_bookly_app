import 'package:clean_arch_full_bookly_app/Features/home/presentation/views/widgets/similar_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_full_bookly_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import '../../../../../Core/utils/functions/custom_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manger/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({super.key});

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is SimilarBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess ||
            state is SimilarBooksPaginationLoading ||
            state is SimilarBooksPaginationFailure) {
          return SimilarBooksListView(books: books);
        } else if (state is SimilarBooksFailure) {
          return Text(state.message);
        } else {
          return const SimilarBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
