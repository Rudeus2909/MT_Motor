class ProductDetailModel {
  final int? idProductDetail;
  final String weight;
  final String height;
  final String width;
  final String length;
  final String petroTankCapacity;
  final String engineType;
  final String cylinderCapacity;
  final String maximumCapacity;
  final String oilCapacity;
  final String fuelConsumption;
  final String gear;
  final int idProduct;

  ProductDetailModel({
    this.idProductDetail,
    required this.weight,
    required this.height,
    required this.width,
    required this.length,
    required this.petroTankCapacity,
    required this.engineType,
    required this.cylinderCapacity,
    required this.maximumCapacity,
    required this.oilCapacity,
    required this.fuelConsumption,
    required this.gear,
    required this.idProduct,
  });

  static ProductDetailModel fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      idProductDetail: json['id_specification'],
      weight: json['weight'],
      height: json['height'],
      width: json['width'],
      length: json['_length'],
      petroTankCapacity: json['petro_tank_capacity'],
      engineType: json['engine_type'],
      cylinderCapacity: json['cylinder_capacity'],
      maximumCapacity: json['maximum_capacity'],
      oilCapacity: json['oil_capacity'],
      fuelConsumption: json['fuel_consumption'],
      gear: json['gear'],
      idProduct: json['id_product'],
    );
  }
}
