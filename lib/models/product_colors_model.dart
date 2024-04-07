class ProductColorsModel {
  final int? idColor;
  final String color;
  final String colorName;
  final int amount;
  final int price;
  final int idProduct;
  final String imageUrl;

  ProductColorsModel({
    this.idColor,
    required this.color,
    required this.colorName,
    required this.amount,
    required this.price,
    required this.idProduct,
    required this.imageUrl
  });

  static ProductColorsModel fromJson(Map<String, dynamic> json) {
    return ProductColorsModel(
      idColor: json['id_color'],
      color: json['color'],
      colorName: json['color_name'],
      amount: json['amount'],
      price: json['price'],
      idProduct: json['id_product'],
      imageUrl: json['image_path'],
    );
  }
}
