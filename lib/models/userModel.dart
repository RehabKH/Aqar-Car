class UserModel {
  String id;
  String userType;
  String deviceToken;
  String gender;
  String imgUrl;
  String fullName;
  String address;
  bool isLogged;
  String email;
  bool emailConfirmed;
  String pass;
  String phone;
  String userName;

  UserModel(
      {this.id,
      this.address,
      this.deviceToken,
      this.email,
      this.emailConfirmed,
      this.fullName,
      this.gender,
      this.imgUrl,
      this.isLogged,
      this.pass,
      this.phone,
      this.userType,this.userName});
}
