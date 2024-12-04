import 'package:flutter/material.dart';
import 'package:clean_arch_full_bookly_app/Features/home/presentation/views/widgets/similar_book_list_view_item.dart';
import '../../../domain/entities/book_entity.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SimilarBookListViewItem(bookEntity: books[index]),
          );
        },
      ),
    );
  }
}
