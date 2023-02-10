import 'dart:convert';
/// status : true
/// message : "My Prescriptions"
/// data : [{"prescription_id":1,"images":[{"id":1,"image":"https://fluxstore.spinnertechltd.com/images/prescriptions/167371679075.jpg"}],"created_at":"2023-01-14 05:19pm"}]

MyPrescriptionResp myPrescriptionRespFromJson(String str) => MyPrescriptionResp.fromJson(json.decode(str));
String myPrescriptionRespToJson(MyPrescriptionResp data) => json.encode(data.toJson());
class MyPrescriptionResp {
  MyPrescriptionResp({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  MyPrescriptionResp.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
MyPrescriptionResp copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => MyPrescriptionResp(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// prescription_id : 1
/// images : [{"id":1,"image":"https://fluxstore.spinnertechltd.com/images/prescriptions/167371679075.jpg"}]
/// created_at : "2023-01-14 05:19pm"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? prescriptionId, 
      List<Images>? images, 
      String? createdAt,}){
    _prescriptionId = prescriptionId;
    _images = images;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _prescriptionId = json['prescription_id'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
  }
  num? _prescriptionId;
  List<Images>? _images;
  String? _createdAt;
Data copyWith({  num? prescriptionId,
  List<Images>? images,
  String? createdAt,
}) => Data(  prescriptionId: prescriptionId ?? _prescriptionId,
  images: images ?? _images,
  createdAt: createdAt ?? _createdAt,
);
  num? get prescriptionId => _prescriptionId;
  List<Images>? get images => _images;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prescription_id'] = _prescriptionId;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    return map;
  }

}

/// id : 1
/// image : "https://fluxstore.spinnertechltd.com/images/prescriptions/167371679075.jpg"

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));
String imagesToJson(Images data) => json.encode(data.toJson());
class Images {
  Images({
      num? id, 
      String? image,}){
    _id = id;
    _image = image;
}

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
  }
  num? _id;
  String? _image;
Images copyWith({  num? id,
  String? image,
}) => Images(  id: id ?? _id,
  image: image ?? _image,
);
  num? get id => _id;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    return map;
  }

}