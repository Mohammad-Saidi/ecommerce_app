/// data : {"id":6,"merchant_id":"1","owner_name":"Dr. Rose Stracke","company_name":"Abshire, Bins and Veum","page_name":"Vision-oriented motivating openarchitecture","business_type_id":0,"email":"ritchie.marilie@example.net","address":"674 Dare Plains South Jazmyne, AR 28271","phone_no":"(314) 257-7081","created_at":"2024-06-21T04:46:25.000000Z","updated_at":"2024-06-21T04:46:25.000000Z"}
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTAzLjIwOS40MC4xMzA6ODA5MC9hcGkvbWVyY2hhbnQvbG9naW4iLCJpYXQiOjE3MTkxNTM4MjksImV4cCI6MTcxOTE1NzQyOSwibmJmIjoxNzE5MTUzODI5LCJqdGkiOiJGTTA2Ulg5NnR1MDZ3MnJFIiwic3ViIjoiNiIsInBydiI6IjkzYmRjYzU4ZGQwMWNlMzZlYzU2ZTMyYjViYjU4MGQ4MzAzMmZkMTgifQ.B_uAm3ivm8EdwoJ5pofhUMenkvZODTf0KPTlpox4BIk"

class LoginModel {
  LoginModel({
      Data? data, 
      String? token,}){
    _data = data;
    _token = token;
}

  LoginModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _token = json['token'];
  }
  Data? _data;
  String? _token;
LoginModel copyWith({  Data? data,
  String? token,
}) => LoginModel(  data: data ?? _data,
  token: token ?? _token,
);
  Data? get data => _data;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// id : 6
/// merchant_id : "1"
/// owner_name : "Dr. Rose Stracke"
/// company_name : "Abshire, Bins and Veum"
/// page_name : "Vision-oriented motivating openarchitecture"
/// business_type_id : 0
/// email : "ritchie.marilie@example.net"
/// address : "674 Dare Plains South Jazmyne, AR 28271"
/// phone_no : "(314) 257-7081"
/// created_at : "2024-06-21T04:46:25.000000Z"
/// updated_at : "2024-06-21T04:46:25.000000Z"

class Data {
  Data({
      num? id, 
      String? merchantId, 
      String? ownerName, 
      String? companyName, 
      String? pageName, 
      num? businessTypeId, 
      String? email, 
      String? address, 
      String? phoneNo, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _merchantId = merchantId;
    _ownerName = ownerName;
    _companyName = companyName;
    _pageName = pageName;
    _businessTypeId = businessTypeId;
    _email = email;
    _address = address;
    _phoneNo = phoneNo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = json['merchant_id'];
    _ownerName = json['owner_name'];
    _companyName = json['company_name'];
    _pageName = json['page_name'];
    _businessTypeId = json['business_type_id'];
    _email = json['email'];
    _address = json['address'];
    _phoneNo = json['phone_no'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _merchantId;
  String? _ownerName;
  String? _companyName;
  String? _pageName;
  num? _businessTypeId;
  String? _email;
  String? _address;
  String? _phoneNo;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? merchantId,
  String? ownerName,
  String? companyName,
  String? pageName,
  num? businessTypeId,
  String? email,
  String? address,
  String? phoneNo,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  merchantId: merchantId ?? _merchantId,
  ownerName: ownerName ?? _ownerName,
  companyName: companyName ?? _companyName,
  pageName: pageName ?? _pageName,
  businessTypeId: businessTypeId ?? _businessTypeId,
  email: email ?? _email,
  address: address ?? _address,
  phoneNo: phoneNo ?? _phoneNo,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get merchantId => _merchantId;
  String? get ownerName => _ownerName;
  String? get companyName => _companyName;
  String? get pageName => _pageName;
  num? get businessTypeId => _businessTypeId;
  String? get email => _email;
  String? get address => _address;
  String? get phoneNo => _phoneNo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
    map['owner_name'] = _ownerName;
    map['company_name'] = _companyName;
    map['page_name'] = _pageName;
    map['business_type_id'] = _businessTypeId;
    map['email'] = _email;
    map['address'] = _address;
    map['phone_no'] = _phoneNo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}