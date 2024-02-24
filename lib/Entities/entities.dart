//class
class UserData {
  String? accessToken;
  String? token;
  String? id;
  String? name;
  String? email;

  String? location;

  String? fcmtoken;

  //constuctor
  UserData({
    this.accessToken,
    this.token,
    this.id,
    this.name,
    this.email,
    this.location,
    this.fcmtoken,
  });
  //map
  factory UserData.fromJson(
    Map<String, dynamic> json,
  ) {
    //returns an object
    //in an object you can be able to call userdata.photourl
    return UserData(
      token: json["token"],
      accessToken: json["accessToken"],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      location: json['location'],
      fcmtoken: json['fcmtoken'],
    );
  }

  Map<String, dynamic> toFirestore() => {
        "token": token,
        "accessToken": accessToken,
        "id": id,
        "name": name,
        "email": email,
        "location": location,
        "fcmtoken": fcmtoken,
      };
}

// 登录返回
class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserData? data;

  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data,
      };
}

class MeListItem {
  String? name;
  String? icon;
  String? explain;
  String? route;

  MeListItem({
    this.name,
    this.icon,
    this.explain,
    this.route,
  });

  factory MeListItem.fromJson(Map<String, dynamic> json) => MeListItem(
        name: json["name"],
        icon: json["icon"],
        explain: json["explain"],
        route: json["route"],
      );
}

class LoginRequestEntity {
  String? name;
  String? email;

  String? open_id;
  String? phone;

  LoginRequestEntity({
    this.name,
    this.email,
    this.open_id,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "openid": open_id,
        "phone": phone,
      };
}
