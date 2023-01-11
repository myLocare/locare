abstract class User {
  String name;
  String email;

  String phone;
  String country;
  String? image;
  String status;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.country,
    this.image,
    required this.status,
  });
}
