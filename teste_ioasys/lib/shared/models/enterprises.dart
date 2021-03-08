import 'dart:convert';

import 'enterprise_type.dart';

class Company {
  int id;
  String enterpriseName;
  String description;
  String emailEnterprise;
  String facebook;
  String twitter;
  String linkedin;
  String phone;
  bool ownEnterprise;
  String photo;
  int value;
  int shares;
  double sharePrice;
  int ownShares;
  String city;
  String country;
  EnterPriseType enterPriseType;
  Company({
    this.id,
    this.enterpriseName,
    this.description,
    this.emailEnterprise,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.phone,
    this.ownEnterprise,
    this.photo,
    this.value,
    this.shares,
    this.sharePrice,
    this.ownShares,
    this.city,
    this.country,
    this.enterPriseType,
  });

  Company copyWith({
    int id,
    String enterpriseName,
    String description,
    String emailEnterprise,
    String facebook,
    String twitter,
    String linkedin,
    String phone,
    bool ownEnterprise,
    String photo,
    int value,
    int shares,
    double sharePrice,
    int ownShares,
    String city,
    String country,
    EnterPriseType enterPriseType,
  }) {
    return Company(
      id: id ?? this.id,
      enterpriseName: enterpriseName ?? this.enterpriseName,
      description: description ?? this.description,
      emailEnterprise: emailEnterprise ?? this.emailEnterprise,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      linkedin: linkedin ?? this.linkedin,
      phone: phone ?? this.phone,
      ownEnterprise: ownEnterprise ?? this.ownEnterprise,
      photo: photo ?? this.photo,
      value: value ?? this.value,
      shares: shares ?? this.shares,
      sharePrice: sharePrice ?? this.sharePrice,
      ownShares: ownShares ?? this.ownShares,
      city: city ?? this.city,
      country: country ?? this.country,
      enterPriseType: enterPriseType ?? this.enterPriseType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'enterprise_name': enterpriseName,
      'description': description,
      'email_enterprise': emailEnterprise,
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
      'phone': phone,
      'own_enterprise': ownEnterprise,
      'photo': photo,
      'value': value,
      'shares': shares,
      'share_price': sharePrice,
      'own_shares': ownShares,
      'city': city,
      'country': country,
      'enterprise_type': enterPriseType?.toMap(),
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Company(
      id: map['id'],
      enterpriseName: map['enterprise_name'],
      description: map['description'],
      emailEnterprise: map['email_enterprise'],
      facebook: map['facebook'],
      twitter: map['twitter'],
      linkedin: map['linkedin'],
      phone: map['phone'],
      ownEnterprise: map['own_enterprise'],
      photo: map['photo'],
      value: map['value'],
      shares: map['shares'],
      sharePrice: map['share_price'],
      ownShares: map['own_shares'],
      city: map['city'],
      country: map['country'],
      enterPriseType: EnterPriseType.fromMap(map['enterprise_type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Enterprise(id: $id, enterpriseName: $enterpriseName, description: $description, emailEnterprise: $emailEnterprise, facebook: $facebook, twitter: $twitter, linkedin: $linkedin, phone: $phone, ownEnterprise: $ownEnterprise, photo: $photo, value: $value, shares: $shares, sharePrice: $sharePrice, ownShares: $ownShares, city: $city, country: $country, enterPriseType: $enterPriseType)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Company &&
        o.id == id &&
        o.enterpriseName == enterpriseName &&
        o.description == description &&
        o.emailEnterprise == emailEnterprise &&
        o.facebook == facebook &&
        o.twitter == twitter &&
        o.linkedin == linkedin &&
        o.phone == phone &&
        o.ownEnterprise == ownEnterprise &&
        o.photo == photo &&
        o.value == value &&
        o.shares == shares &&
        o.sharePrice == sharePrice &&
        o.ownShares == ownShares &&
        o.city == city &&
        o.country == country &&
        o.enterPriseType == enterPriseType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        enterpriseName.hashCode ^
        description.hashCode ^
        emailEnterprise.hashCode ^
        facebook.hashCode ^
        twitter.hashCode ^
        linkedin.hashCode ^
        phone.hashCode ^
        ownEnterprise.hashCode ^
        photo.hashCode ^
        value.hashCode ^
        shares.hashCode ^
        sharePrice.hashCode ^
        ownShares.hashCode ^
        city.hashCode ^
        country.hashCode ^
        enterPriseType.hashCode;
  }
}
