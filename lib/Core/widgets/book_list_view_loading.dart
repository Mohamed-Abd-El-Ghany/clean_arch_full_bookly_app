import 'package:flutter/material.dart';
import 'book _list_view_item_loading.dart';
import 'custom_fading_widget.dart';

class BookListViewLoading extends StatelessWidget {
  const BookListViewLoading({super.key});

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
