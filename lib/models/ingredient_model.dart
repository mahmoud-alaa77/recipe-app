
class IngredientModel{

  final String? name;
  final String? amount;

  IngredientModel({
    required this.name,
    required this.amount,

  });

  factory IngredientModel.fromJson(json){
    return IngredientModel(
        name: json["nameClean"],
        amount: json["amount"],


    );
  }
}