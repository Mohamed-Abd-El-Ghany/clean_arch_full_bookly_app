import 'package:flutter/material.dart';
import 'package:clean_arch_full_bookly_app/Features/home/presentation/views/widgets/similar_books_list_view_bloc_consumer.dart';
import '../../../../../Core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const SimilarBooksListViewBlocConsumer(),
      ],
    );
  }
}
