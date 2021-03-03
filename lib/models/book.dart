import 'package:equatable/equatable.dart';

import "sale_info.dart";
import "volume_info.dart";

class Book extends Equatable {
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;

  const Book({
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
  });

  @override
  String toString() {
    return 'Book(id: $id, etag: $etag, selfLink: $selfLink, volumeInfo: $volumeInfo, saleInfo: $saleInfo)';
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      etag: json['etag'] as String,
      selfLink: json['selfLink'] as String,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfo: json['saleInfo'] == null
          ? null
          : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'etag': etag,
      'selfLink': selfLink,
      'volumeInfo': volumeInfo?.toJson(),
      'saleInfo': saleInfo?.toJson(),
    };
  }

  Book copyWith({
    String kind,
    String id,
    String etag,
    String selfLink,
    VolumeInfo volumeInfo,
    SaleInfo saleInfo,
  }) {
    return Book(
      id: id ?? this.id,
      etag: etag ?? this.etag,
      selfLink: selfLink ?? this.selfLink,
      volumeInfo: volumeInfo ?? this.volumeInfo,
      saleInfo: saleInfo ?? this.saleInfo,
    );
  }

  List<Object> get props {
    return [
      id,
      etag,
      selfLink,
      volumeInfo,
      saleInfo,
    ];
  }
}
