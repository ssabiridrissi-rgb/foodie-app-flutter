import 'package:app_final/core/network/api_client.dart';
import 'package:app_final/features/recipes/models/meal.dart';

class GalleryService {
  final ApiClient _apiClient;

  GalleryService(this._apiClient);

  Future<List<Meal>> getGalleryMeals() async {
    List<Meal> meals = [];
    // Get multiple random meals for gallery
    for (int i = 0; i < 20; i++) {
      final url = 'https://www.themealdb.com/api/json/v1/1/random.php';
      final data = await _apiClient.get(url);
      if (data['meals'] != null) {
        meals.addAll((data['meals'] as List).map((json) => Meal.fromJson(json)));
      }
    }
    return meals;
  }
}