part of 'category_cubit.dart';

abstract class CategoryState {}
@immutable
class CategoryInitial extends CategoryState {}

class CategorySuccess extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryFailure extends CategoryState {}

