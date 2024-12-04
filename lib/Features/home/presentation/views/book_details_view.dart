import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_full_bookly_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';
import '../manger/similar_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.booksEntity,
  });

  final BookEntity booksEntity;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {

  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.booksEntity.category ?? 'programming');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(booksEntity: widget.booksEntity),
      ),
    );
  }
}
