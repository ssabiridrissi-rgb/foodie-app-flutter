# 📱 Foodie App — Flutter

**Application mobile de recettes de cuisine construite avec Flutter, en architecture MVVM, alimentée par l'API publique [TheMealDB](https://www.themealdb.com/api.php).**

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9-0175C2?logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/State-Provider-6A1B9A)
![Platforms](https://img.shields.io/badge/Android_·_iOS_·_Web-lightgrey)

Projet du module **Développement mobile** — Génie informatique, Université Mundiapolis.

---

## ✨ Fonctionnalités

| Écran | Contenu |
|---|---|
| **Home CV** | Page de présentation personnelle (profil, compétences) |
| **Recipes** | Recherche de recettes par nom, suggestions aléatoires |
| **Categories** | Parcours des catégories de plats |
| **Gallery** | Galerie d'images de plats |

- Navigation par barre incurvée (`curved_navigation_bar`) et menu latéral
- Images mises en cache (`cached_network_image`) et animations (`animate_do`, `flutter_staggered_animations`)
- Typographie Poppins via `google_fonts`

## 🏗️ Architecture MVVM

```
View (pages)  ──▶  ViewModel (ChangeNotifier)  ──▶  Service  ──▶  ApiClient (http)  ──▶  TheMealDB
      ▲                     │
      └──── notifyListeners ┘          injection via MultiProvider
```

```
lib/
├── core/
│   ├── constants/      # URLs de l'API, couleurs, libellés
│   └── network/        # ApiClient (wrapper http)
├── features/
│   ├── home_cv/        # pages
│   ├── recipes/        # models · services · viewmodels · pages
│   ├── categories/     # models · services · viewmodels · pages
│   └── gallery/        # services · viewmodels · pages
├── shared/widgets/     # barre de navigation, drawer
└── main.dart           # MultiProvider + MaterialApp
```

Chaque fonctionnalité a son propre dossier (*feature-first*) et sépare les données (models/services), l'état (viewmodels) et l'affichage (pages).

## 🚀 Lancer le projet

**Prérequis :** Flutter SDK (Dart ≥ 3.9).

```bash
flutter pub get
flutter run            # sur un émulateur, un appareil ou Chrome
```

---

👤 **Saad Sabir Idrissi** — Élève ingénieur Data & IA · [Portfolio](https://saad-sabir-idrissi.vercel.app) · [LinkedIn](https://www.linkedin.com/in/saad-sabir-idrissi)
