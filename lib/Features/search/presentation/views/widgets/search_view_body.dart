import 'package:clean_arch_full_bookly_app/Features/search/presentation/views/widgets/search_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_full_bookly_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import '../../../../../Core/utils/styles.dart';
import '../../view_models/search_result_cubit/search_result_books_cubit.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String category = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<SearchResultCubit, SearchResultBooksState>(
      builder: (context, state) {
        if (state is SearchResultBooksSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * .02),
                CustomSearchTextField(
                  onSubmitted: (value) {
                    category = value;
                    setState(
                      () {
                        BlocProvider.of<SearchResultCubit>(context)
                            .searchResultBooks(category: category);
                      },
                    );
                  },
                  onPressed: () {
                    BlocProvider.of<SearchResultCubit>(context)
                        .searchResultBooks(category: category);
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Search Results',
                  style: Styles.textStyle18,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SearchResultListView(books: state.books),
                ),
              ],
            ),
          );
        } else if (state is SearchResultBooksLoading) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * .02),
                CustomSearchTextField(
                  onSubmitted: (value) {
                    category = value;
                    setState(
                          () {
                        BlocProvider.of<SearchResultCubit>(context)
                            .searchResultBooks(category: category);
                      },
                    );
                  },
                  onPressed: () {
                    BlocProvider.of<SearchResultCubit>(context)
                        .searchResultBooks(category: category);
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Search Results',
                  style: Styles.textStyle18,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SearchBooksListViewLoadingIndicator(),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * .02),
                CustomSearchTextField(
                  onSubmitted: (value) {
                    category = value;
                    setState(
                      () {
                        BlocProvider.of<SearchResultCubit>(context)
                            .searchResultBooks(category: category);
                      },
                    );
                  },
                  onPressed: () {
                    BlocProvider.of<SearchResultCubit>(context)
                        .searchResultBooks(category: category);
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Search Results',
                  style: Styles.textStyle18,
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        }
      },
    );
  }
}
