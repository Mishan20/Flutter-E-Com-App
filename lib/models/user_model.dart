class UserModel {
  String name;
  String userImage;
  String email;
  String uid;
  List<String> favourite;

  UserModel({
    required this.name,
    required this.userImage,
    required this.email,
    required this.uid,
    required this.favourite,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      userImage: json['userImage'],
      email: json['email'],
      uid: json['uid'],
      favourite: json['favourite'] == null
            ? []
            : List<String>.from(json['favourite']));
  }
  Map<String, dynamic> toJson() {
    return {"name": name, "userImage": userImage, "email": email, "uid": uid};
  }
}
