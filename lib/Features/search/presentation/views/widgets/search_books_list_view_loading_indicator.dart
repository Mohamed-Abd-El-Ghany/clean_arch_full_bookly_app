import 'package:flutter/material.dart';
import '../../../../../Core/widgets/book_list_view_loading.dart';
import '../../../../../Core/widgets/custom_fading_widget.dart';

class SearchBooksListViewLoadingIndicator extends StatelessWidget {
  const SearchBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingAnimation(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: BookListViewLoading(),
            );
          },
        ),
      ),
    );
  }
}
