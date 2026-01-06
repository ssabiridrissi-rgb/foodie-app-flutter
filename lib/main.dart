import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:app_final/core/constants/constants.dart';
import 'package:app_final/core/network/api_client.dart';
import 'package:app_final/features/home_cv/pages/home_cv_page.dart';
import 'package:app_final/features/recipes/pages/recipe_page.dart';
import 'package:app_final/features/categories/pages/categories_page.dart';
import 'package:app_final/features/gallery/pages/gallery_page.dart';
import 'package:app_final/features/recipes/viewmodels/recipe_viewmodel.dart';
import 'package:app_final/features/categories/viewmodels/category_viewmodel.dart';
import 'package:app_final/features/gallery/viewmodels/gallery_viewmodel.dart';
import 'package:app_final/shared/widgets/app_curved_navigation_bar.dart';
import 'package:app_final/shared/widgets/app_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiClient>(create: (_) => ApiClient(http.Client())),
        ChangeNotifierProvider<RecipeViewModel>(
          create: (context) => RecipeViewModel(Provider.of<ApiClient>(context, listen: false)),
        ),
        ChangeNotifierProvider<CategoryViewModel>(
          create: (context) => CategoryViewModel(Provider.of<ApiClient>(context, listen: false)),
        ),
        ChangeNotifierProvider<GalleryViewModel>(
          create: (context) => GalleryViewModel(Provider.of<ApiClient>(context, listen: false)),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.appTitle,
        theme: ThemeData(
          primaryColor: Color(AppConstants.primaryColor),
          scaffoldBackgroundColor: Color(AppConstants.backgroundColor),
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(AppConstants.primaryColor),
            titleTextStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeCvPage(),
    RecipePage(),
    CategoriesPage(),
    GalleryPage(),
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle(_currentIndex)),
      ),
      drawer: AppDrawer(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: AppCurvedNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return AppConstants.homeTitle;
      case 1:
        return AppConstants.recipesTitle;
      case 2:
        return AppConstants.categoriesTitle;
      case 3:
        return AppConstants.galleryTitle;
      default:
        return AppConstants.appTitle;
    }
  }
}
