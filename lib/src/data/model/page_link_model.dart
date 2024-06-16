import 'package:feirapp/src/domain/entities/page_link_entity.dart';

class PageLinkModel extends PageLinkEntity {
  const PageLinkModel({
    required super.first,
    required super.next,
  });

  factory PageLinkModel.fromJson(Map<String, dynamic> json) {
    return PageLinkModel(
      first: json['first'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['first'] = first;
    data['next'] = next;

    return data;
  }
}
