class OrderModel {
  final int idOrder;
  final int idUser;
  final String orderTime;
  final String orderStatus;

  OrderModel({
    required this.idOrder,
    required this.idUser,
    required this.orderTime,
    required this.orderStatus,
  });

  static OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel(
      idOrder: json['id_order'],
      idUser: json['id_user'],
      orderTime: json['order_time'],
      orderStatus: json['order_status'],
    );
  }
}

class OrderDetailModel {
  final int idOrder;
  final int idProduct;
  final int idColor;
  final int quantity;
  final int total;
  final String ordererName;
  final String address;
  final String email;
  final String phone;
  final String imageUrl;
  final String productName;
  final String colorName;

  OrderDetailModel({
    required this.idOrder,
    required this.idProduct,
    required this.idColor,
    required this.quantity,
    required this.total,
    required this.ordererName,
    required this.address,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.productName,
    required this.colorName,
  });

  static OrderDetailModel fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
        idOrder: json['id_order'],
        idProduct: json['id_product'],
        idColor: json['id_color'],
        quantity: json['quantity'],
        total: json['total'],
        ordererName: json['orderer_name'],
        address: json['address'],
        email: json['email'],
        phone: json['phone'],
        imageUrl: json['image_path'],
        productName: json['product_name'],
        colorName: json['color_name']);
  }
}
