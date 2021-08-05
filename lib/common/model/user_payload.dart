
import 'package:basic_template/common/themes/utility.dart';
import 'package:hive/hive.dart';

part 'user_payload.g.dart';

/// main user payload class which store all the information about user
@HiveType(typeId: 0)
class UserPayload extends HiveObject {
  @HiveField(0)
  String userId;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String profilePhoto;
  @HiveField(4)
  String? deviceName;
  @HiveField(5)
  String? deviceType;
  @HiveField(6)
  String? deviceToken;

  UserPayload({
    this.userId = '',
    this.firstName,
    this.email,
    this.profilePhoto = '',
    this.deviceName,
    this.deviceToken,
    this.deviceType,
  });

  factory UserPayload.fromJson(Map<String, dynamic> json,) {

    return UserPayload(
      userId: json['user_id'],
      firstName: json['name'],
      email: json['email'],
      profilePhoto: json['profile_picture'],
      deviceName: json['device_name'],
      deviceToken: json['device_token'],
      deviceType: json['device_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['profile_photo'] = this.profilePhoto;
    data['device_name'] = this.deviceName;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    return data;
  }


  void printData() {
    Utility.log('============== User Payload Details ==========');
    Utility.log('customer_id : ${this.userId}');
    Utility.log('first_name : ${this.firstName}');
    Utility.log('email : ${this.email}');
    Utility.log('image : ${this.profilePhoto}');
    Utility.log('============== +++++++++++++++++++ ==========');
  }

}
