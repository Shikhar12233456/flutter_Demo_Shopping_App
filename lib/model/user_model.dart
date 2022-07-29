class Usermodel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  Usermodel({this.uid, this.email, this.firstName, this.secondName});

  factory Usermodel.fromMap(Map) {
    return Usermodel(
      uid: Map['uid'],
      email: Map['email'],
      firstName: Map['firstName'],
      secondName: Map['secondName'],
    );
  }
  //data sending

  Map<String, dynamic> toMap() {
    return {
      'uid' : uid,
      'email' : email,
      'firstName' : firstName,
      'secondName' : secondName,
    };
  }
}
