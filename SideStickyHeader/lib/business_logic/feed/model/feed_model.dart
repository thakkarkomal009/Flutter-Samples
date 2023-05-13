import 'package:intl/intl.dart';

class FeedModel {
  final int? id;
  final String? title;
  final String? date;
  final String? image;

  FeedModel(this.id, this.title, this.date, this.image);

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
        json['id'] ?? "",
        json['title'] ?? '',
        DateFormat('dd MMM', 'en_US')
            .format(DateTime.parse("${json['date']}Z").toLocal())
            .toString(),
        json['image'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['image'] = image;
    return data;
  }
}
