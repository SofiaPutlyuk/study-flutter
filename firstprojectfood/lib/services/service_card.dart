import "dart:convert";
import "package:http/http.dart" as http;
import "package:flutter/foundation.dart";
Future<List<Category>> fetchRecipes() async {
  final url = Uri.parse(
    "https://www.themealdb.com/api/json/v1/1/categories.php",
  );
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List categories = data["categories"];
      return categories.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Error: $e");
  }
}
