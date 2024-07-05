import 'dart:convert';

class GetProductsByIdsParam {
  final List<int> productsIds;

  GetProductsByIdsParam({
    required this.productsIds,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['idsProducts'] = productsIds;

    return map;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
