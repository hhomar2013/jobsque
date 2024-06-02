class UserModel{
  String name;
  String email;
  String created_at;
  String updated_at;
  UserModel({
    required this.name,
    required this.email,
    required this.created_at,
    required this.updated_at,
  });

  factory UserModel.formJson(Map<String,dynamic>? json){
    return UserModel(

        name: json?['name'],
        email: json?['email'],
      created_at: json?['created_at'],
      updated_at: json?['updated_at'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'created_at' : created_at,
      'updated_at' : updated_at,
    };
  }



}