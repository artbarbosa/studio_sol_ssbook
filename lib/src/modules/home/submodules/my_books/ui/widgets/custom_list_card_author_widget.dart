import 'package:flutter/material.dart';
import 'package:studio_sol_ssbook/src/core/shared/consts/app_colors_const.dart';
import 'package:studio_sol_ssbook/src/core/shared/consts/app_text_styles_const.dart';

import '../../../../../../core/book/model/author_model.dart';

class CustomCardAuthorWidget extends StatelessWidget {
  const CustomCardAuthorWidget({Key? key, required this.author})
      : super(key: key);

  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColorsConst.divider,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(author.picture!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(author.name, style: AppTextStylesConst.titleBookHome),
                  Text('${author.booksCount.toString()} livros',
                      style: AppTextStylesConst.subtitleBookHome),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
