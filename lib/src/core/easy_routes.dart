import 'package:manga_easy_routes/src/features/manga/manga_arguments.dart';
import 'package:manga_easy_routes/src/features/onboarding/introduce_arguments.dart';
import 'package:manga_easy_routes/src/features/onboarding/preferences_arguments.dart';

enum EasyRoutes {
  preferences('/Preference', PreferencesArguments),
  introduce('/introduce', IntroduceArguments),
  // chapter('/chapter', ChapterArguments),
  manga('/manga', MangaArguments);

  final String nameRoute;
  final Type arguments;
  const EasyRoutes(this.nameRoute, this.arguments);
}
