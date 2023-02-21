import 'package:flutter/widgets.dart';
import 'package:manga_easy_routes/manga_easy_routes.dart';

class EasyNavi {
  final BuildContext context;
  // ignore: unused_element
  EasyNavi._(this.context);

  EasyNavi.of(this.context);

  Future<T?> pushNamed<T>({
    required EasyRoutes route,
    required EasyArguments arguments,
  }) {
    if (arguments.runtimeType != route.arguments) {
      throw Exception(
        'Argumento invalida para a rota: ${route.nameRoute}.'
        '\n Use ${route.arguments}.',
      );
    }

    return Navigator.pushNamed<T?>(
      context,
      route.nameRoute,
      arguments: arguments,
    );
  }
}
