import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clean_arch_full_bookly_app/Features/home/domain/entities/book_entity.dart';
import '../../../../../Core/utils/app_router.dart';
import 'custom_book_item.dart';

class SimilarBookListViewItem extends StatelessWidget {
  const SimilarBookListViewItem({
    super.key,
    required this.bookEntity,
  });

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement(
          AppRouter.kBookDetailsView,
          extra: bookEntity,
        );
      },
      child: SizedBox(
        child: Row(
          children: [
            CustomBookImage(
              image: bookEntity.image ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
