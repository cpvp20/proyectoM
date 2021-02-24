import 'package:equatable/equatable.dart';

import 'book.dart';

class BookCase extends Equatable {
  final int totalItems;
  final List<Book> items;

  const BookCase({
    this.totalItems,
    this.items,
  });

  @override
  String toString() {
    return 'BookCase(totalItems: $totalItems, items: $items)';
  }

  factory BookCase.fromJson(Map<String, dynamic> json) {
    print(json['docs'].runtimeType);
    return BookCase(
      totalItems: json['numFound'] as int,
      items: (json['docs'] as List<dynamic>)?.map((e) {
        print("element\n");
        print(e);
        return e == null ? null : Book.fromJson(e as Map<String, dynamic>);
      })?.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [totalItems, items];
}
