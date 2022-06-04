import 'package:flutter/material.dart';
import 'package:studio_sol_ssbook/src/core/book/model/book_model.dart';

import '../../../../core/shared/consts/app_text_styles_const.dart';
import '../../../detail/router/detail_arguments.dart';

class CustomCardBookListVerticalWidget extends StatelessWidget {
  const CustomCardBookListVerticalWidget({
    Key? key,
    required this.book,
  }) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Hero(
        tag: book.id,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/detail', arguments: DetailArguments(id: book.id));
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 48,
                  height: 70,
                  child: Image.network(book.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: book.name,
                        style: AppTextStylesConst.titleBookHome,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Text(
                      book.author!.name,
                      style: AppTextStylesConst.subtitleBookHome,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
