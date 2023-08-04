import 'package:flutter/material.dart';
import 'package:proyecto4_bola8/utils/colors.dart';

class AppBarBola8 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  const AppBarBola8({Key? key, required this.title, required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colores.greenblue,
        title: const Text(''),
        actions: <Widget>[
          // IconButton(
          //     onPressed: () => Navigator.of(context).pop,
          //     icon: const Image(
          //       image: AssetImage('assets/ri_arrow-left-line.png'),
          //     )),
          IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage('assets/Vector.png'),
              )),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
