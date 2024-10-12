class CoffeeModel {
  final String name;

  CoffeeModel(this.name);
}

class CoffeeProduct {
  final String id;
  final String productName;
  final String detail;
  final double price;
  final String imageUrl;
  final double score;

  CoffeeProduct({
    required this.id,
    required this.productName,
    required this.detail,
    required this.price,
    required this.imageUrl,
    required this.score,
  });
}
