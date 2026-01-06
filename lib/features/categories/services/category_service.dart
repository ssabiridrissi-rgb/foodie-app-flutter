import 'package:app_final/core/network/api_client.dart';
import 'package:app_final/features/categories/models/category.dart';

class CategoryService {
  final ApiClient _apiClient;

  CategoryService(this._apiClient);

  Future<List<Category>> getCategories() async {
    final url = 'https://www.themealdb.com/api/json/v1/1/categories.php';
    final data = await _apiClient.get(url);
    if (data['categories'] != null) {
      return (data['categories'] as List).map((json) => Category.fromJson(json)).toList();
    }
    return [];
  }
}