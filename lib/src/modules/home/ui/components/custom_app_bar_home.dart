import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({Key? key, required this.innerBoxIsScrolled})
      : super(key: key);

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Image.asset('assets/images/logo_ssbook.png'),
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      bottom: TabBar(
        indicatorColor: const Color(0xFFA076F2),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 5.0, color: Color(0xFFA076F2)),
          insets: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
        ),
        tabs: [
          const Tab(
              child: Text('Meus Livros',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF555555),
                  ))),
          const Tab(
              child: Text('Emprestados',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF555555),
                  ))),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ],
      ),
    );
  }
}
