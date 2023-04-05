import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.indigo,
            secondary: Colors.amber,
          ),
        ),
        home: const PlacesListScreen(),
        routes: {
          //AppRoutes.HOME: (ctx) => const PlacesListScreen(),
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
