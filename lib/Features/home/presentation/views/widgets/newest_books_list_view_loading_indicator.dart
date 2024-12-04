import 'package:flutter/material.dart';
import '../../../../../Core/widgets/book _list_view_item_loading.dart';
import '../../../../../Core/widgets/custom_fading_widget.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingAnimation(
      child: SizedBox(
        height: 164,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BookListViewItemLoading(),
            );
          },
        ),
      ),
    );
  }
}
