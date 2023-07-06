import 'dart:convert';

import 'package:get/get.dart';
import 'package:library_app/app/data/models/books.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final apiUrl = "http://127.0.0.1:3000/book";

  Future<List<Books>> getBooks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> bookList = jsonData['data'];

      List<Books> books = bookList.map((json) => Books.fromJson(json)).toList();

      books.forEach((book) {
        print("Title: ${book}");
        print("Author: ${book}");
        print("-------------------------");
      });

      return books;
    } else {
      throw Exception('Failed to fetch book data');
    }
  }
}
