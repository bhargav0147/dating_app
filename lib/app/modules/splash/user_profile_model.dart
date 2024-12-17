import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  bool? success;
  UserData? userData;

  UserProfileModel({
    this.success,
    this.userData,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    success: json["success"],
    userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "userData": userData?.toJson(),
  };
}

class UserData {
  String? id;
  String? username;
  String? email;
  String? mobile;
  String? countryCode;
  Profile? profile;
  List<dynamic>? friends;
  List<dynamic>? blockedUsers;
  bool? isEmailVerified;
  List<dynamic>? posts;
  List<dynamic>? videos;
  bool? isProfileCompleted;
  bool? isPrefrencesCompleted;
  int? v;
  Prefrences? prefrences;

  UserData({
    this.id,
    this.username,
    this.email,
    this.mobile,
    this.countryCode,
    this.profile,
    this.friends,
    this.blockedUsers,
    this.isEmailVerified,
    this.posts,
    this.videos,
    this.isProfileCompleted,
    this.isPrefrencesCompleted,
    this.v,
    this.prefrences,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    countryCode: json["countryCode"],
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    friends: json["friends"] == null ? [] : List<dynamic>.from(json["friends"]!.map((x) => x)),
    blockedUsers: json["blockedUsers"] == null ? [] : List<dynamic>.from(json["blockedUsers"]!.map((x) => x)),
    isEmailVerified: json["isEmailVerified"],
    posts: json["posts"] == null ? [] : List<dynamic>.from(json["posts"]!.map((x) => x)),
    videos: json["videos"] == null ? [] : List<dynamic>.from(json["videos"]!.map((x) => x)),
    isProfileCompleted: json["isProfileCompleted"],
    isPrefrencesCompleted: json["isPrefrencesCompleted"],
    v: json["__v"],
    prefrences: json["prefrences"] == null ? null : Prefrences.fromJson(json["prefrences"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    "mobile": mobile,
    "countryCode": countryCode,
    "profile": profile?.toJson(),
    "friends": friends == null ? [] : List<dynamic>.from(friends!.map((x) => x)),
    "blockedUsers": blockedUsers == null ? [] : List<dynamic>.from(blockedUsers!.map((x) => x)),
    "isEmailVerified": isEmailVerified,
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x)),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
    "isProfileCompleted": isProfileCompleted,
    "isPrefrencesCompleted": isPrefrencesCompleted,
    "__v": v,
    "prefrences": prefrences?.toJson(),
  };
}

class Prefrences {
  String? id;
  String? genderPrefrences;
  int? minAge;
  int? maxAge;
  List<String>? interests;
  String? user;
  int? v;

  Prefrences({
    this.id,
    this.genderPrefrences,
    this.minAge,
    this.maxAge,
    this.interests,
    this.user,
    this.v,
  });

  factory Prefrences.fromJson(Map<String, dynamic> json) => Prefrences(
    id: json["_id"],
    genderPrefrences: json["genderPrefrences"],
    minAge: json["minAge"],
    maxAge: json["maxAge"],
    interests: json["interests"] == null ? [] : List<String>.from(json["interests"]!.map((x) => x)),
    user: json["user"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "genderPrefrences": genderPrefrences,
    "minAge": minAge,
    "maxAge": maxAge,
    "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
    "user": user,
    "__v": v,
  };
}

class Profile {
  String? id;
  String? gender;
  DateTime? dateOfBirth;
  int? lat;
  int? long;
  String? mainImage;
  String? bio;
  List<String>? profilePictures;
  String? city;
  String? country;
  String? user;
  int? v;

  Profile({
    this.id,
    this.gender,
    this.dateOfBirth,
    this.lat,
    this.long,
    this.mainImage,
    this.bio,
    this.profilePictures,
    this.city,
    this.country,
    this.user,
    this.v,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["_id"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    lat: json["lat"],
    long: json["long"],
    mainImage: json["mainImage"],
    bio: json["bio"],
    profilePictures: json["profilePictures"] == null ? [] : List<String>.from(json["profilePictures"]!.map((x) => x)),
    city: json["city"],
    country: json["country"],
    user: json["user"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "gender": gender,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "lat": lat,
    "long": long,
    "mainImage": mainImage,
    "bio": bio,
    "profilePictures": profilePictures == null ? [] : List<dynamic>.from(profilePictures!.map((x) => x)),
    "city": city,
    "country": country,
    "user": user,
    "__v": v,
  };
}
