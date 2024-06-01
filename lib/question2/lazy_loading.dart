import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/services.dart';

class LargeDataSet {
  List<String>? _categories;
  List<String>? _venues;
  List<String>? _languages;

  static final LargeDataSet _instance = LargeDataSet._internal();
  // Private Constructor
  LargeDataSet._internal();
  factory LargeDataSet() {
    return _instance;
  }
  List<String> get categoriesList {
    _categories ??= _getCategories();
    return _categories!;
  }

  List<String> get venuesList {
    _venues ??= _getVenues();
    return _venues!;
  }

  Future<List<String>> get languagesList async {
    _languages ??= await _getLanguages();
    return _languages!;
  }

  List<String> _getCategories() {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) items.add(faker.lorem.words(3).join(' '));
    return items;
  }

  List<String> _getVenues() {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) items.add(faker.lorem.words(2).join(' '));
    return items;
  }

  Future<List<String>> _getLanguages() async {
    List<String> items;
    String filePath = "assets/languages.json";
    String jsonString = await rootBundle.loadString(filePath);
    items = await json.decode(jsonString);
    return items;
  }
}
