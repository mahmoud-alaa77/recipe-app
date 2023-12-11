class RecipeModel {
  final String id;
  final String title;
  final String? category;
  final String? desc;
  final String imageUrl;
  final String? youtubeVideoUrl;
  final String? area;

  RecipeModel(
      {required this.category,
      required this.desc,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.youtubeVideoUrl,
      required this.area});

  factory RecipeModel.fromJson(json) {
    return RecipeModel(
      title: json["strMeal"],
      imageUrl: json["strMealThumb"],
      id: json["idMeal"],
      desc: json["strInstructions"],
      youtubeVideoUrl: json["strYoutube"],
      category: json["strCategory"],
      area: json["strArea"],
    );
  }
}
