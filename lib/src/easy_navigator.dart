import 'package:flutter/widgets.dart';
import 'package:manga_easy_routes/manga_easy_routes.dart';
import 'package:manga_easy_routes/src/argument_type.dart';
import 'package:manga_easy_routes/src/easy_routes.dart';
import 'package:manga_easy_routes/src/exceptions/required_argument_exception.dart';
import 'package:manga_easy_routes/src/exceptions/type_incorrect_exception.dart';

class EasyNavigator {
  final BuildContext context;
  // ignore: unused_element
  EasyNavigator._(this.context);

  EasyNavigator.of(this.context);

  Future<T?> pushNamed<T>({
    required EasyRoutes route,
    required Map<String, dynamic> arguments,
  }) async {
    if (route.arguments != null) {
      for (ArgumentType element in route.arguments!) {
        if (!element.isRequired) {
          continue;
        }
        if (!arguments.containsKey(element.key)) {
          throw RequiredArgumentException(
            'Argumento ${element.key} tipo ${element.type} é obrigatorio para a rota: ${route.nameRoute}.',
          );
        }

        if (arguments[element.key].runtimeType != element.type) {
          throw TypeIncorrectException(
            'Argumento ${element.key} é do tipo ${element.type} e não do tipo ${arguments[element.key].runtimeType}.',
          );
        }
      }
    }

    return await Navigator.pushNamed<T?>(
      context,
      route.nameRoute,
      arguments: arguments,
    );
  }
}
