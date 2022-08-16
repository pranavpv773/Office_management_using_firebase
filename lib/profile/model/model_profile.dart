class HomeModel {
  String? department;
  // String? image;
  String? uid;

  String? email;
  String? phone;
  String? employee;
  String? salary;
  HomeModel({
    this.department,
    this.email,
    this.phone,
    // this.image,
    this.uid,
    this.employee,
    this.salary,
  });

//data from Server

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      department: map['department'],
      // image: map['image'],
      uid: map['uid'],
      employee: map['employee'],
      salary: map['salary'],
      phone: map['phone'],
      email: map['email'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'department': department,
      // 'image': image,
      'uid': uid,
      'employee': employee,
      'salary': salary,
      'phone': phone,
      'email': email,
    };
  }
}
