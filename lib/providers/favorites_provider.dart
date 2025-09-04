import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // initial data via super of type <List<Meal>>
  FavoriteMealsNotifier() : super([]);
  // here in riverpod .add .remove don't work as it don't make changes in same memory itself but on a differnt memory.
  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((item) => item.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
      // instance of FavoriteMealsNotifier
      return FavoriteMealsNotifier();
    });
