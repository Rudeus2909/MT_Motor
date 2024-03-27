class CategoryModel {
  final int? idCategory;
  final String categoryName;
  final String categoryImage;

  CategoryModel({
    this.idCategory,
    required this.categoryName,
    required this.categoryImage,
  });

  static CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      idCategory: json['id_category'],
      categoryName: json['category_name'],
      categoryImage: json['category_image'],
    );
  }
}
