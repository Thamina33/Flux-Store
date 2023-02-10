import 'dart:convert';
/// status : true
/// message : "Prescription image deleted"

DeletePrescriptionResp deletePrescriptionRespFromJson(String str) => DeletePrescriptionResp.fromJson(json.decode(str));
String deletePrescriptionRespToJson(DeletePrescriptionResp data) => json.encode(data.toJson());
class DeletePrescriptionResp {
  DeletePrescriptionResp({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  DeletePrescriptionResp.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  bool? _status;
  String? _message;
DeletePrescriptionResp copyWith({  bool? status,
  String? message,
}) => DeletePrescriptionResp(  status: status ?? _status,
  message: message ?? _message,
);
  bool? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}