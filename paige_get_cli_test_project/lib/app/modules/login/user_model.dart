class User {
  Class? user;

  User({this.user});

  User.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? Class?.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? bornYear;
  String? asset;

  User({this.name, this.bornYear, this.asset});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bornYear = json['born_year'];
    asset = json['asset'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['born_year'] = bornYear;
    data['asset'] = asset;
    return data;
  }
}
