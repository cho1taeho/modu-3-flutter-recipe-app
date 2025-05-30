
import 'package:recipe_app/data/model/recipes.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

import '../data_source/recipe/recipe_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;


  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<List<Recipes>> getRecipes() async {
    try {
      final recipeData = await _recipeDataSource.getRecipes();
      return recipeData;
    } catch(e) {
      throw Exception(e);
    }
  }
}
