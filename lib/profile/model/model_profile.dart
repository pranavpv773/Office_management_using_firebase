class HomeModel {
  String? department;
  String? image;
  String? employee;
  String? salary;
  HomeModel({
    this.department,
    this.image,
    this.employee,
    this.salary,
  });

//data from Server

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      department: map['department'],
      image: map['image'],
      employee: map['employee'],
      salary: map['salary'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'department': department,
      'image': image,
      'employee': employee,
      'salary': salary,
    };
  }
}
