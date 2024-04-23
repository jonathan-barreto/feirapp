import 'package:equatable/equatable.dart';

class PageLinkEntity extends Equatable {
  final String first;
  final String? next;

  const PageLinkEntity({
    required this.first,
    required this.next,
  });

  @override
  List<Object?> get props {
    return [
      first,
      next,
    ];
  }
}
