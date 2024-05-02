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

class SearchProductModel {
  final int? idProduct;
  final int? idCategory;
  final String? productName;
  final String? categoryName;
  final String? productImage;
  final String? categoryImage;

  SearchProductModel({
    this.idCategory,
    this.productName,
    this.categoryName,
    this.productImage,
    this.categoryImage, 
    this.idProduct,}
  );

  static SearchProductModel fromJson(Map<String, dynamic> json) {
    return SearchProductModel(
      idProduct: json['id_product'],
      idCategory: json['id_category'],
      productName: json['product_name'],
      categoryName: json['category_name'],
      productImage: json['product_image'],
      categoryImage: json['category_image'],
    );
  }
}

class MostPurchasedModel {
  final int? idProduct;
  final int? totalCount;

  MostPurchasedModel({
    this.idProduct,
    this.totalCount,
  });

  static MostPurchasedModel fromJson(Map<String, dynamic> json) {
    return MostPurchasedModel(
      idProduct: json['id_product'],
      totalCount: json['total_count'],
    );
  }
}