import 'package:manga_easy_routes/src/argument_type.dart';

enum EasyRoutes {
  preferences('/Preference'),
  introduce('/introduce'),
  about('/about'),
  recommendations('/recommendation-screen'),
  mangaLis('/migrate', [
    ArgumentType(key: 'nameManga', type: String),
    ArgumentType(key: 'isUniqueId', type: bool),
  ]),
  // chapter('/chapter', ChapterArguments),
  test('/test', [
    ArgumentType(key: 'idEmblema', type: String),
    ArgumentType(key: 'test', type: double, isRequired: false)
  ]),

  manga('/manga', [
    ArgumentType(key: 'uniqueid', type: String),
  ]);

  final String nameRoute;
  final List<ArgumentType>? arguments;
  const EasyRoutes(this.nameRoute, [this.arguments]);
}
