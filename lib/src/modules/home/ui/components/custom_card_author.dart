import 'package:flutter/material.dart';
import 'package:studio_sol_ssbook/src/core/shared/consts/app_colors_const.dart';
import 'package:studio_sol_ssbook/src/core/shared/consts/app_text_styles_const.dart';

import '../../../../core/book/model/author_model.dart';

class CustomCardAuthor extends StatelessWidget {
  const CustomCardAuthor({Key? key, required this.author}) : super(key: key);

  final AuthorModel author;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: AppColorsConst.divider,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                author.picture!,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(author.name, style: AppTextStylesConst.titleHome),
                  if (author.bookCount == 1)
                    Text(
                      '${author.bookCount} livro',
                      style: AppTextStylesConst.subtitleBookHome,
                    )
                  else
                    Text(
                      '${author.bookCount} livros',
                      style: AppTextStylesConst.subtitleBookHome,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
