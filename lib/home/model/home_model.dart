class HomeModel {
  String? product;
  String? image;
  String? type;
  int? prize;
  HomeModel({
    this.product,
    this.image,
    this.type,
    this.prize,
  });

//data from Server

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      product: map['product'],
      image: map['image'],
      type: map['type'],
      prize: map['prize'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'image': image,
      'type': type,
      'prize': prize,
    };
  }
}
