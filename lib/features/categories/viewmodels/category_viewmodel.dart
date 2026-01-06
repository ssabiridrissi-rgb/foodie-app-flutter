import 'package:flutter/material.dart';
import 'package:app_final/core/network/api_client.dart';
import 'package:app_final/features/categories/models/category.dart';
import 'package:app_final/features/categories/services/category_service.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryService _service;
  List<Category> _categories = [];
  bool _isLoading = false;
  String _error = '';

  CategoryViewModel(ApiClient apiClient) : _service = CategoryService(apiClient);

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> loadCategories() async {
    _isLoading = true;
    _error = '';
    notifyListeners();
    try {
      _categories = await _service.getCategories();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}