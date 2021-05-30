import 'package:flutter/material.dart';

import 'TabBar2/medicament_details.dart';
import 'catScreens/subcategories _list.dart';
import 'navbar/classethérapeutiqueScreen.dart';


class AppRouter {

  // Possible routes
  static const medList = 'medlist';
  static const medDetails = 'medDetails';
  static const categoriesList = 'categoriesList';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case medDetails:
        return MaterialPageRoute(builder: (_) => MedicamentDetails());
      case categoriesList:
        return MaterialPageRoute(builder: (_) => classetherapeutique());
      case medList:
        return MaterialPageRoute(builder: (_) => subCategoriesList(""));

      default:
    }
  }


}
