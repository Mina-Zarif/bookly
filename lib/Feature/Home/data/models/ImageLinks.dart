import 'package:equatable/equatable.dart';

class ImageLinks extends Equatable {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  ImageLinks.fromJson(dynamic json) {
    smallThumbnail = json['smallThumbnail'] ?? 'error';
    thumbnail = json['thumbnail'] ?? 'error';
  }

  String? smallThumbnail;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['smallThumbnail'] = smallThumbnail;
    map['thumbnail'] = thumbnail;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [smallThumbnail, thumbnail];
}
