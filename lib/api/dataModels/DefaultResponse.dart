class DefaultResponse {
  bool? _success;
  dynamic _data;
  String? _message;

  DefaultResponse({bool? success, dynamic? data, String? message}) {
    if (success != null) {
      _success = success;
    }
    if (data != null) {
      _data = data;
    }
    if (message != null) {
      _message = message;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
   dynamic? get data => _data;
  set data(dynamic? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  DefaultResponse.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? (json['data']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final dynamic data = dynamic;
    data['success'] = this._success;
    if (this._data != null) {
      data['data'] = this._data!;
    }
    data['message'] = this._message;
    return data;
  }
}