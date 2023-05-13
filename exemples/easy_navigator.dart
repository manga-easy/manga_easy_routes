import 'package:flutter/material.dart';

import 'package:manga_easy_routes/manga_easy_routes.dart';

class EasyNavigatorPage extends StatelessWidget {
  final String idEmblema;
  const EasyNavigatorPage({super.key, required this.idEmblema});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => EasyNavigator.of(context).pushNamed(
        route: EasyRoutes.introduce,
        arguments: {},
      ),
      child: const Text('test'),
    );
  }
}
