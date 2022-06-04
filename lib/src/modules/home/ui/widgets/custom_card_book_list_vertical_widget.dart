import 'package:flutter/material.dart';
import 'package:studio_sol_ssbook/src/core/book/model/book_model.dart';

import '../../../../core/shared/consts/app_text_styles_const.dart';

class CustomCardBookListVerticalWidget extends StatelessWidget {
  const CustomCardBookListVerticalWidget({
    Key? key,
    required this.listAllBooks,
  }) : super(key: key);
  final BookModel listAllBooks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 48,
              height: 70,
              child: Image.network(listAllBooks.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: listAllBooks.name,
                    style: AppTextStylesConst.titleBookHome,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  listAllBooks.author!.name,
                  style: AppTextStylesConst.subtitleBookHome,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
