class UserModel {
  String userId;
  String userType;
  String contactNumber;
  String userRole;
  String organisationId;
  String countryCode;
  String userStatus;
  String userName;
  bool partOfOrganisation;
  String organisationName;

  UserModel({
    required this.userId,
    required this.userType,
    required this.contactNumber,
    required this.userRole,
    required this.organisationId,
    required this.countryCode,
    required this.userStatus,
    required this.userName,
    required this.partOfOrganisation,
    required this.organisationName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userId: json["user_id"],
      userType: json["user_type"],
      contactNumber: json["contact_number"],
      userRole: json["user_role"],
      organisationId: json["organisation_id"],
      countryCode: json["country_code"],
      userStatus: json["user_status"],
      userName: json["user_name"],
      partOfOrganisation: json["part_of_organisation"],
      organisationName: json["organisation_name"]);

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_type": userType,
        "contact_number": contactNumber,
        "user_role": userRole,
        "organisation_id": organisationId,
        "country_code": countryCode,
        "user_status": userStatus,
        "user_name": userName,
        "part_of_organisation": partOfOrganisation,
        "organisation_name": organisationName
      };
}
