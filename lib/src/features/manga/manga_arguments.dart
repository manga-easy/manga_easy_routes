import 'package:manga_easy_routes/manga_easy_routes.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaArguments extends EasyArguments {
  final Manga manga;
  final DetalhesManga? detalhesManga;

  MangaArguments({
    required this.manga,
    this.detalhesManga,
  });
}
