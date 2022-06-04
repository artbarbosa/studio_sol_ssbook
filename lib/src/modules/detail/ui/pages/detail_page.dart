import 'package:flutter/material.dart';
import 'package:studio_sol_ssbook/src/core/shared/consts/app_text_styles_const.dart';

import '../../../../core/book/model/book_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            ' widget.title',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.network(book.cover),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black87,
                      Colors.black54,
                      Colors.black.withAlpha(0),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text.rich(
                              softWrap: false,
                              TextSpan(
                                text: book.name,
                                style: AppTextStylesConst.titleBookHome,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Text(
                              book.author!.name,
                              style: AppTextStylesConst.subtitleBookHome,
                            ),
                          ],
                        ),
                        Text(
                          book.description!,
                          softWrap: true,
                          style: AppTextStylesConst.descriptionBookDetail,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
