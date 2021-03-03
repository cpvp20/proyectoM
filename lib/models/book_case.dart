import 'package:equatable/equatable.dart';

import 'book.dart';

class BookCase extends Equatable {
  final String kind;
  final int totalItems;
  final List<Book> items;

  const BookCase({
    this.kind,
    this.totalItems,
    this.items,
  });

  @override
  String toString() {
    return 'BookCase(kind: $kind, totalItems: $totalItems, items: $items)';
  }

  factory BookCase.fromJson(Map<String, dynamic> json) {
    return BookCase(
      kind: json['kind'] as String,
      totalItems: json['totalItems'] as int,
      items: (json['items'] as List<dynamic>)?.map((e) {
        return e == null ? null : Book.fromJson(e as Map<String, dynamic>);
      })?.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'totalItems': totalItems,
      'items': items?.map((e) => e?.toJson())?.toList(),
    };
  }

  BookCase copyWith({
    String kind,
    int totalItems,
    List<Book> items,
  }) {
    return BookCase(
      kind: kind ?? this.kind,
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [kind, totalItems, items];
}
