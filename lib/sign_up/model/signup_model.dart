class UserModel {
  String? id;
  String? username;
  String? email;
  num? phone;
  String? image;
  UserModel({this.id, this.image, this.phone, this.username, this.email});

//data from Server

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      phone: json['phone'],
      image: json['image'],
      email: json['email'],
    );
  }

  // sending data to server
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}
