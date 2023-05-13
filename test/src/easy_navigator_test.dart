import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manga_easy_routes/manga_easy_routes.dart';
import 'package:manga_easy_routes/src/exceptions/required_argument_exception.dart';
import 'package:manga_easy_routes/src/exceptions/type_incorrect_exception.dart';
import 'package:mocktail/mocktail.dart';

import '../../exemples/easy_navigator.dart';

class ContextMock extends Mock implements BuildContext {}

void main() {
  Route<dynamic>? onRouter(
      settings, Map<String, dynamic> arguments, EasyRoutes route) {
    if (settings.name == EasyRoutes.introduce.nameRoute) {
      return MaterialPageRoute(
        builder: (context) => Container(),
      );
    }
    if (settings.name == EasyRoutes.test.nameRoute) {
      final arguments = settings.arguments as Map<String, dynamic>?;
      return MaterialPageRoute(
        builder: (context) => EasyNavigatorPage(
          idEmblema: arguments?['idEmblema'],
        ),
      );
    }
    return MaterialPageRoute(
      builder: (context) => TextButton(
        onPressed: () => EasyNavigator.of(context).pushNamed(
          route: route, arguments: arguments,
          //arguments: {'idEmblema': 'isudfghiuhiauhiahsdf'},
        ),
        child: const Text('test'),
      ),
    );
  }

  testWidgets('easy navigator with arguments empty', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        onGenerateRoute: (settings) => onRouter(
          settings,
          {},
          EasyRoutes.introduce,
        ),
      ),
    );

    await tester.tap(find.byWidgetPredicate((widget) => widget is TextButton));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('easy navigator with arguments idEmblema', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        onGenerateRoute: (settings) => onRouter(
          settings,
          {'idEmblema': 'sdfgsdfgsdfg'},
          EasyRoutes.test,
        ),
      ),
    );

    await tester.tap(find.byWidgetPredicate((widget) => widget is TextButton));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(TextButton), findsOneWidget);
  });

  test(
      'easy navigator with arguments idEmblema with error TypeIncorrectException',
      () {
    final test = EasyNavigator.of(ContextMock());
    expectSync(
      test.pushNamed(
        route: EasyRoutes.test, arguments: {'idEmblema': 34563456},
        //arguments: {'idEmblema': 'isudfghiuhiauhiahsdf'},
      ),
      throwsA(isA<TypeIncorrectException>()),
    );
  });

  test(
      'easy navigator with arguments idEmblema with error RequiredArgumentException',
      () {
    final test = EasyNavigator.of(ContextMock());
    expectSync(
      test.pushNamed(
        route: EasyRoutes.test, arguments: {},
        //arguments: {'idEmblema': 'isudfghiuhiauhiahsdf'},
      ),
      throwsA(isA<RequiredArgumentException>()),
    );
  });

  test(
      'easy navigator with arguments idEmblema with error TypeIncorrectException with Argument not required',
      () {
    final test = EasyNavigator.of(ContextMock());
    expectSync(
      test.pushNamed(
        route: EasyRoutes.test,
        arguments: {
          'idEmblema': 34563456,
          'test': null,
        },
        //arguments: {'idEmblema': 'isudfghiuhiauhiahsdf'},
      ),
      throwsA(isA<TypeIncorrectException>()),
    );
  });
}
