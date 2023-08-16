
class UserDTO {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UserDTO({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDTO &&
        other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.website == website &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    username.hashCode ^
    email.hashCode ^
    address.hashCode ^
    phone.hashCode ^
    website.hashCode ^
    company.hashCode;
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.street == street &&
        other.suite == suite &&
        other.city == city &&
        other.zipcode == zipcode &&
        other.geo == geo;
  }

  @override
  int get hashCode {
    return street.hashCode ^
    suite.hashCode ^
    city.hashCode ^
    zipcode.hashCode ^
    geo.hashCode;
  }
}

class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Geo &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode {
    return lat.hashCode ^
    lng.hashCode;
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Company &&
        other.name == name &&
        other.catchPhrase == catchPhrase &&
        other.bs == bs;
  }

  @override
  int get hashCode {
    return name.hashCode ^
    catchPhrase.hashCode ^
    bs.hashCode;
  }
}
