import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fatecflix/model/filme.dart';

class FilmeService {
  static const String _keyFilmes = 'filmes';

  static Future<void> salvarFilme(Filme filme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> filmesString = prefs.getStringList(_keyFilmes) ?? [];
    filmesString.add(jsonEncode(filme.toJson()));
    await prefs.setStringList(_keyFilmes, filmesString);
  }

  static Future<List<Filme>> obterFilmes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> filmesString = prefs.getStringList(_keyFilmes) ?? [];
    List<Filme> filmes = [];
    for (String filmeString in filmesString) {
      filmes.add(Filme.fromJson(jsonDecode(filmeString)));
    }
    return filmes;
  }
}
