import 'package:flutter/material.dart';
import 'package:app_final/core/network/api_client.dart';
import 'package:app_final/features/gallery/services/gallery_service.dart';
import 'package:app_final/features/recipes/models/meal.dart';

class GalleryViewModel extends ChangeNotifier {
  final GalleryService _service;
  List<Meal> _meals = [];
  bool _isLoading = false;
  String _error = '';

  GalleryViewModel(ApiClient apiClient) : _service = GalleryService(apiClient);

  List<Meal> get meals => _meals;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> loadGalleryMeals() async {
    _isLoading = true;
    _error = '';
    notifyListeners();
    try {
      _meals = await _service.getGalleryMeals();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}