import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/functions/custom_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manger/featured_books_cubit/featured_books_cubit.dart';
import 'featured_books_list_view_loading_indicator.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({super.key});

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const FeaturedBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
