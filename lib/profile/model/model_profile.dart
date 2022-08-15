class HomeModel {
  String? department;
  String? image;
  String? username;
  num? salary;
  HomeModel({
    this.department,
    this.image,
    this.username,
    this.salary,
  });

//data from Server

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      department: map['department'],
      image: map['image'],
      username: map['username'],
      salary: map['salary'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'department': department,
      'image': image,
      'username': username,
      'salary': salary,
    };
  }
}
