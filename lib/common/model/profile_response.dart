
import 'package:basic_template/common/model/common_response.dart';
import 'package:basic_template/common/model/user_payload.dart';

class ProfileResponse extends CommonResponse {
  UserPayload? payload;

  ProfileResponse({error, this.payload, status});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    error = (json['error'] != null ? Error.fromJson(json['error']) : null);
    payload = json['payload'] != null
        ? new UserPayload.fromJson(json['payload'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
