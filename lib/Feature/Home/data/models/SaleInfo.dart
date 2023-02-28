import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  SaleInfo.fromJson(dynamic json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
  }

  String? country;
  String? saleability;
  bool? isEbook;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['saleability'] = saleability;
    map['isEbook'] = isEbook;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [country, saleability, isEbook];
}
