class ProductColorsModel {
  final int? idColor;
  final String color;
  final String colorName;
  final int amount;
  final int price;
  final int idProduct;
  final String imageUrl;

  ProductColorsModel(
      {this.idColor,
      required this.color,
      required this.colorName,
      required this.amount,
      required this.price,
      required this.idProduct,
      required this.imageUrl});

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

class ProductColorInfoModel {
  final int idProduct;
  final int idColor;
  final String colorName;
  final String imageUrl;
  final int price;
  final int amount;

  ProductColorInfoModel({
    required this.idProduct,
    required this.idColor,
    required this.colorName,
    required this.imageUrl,
    required this.price,
    required this.amount,
  });

  static ProductColorInfoModel fromJson(Map<String, dynamic> json) {
    return ProductColorInfoModel(
      idProduct: json['id_product'],
      idColor: json['id_color'],
      colorName: json['color_name'],
      imageUrl: json['image_path'],
      price: json['price'],
      amount: json['amount'],
    );
  }
}
