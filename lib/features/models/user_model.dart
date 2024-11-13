class UserModel {
  String? userName;
  String? mobileNumber;
  String? countryCode;
  UserModel({
    this.userName,
    this.mobileNumber,
    this.countryCode
});
  UserModel copyWith({
    String? userName,
    String? mobileNumber,
    String? countryCode,
}) {
    return UserModel(
        userName: userName ?? this.userName,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        countryCode: countryCode ?? this.countryCode
    );
  }
factory UserModel.fromMap(Map <String,dynamic> map){
    return UserModel(
      userName: map['username'],
      mobileNumber: map['mobileNumber'],
      countryCode: map['countryCode']
    );
  }
  Map <String,dynamic> toMap() => {
    'userName' : this.userName,
    'mobileNumber' : this.mobileNumber,
    'countryCode' : this.countryCode
  };
}