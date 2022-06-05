import 'package:flutter/material.dart';

import '../widgets/custom_chip_category.dart';

class ListCategoryComponent extends StatelessWidget {
  const ListCategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: const [
          SizedBox(width: 20),
          CustomChipCategoryWidget(isSelected: true, label: 'Todos'),
          SizedBox(width: 10),
          CustomChipCategoryWidget(isSelected: false, label: 'Romance'),
          SizedBox(width: 10),
          CustomChipCategoryWidget(isSelected: false, label: 'Aventura'),
          SizedBox(width: 10),
          CustomChipCategoryWidget(isSelected: false, label: 'Comédia'),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
