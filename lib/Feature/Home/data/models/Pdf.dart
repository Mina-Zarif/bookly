import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
  Pdf({this.isAvailable, this.acsTokenLink});

  Pdf.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'] ?? '';
  }

  bool? isAvailable;
  String? acsTokenLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    map['acsTokenLink'] = acsTokenLink;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isAvailable, acsTokenLink];
}
