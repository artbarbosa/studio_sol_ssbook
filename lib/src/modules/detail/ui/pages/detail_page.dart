import 'package:flutter/material.dart';

import '../../../../core/book/model/book_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(book.name!),
      ),
    );
  }
}
