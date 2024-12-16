class SignUpFormModel {
  String? email;
  String? username;
  String? password;
  String? mobile;
  String? otp;
  String? countryCode;

  SignUpFormModel({
    this.email,
    this.username,
    this.password,
    this.mobile,
    this.otp,
    this.countryCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'mobile': mobile,
      'otp': otp,
      'countryCode': countryCode,
    };
  }
}
