import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/book_model.dart';


class SharedPreferencesHelper {
  static const String _favoriteBooksKey = 'favoriteBooks';

  Future<void> saveFavoriteBooks(List<BookModel> books) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = books.map((book) => json.encode(book.toJson())).toList();
    await prefs.setStringList(_favoriteBooksKey, jsonList);
  }

  Future<List<BookModel>> getFavoriteBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList(_favoriteBooksKey);
    if (jsonList != null) {
      return jsonList.map((jsonString) => BookModel.fromJson(json.decode(jsonString))).toList();
    }
    return [];
  }

   Future<void> clearFavoriteBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoriteBooksKey);
  }
}
