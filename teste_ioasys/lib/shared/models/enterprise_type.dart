import 'dart:convert';

class EnterPriseType {
  int id;
  String enterpriseTypeName;
  EnterPriseType({
    this.id,
    this.enterpriseTypeName,
  });

  EnterPriseType copyWith({
    int id,
    String enterpriseTypeName,
  }) {
    return EnterPriseType(
      id: id ?? this.id,
      enterpriseTypeName: enterpriseTypeName ?? this.enterpriseTypeName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'enterpriseTypeName': enterpriseTypeName,
    };
  }

  factory EnterPriseType.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EnterPriseType(
      id: map['id'],
      enterpriseTypeName: map['enterpriseTypeName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EnterPriseType.fromJson(String source) =>
      EnterPriseType.fromMap(json.decode(source));

  @override
  String toString() =>
      'EnterPriseType(id: $id, enterpriseTypeName: $enterpriseTypeName)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EnterPriseType &&
        o.id == id &&
        o.enterpriseTypeName == enterpriseTypeName;
  }

  @override
  int get hashCode => id.hashCode ^ enterpriseTypeName.hashCode;
}
