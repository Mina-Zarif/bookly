import 'package:equatable/equatable.dart';

class SearchInfo extends Equatable {
  SearchInfo({
    this.textSnippet,
  });

  SearchInfo.fromJson(dynamic json) {
    textSnippet = json['textSnippet'];
  }

  String? textSnippet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textSnippet'] = textSnippet;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [textSnippet];
}
