import 'package:flutter/material.dart';

import '../../../../../../core/book/model/book_model.dart';
import '../../../../../../core/shared/consts/app_colors_const.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 1900,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(book.cover, fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text.rich(
                                  softWrap: true,
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
                          book.isFavorite!
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColorsConst.primary,
                                )
                              : const Icon(Icons.favorite_outline)
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
      ),
    );
  }
}
