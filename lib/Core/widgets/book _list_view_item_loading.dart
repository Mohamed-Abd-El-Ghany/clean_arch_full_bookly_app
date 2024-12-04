import 'package:flutter/material.dart';
import 'custom_fading_widget.dart';

class BookListViewItemLoading extends StatelessWidget {
  const BookListViewItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      child: Row(
        children: [
          CustomFadingAnimation(
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: CustomFadingAnimation(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
