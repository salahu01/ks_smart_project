class DetailsModel {
  Address? address;
  String? website;
  Company? company;

  DetailsModel({this.address, this.website, this.company});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    website = json['website'];
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}
