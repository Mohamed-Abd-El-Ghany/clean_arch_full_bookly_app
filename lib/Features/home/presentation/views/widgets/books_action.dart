import 'package:flutter/material.dart';
import 'package:clean_arch_full_bookly_app/Core/utils/functions/launch_url.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../../domain/entities/book_entity.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.booksEntity,
  });

  final BookEntity booksEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(
                  context,
                  booksEntity.previewLink,
                );
              },
              fontSize: 16,
              text: getText(booksEntity),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookEntity booksEntity) {
    if (booksEntity.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
