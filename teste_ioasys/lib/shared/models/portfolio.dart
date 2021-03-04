class Portfolio {
  int enterprisesNumber;
  List<String> enterprises;

  Portfolio({this.enterprisesNumber, this.enterprises});

  Portfolio.fromJson(Map<String, dynamic> json) {
    enterprisesNumber = json['enterprises_number'];
    if (json['enterprises'] != null) {
      enterprises = new List<String>();
      json['enterprises'].forEach((v) {
        enterprises.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enterprises_number'] = this.enterprisesNumber;
    if (this.enterprises != null) {
      data['enterprises'] = this.enterprises.map((v) => v).toList();
    }
    return data;
  }
}
