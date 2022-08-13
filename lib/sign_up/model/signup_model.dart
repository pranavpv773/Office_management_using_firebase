class UserModel {
  String? uid;
  String? username;
  String? email;
  String? phone;
  String? image;
  UserModel({
    this.uid,
    this.image,
    this.phone,
    this.username,
    this.email,
  });

//data from Server

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      phone: map['phone'],
      image: map['image'],
      email: map['email'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}
