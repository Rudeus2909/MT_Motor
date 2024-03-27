class UserModel {
  final int idUser;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String password;
  final String role;

  UserModel({
    required this.idUser,
    required this.name,
    required this.email,
    required this.address,
    required this.password,
    required this.phone,
    required this.role,
  });

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['id_user'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      password: json['password'],
      phone: json['phone'],
      role: json['role'],
    );
  }
}
