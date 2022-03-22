

class User{
  int id;
  String email;
  String firstName;
  String lastName;
  String fullName;
  String userName;
  String token;
  bool isActive;
  bool isBlocked;
  DateTime dateCreated;
  String phoneNumber;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.userName,
    required this.token,
    required this.isActive,
    required this.isBlocked,
    required this.dateCreated,
    required this.phoneNumber,
});



  factory User.fromJson(Map<String,dynamic> map){
    return User(
        id: map["id"],
        email: map["email"],
        firstName: map["first_name"],
        lastName: map["last_name"],
        fullName: map["full_name"],
        userName: map["username"],
        token: map["auth_token"],
        isActive: map["is_active"],
        isBlocked: map["is_blocked"],
        dateCreated: DateTime.parse(map["date_created"]),
        phoneNumber: map["phone_number"]
    );
  }
}