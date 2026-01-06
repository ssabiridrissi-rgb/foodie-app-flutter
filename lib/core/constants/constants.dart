class AppConstants {
  // API URLs
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
  static const String searchMealsUrl = '${baseUrl}search.php?s=';
  static const String categoriesUrl = '${baseUrl}categories.php';
  static const String randomMealsUrl = '${baseUrl}random.php';

  // Colors
  static const int primaryColor = 0xFFFF6B35; // Orange
  static const int secondaryColor = 0xFFF7931E; // Yellow
  static const int accentColor = 0xFFD72638; // Red
  static const int backgroundColor = 0xFFFFF8E1; // Light cream
  static const int textColor = 0xFF2D2D2D; // Dark gray

  // Strings
  static const String appTitle = 'Foodie App';
  static const String homeTitle = 'Home CV';
  static const String recipesTitle = 'Recipes';
  static const String categoriesTitle = 'Categories';
  static const String galleryTitle = 'Gallery';
}