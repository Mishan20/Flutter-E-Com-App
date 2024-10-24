class UserModel {
  String name;
  String userImage;
  String email;
  String uid;

  UserModel({
    required this.name,
    required this.userImage,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      userImage: json['userImage'],
      email: json['email'],
      uid: json['uid'],
    );
  }
}
