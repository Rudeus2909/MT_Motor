class FavoriteModel {
  final int idProduct;
  final int idUser;
  final int favorite;

  FavoriteModel({
    required this.idUser,
    required this.idProduct,
    required this.favorite,
  });

  static FavoriteModel fromJson(Map<int, dynamic> json) {
    return FavoriteModel(
        idUser: json['id_user'],
        idProduct: json['id_product'],
        favorite: json['favorite']);
  }
}
