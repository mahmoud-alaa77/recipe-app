part of 'recipe_cubit.dart';

@immutable
abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeSuccess extends RecipeState {}
class RecipeFailure extends RecipeState {}
class RecipeLoading extends RecipeState {}
