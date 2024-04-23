class User{
  String? name;
  String? lname;
  String? email;
  String? imgPath;
  int? count;

  User({this.name, this.lname, this.email,this.imgPath,this.count});

  factory User.fromJson(Map<String,dynamic> map){
    return User(
      name: map["name"],
      email: map["email"],
      lname:map["lname"],
      imgPath:map["imgPath"],
      count:map["count"],
    );
  }
}

