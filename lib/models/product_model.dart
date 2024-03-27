class ProductModel {
  final int? idProduct;
  final String productName;
  final int? idCategory;
  final String productImage;

  ProductModel({
    this.idProduct,
    required this.productName,
    required this.idCategory,
    required this.productImage,
  });

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      idProduct: json['id_product'],
      productName: json['product_name'],
      idCategory: json['id_category'],
      productImage: json['product_image'],
    );
  }
}
