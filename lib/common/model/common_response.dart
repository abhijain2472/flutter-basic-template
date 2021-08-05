/// common Api response class
class CommonResponse {
  late Error? error;

  //String status;
  //error : type 'int' is not a subtype of type 'String' error in Dart
  late num status;
}

class Error {
  String? name;
  String? message;
  int? code;

  Error({this.name, this.message, this.code});

  Error.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? null;
    message = json['message'] ?? null;
    code = json['code'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}
