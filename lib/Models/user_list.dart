class UserList {
  String? name;
  String? image;
  bool? checkValue;

  UserList(this.name, this.image, this.checkValue);

  UserList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    checkValue = json['checkValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['checkValue'] = this.checkValue;
    return data;
  }
}