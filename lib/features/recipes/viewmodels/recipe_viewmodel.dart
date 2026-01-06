import 'package:flutter/material.dart';
import 'package:app_final/core/network/api_client.dart';
import 'package:app_final/features/recipes/models/meal.dart';
import 'package:app_final/features/recipes/services/recipe_service.dart';

enum SearchType { name, ingredient, category }

class RecipeViewModel extends ChangeNotifier {
  final RecipeService _service;
  List<Meal> _meals = [];
  List<String> _categories = [];
  List<String> _ingredients = [];
  bool _isLoading = false;
  String _error = '';
  SearchType _searchType = SearchType.name;

  RecipeViewModel(ApiClient apiClient) : _service = RecipeService(apiClient);

  List<Meal> get meals => _meals;
  List<String> get categories => _categories;
  List<String> get ingredients => _ingredients;
  bool get isLoading => _isLoading;
  String get error => _error;
  SearchType get searchType => _searchType;

  void setSearchType(SearchType type) {
    _searchType = type;
    notifyListeners();
  }

  Future<void> searchMeals(String query) async {
    if (query.isEmpty) return;

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      switch (_searchType) {
        case SearchType.name:
          _meals = await _service.searchMeals(query);
          break;
        case SearchType.ingredient:
          _meals = await _service.filterByIngredient(query);
          break;
        case SearchType.category:
          _meals = await _service.filterByCategory(query);
          break;
      }
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadCategories() async {
    try {
      _categories = await _service.getCategories();
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  Future<void> loadIngredients() async {
    try {
      _ingredients = await _service.getIngredients();
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  Future<void> loadRandomMeals() async {
    _isLoading = true;
    _error = '';
    notifyListeners();
    try {
      _meals = await _service.getRandomMeals();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}