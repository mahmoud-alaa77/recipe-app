
class CategoryModel {

  final String title;
  final String imageUrl;

  CategoryModel({
    required this.title,
    required this.imageUrl
  });

  factory CategoryModel.fromJson(json){
    return CategoryModel(
      title: json["strCategory"],
      imageUrl: json["strCategoryThumb"],
    );
  }
}