import 'package:flutter/material.dart';

import '../../../../core/user/models/user_model.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    Key? key,
    required this.innerBoxIsScrolled,
    required this.user,
  }) : super(key: key);

  final bool innerBoxIsScrolled;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
        ),
      ),
      title: Image.asset('assets/images/logo_ssbook.png'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.picture),
          ),
        )
      ],
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
