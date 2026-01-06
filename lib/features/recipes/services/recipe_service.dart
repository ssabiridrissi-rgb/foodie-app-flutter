import 'package:app_final/core/network/api_client.dart';
import 'package:app_final/features/recipes/models/meal.dart';

class RecipeService {
  final ApiClient _apiClient;

  RecipeService(this._apiClient);

  Future<List<Meal>> searchMeals(String query) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/search.php?s=$query';
    final data = await _apiClient.get(url);
    if (data['meals'] != null) {
      return (data['meals'] as List).map((json) => Meal.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<Meal>> filterByIngredient(String ingredient) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredient';
    final data = await _apiClient.get(url);
    if (data['meals'] != null) {
      return (data['meals'] as List).map((json) => Meal.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<Meal>> filterByCategory(String category) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category';
    final data = await _apiClient.get(url);
    if (data['meals'] != null) {
      return (data['meals'] as List).map((json) => Meal.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<String>> getCategories() async {
    final url = 'https://www.themealdb.com/api/json/v1/1/list.php?c=list';
    final data = await _apiClient.get(url);
    if (data['meals'] != null) {
      return (data['meals'] as List).map((json) => json['strCategory'] as String).toList();
    }
    return [];
  }

  Future<List<String>> getIngredients() async {
    final url = 'https://www.themealdb.com/api/json/v1/1/list.php?i=list';
    final data = await _apiClient.get(url);
    if (data['meals'] != null) {
      return (data['meals'] as List).map((json) => json['strIngredient'] as String).toList();
    }
    return [];
  }

  Future<List<Meal>> getRandomMeals() async {
    final url = 'https://www.themealdb.com/api/json/v1/1/random.php';
    final data = await _apiClient.get(url);
    if (data['meals'] != null) {
      return (data['meals'] as List).map((json) => Meal.fromJson(json)).toList();
    }
    return [];
  }
}