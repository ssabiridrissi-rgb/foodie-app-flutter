import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_final/core/constants/constants.dart';
import 'package:app_final/features/recipes/viewmodels/recipe_viewmodel.dart';
import 'package:app_final/features/recipes/models/meal.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RecipeViewModel>(context, listen: false).loadRandomMeals();
    });
  }

  String _getSearchTypeLabel(SearchType type) {
    switch (type) {
      case SearchType.name:
        return 'Nom de recette';
      case SearchType.ingredient:
        return 'Ingrédient';
      case SearchType.category:
        return 'Catégorie';
    }
  }

  String _getHintText(SearchType type) {
    switch (type) {
      case SearchType.name:
        return 'Rechercher par nom...';
      case SearchType.ingredient:
        return 'Rechercher par ingrédient...';
      case SearchType.category:
        return 'Rechercher par catégorie...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.recipesTitle,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(AppConstants.primaryColor),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Consumer<RecipeViewModel>(
                  builder: (context, viewModel, child) {
                    return DropdownButtonFormField<SearchType>(
                      initialValue: viewModel.searchType,
                      decoration: InputDecoration(
                        labelText: 'Type de recherche',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: SearchType.values.map((type) {
                        return DropdownMenuItem<SearchType>(
                          value: type,
                          child: Text(_getSearchTypeLabel(type)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          viewModel.setSearchType(value);
                          _searchController.clear();
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 16),
                Consumer<RecipeViewModel>(
                  builder: (context, viewModel, child) {
                    return TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: _getHintText(viewModel.searchType),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onSubmitted: (query) {
                        if (query.isNotEmpty) {
                          Provider.of<RecipeViewModel>(context, listen: false).searchMeals(query);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<RecipeViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (viewModel.error.isNotEmpty) {
                  return Center(child: Text('Erreur: ${viewModel.error}'));
                }
                return ListView.builder(
                  itemCount: viewModel.meals.length,
                  itemBuilder: (context, index) {
                    final meal = viewModel.meals[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: Hero(
                          tag: meal.id,
                          child: CachedNetworkImage(
                            imageUrl: meal.thumbnail,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                        title: Text(
                          meal.name,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '${meal.category} - ${meal.area}',
                          style: GoogleFonts.poppins(),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailPage(meal: meal),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final Meal meal; // Use Meal model

  RecipeDetailPage({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
        backgroundColor: Color(AppConstants.primaryColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: meal.id,
              child: CachedNetworkImage(
                imageUrl: meal.thumbnail,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 16),
            Text(
              meal.name,
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Catégorie: ${meal.category} | Région: ${meal.area}',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              'Ingrédients:',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            ...List.generate(meal.ingredients.length, (index) {
              return Text(
                '${meal.measures[index]} ${meal.ingredients[index]}',
                style: GoogleFonts.poppins(),
              );
            }),
            SizedBox(height: 16),
            Text(
              'Instructions:',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              meal.instructions,
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      ),
    );
  }
}