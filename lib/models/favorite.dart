class FavoriteModel {
  final int idProduct;
  final int idUser;
  final int idColor;
  final String favorite;

  FavoriteModel({
    required this.idUser,
    required this.idProduct,
    required this.idColor,
    required this.favorite,
  });

  static FavoriteModel fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
        idUser: json['id_user'],
        idProduct: json['id_product'],
        idColor: json['id_color'],
        favorite: json['favorite']);
  }
}

class FavoriteProductModel {
  final int idProduct;
  final int idUser;
  final int idColor;
  final String favorite;
  final int price;
  final int amount;
  final String imageUrl;
  final String productName;
  final String colorName;

  FavoriteProductModel({
    required this.idProduct,
    required this.idUser,
    required this.idColor,
    required this.favorite,
    required this.price,
    required this.amount,
    required this.imageUrl,
    required this.productName,
    required this.colorName,
  });

  static FavoriteProductModel fromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      idProduct: json['id_product'],
      idUser: json['id_user'],
      idColor: json['id_color'],
      favorite: json['favorite'],
      price: json['price'],
      amount: json['amount'],
      imageUrl: json['image_path'],
      productName: json['product_name'],
      colorName: json['color_name'],
    );
  }
}

class MostFavoriteModel {
  final int? idProduct;
  final int? favoriteCount;

  MostFavoriteModel({
    this.idProduct,
    this.favoriteCount,
  });

  static MostFavoriteModel fromJson(Map<String, dynamic> json) {
    return MostFavoriteModel(
      idProduct: json['id_product'],
      favoriteCount: json['favorite_count'],
    );
  }
}