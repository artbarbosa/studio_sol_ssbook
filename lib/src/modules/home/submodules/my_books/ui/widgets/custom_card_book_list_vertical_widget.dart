import 'package:flutter/material.dart';

import '../../../../../../core/book/model/book_model.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';
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
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/detail', arguments: DetailArguments(id: book.id));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.17,
                child: AspectRatio(
                  aspectRatio: 48 / 70,
                  child: Image.network(
                    book.cover,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Text.rich(
                      TextSpan(
                        text: book.name,
                        style: AppTextStylesConst.titleBookHome,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
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
    );
  }
}
