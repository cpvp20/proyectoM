import 'package:equatable/equatable.dart';

import "image_links.dart";

class VolumeInfo extends Equatable {
  final String title;
  final List<String> authors;
  final String publishedDate;

  final String printType;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;
  final List<String> categories;
  final String description;
  final int pageCount;

  const VolumeInfo({
    this.pageCount,
    this.description,
    this.categories,
    this.title,
    this.authors,
    this.publishedDate,
    this.printType,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  @override
  String toString() {
    return 'VolumeInfo(title: $title, authors: $authors, publishedDate: $publishedDate, printType: $printType, maturityRating: $maturityRating, allowAnonLogging: $allowAnonLogging, contentVersion: $contentVersion, imageLinks: $imageLinks, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink)';
  }

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      pageCount: json["pageCount"] as int,
      description: json["description"] as String,
      categories: (json["categories"]?.cast<String>()),
      title: json['title'] as String,
      authors: (json['authors']?.cast<String>()),
      publishedDate: json['publishedDate'] as String,
      printType: json['printType'] as String,
      maturityRating: json['maturityRating'] as String,
      allowAnonLogging: json['allowAnonLogging'] as bool,
      contentVersion: json['contentVersion'] as String,
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      language: json['language'] as String,
      previewLink: json['previewLink'] as String,
      infoLink: json['infoLink'] as String,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "pageCount": pageCount,
      "categories": categories,
      'title': title,
      'authors': authors,
      'publishedDate': publishedDate,
      'printType': printType,
      'maturityRating': maturityRating,
      'allowAnonLogging': allowAnonLogging,
      'contentVersion': contentVersion,
      'imageLinks': imageLinks?.toJson(),
      'language': language,
      'previewLink': previewLink,
      'infoLink': infoLink,
      'canonicalVolumeLink': canonicalVolumeLink,
    };
  }

  VolumeInfo copyWith({
    String title,
    List<String> authors,
    String publishedDate,
    String printType,
    String maturityRating,
    bool allowAnonLogging,
    String contentVersion,
    ImageLinks imageLinks,
    String language,
    String previewLink,
    String infoLink,
    String canonicalVolumeLink,
  }) {
    return VolumeInfo(
      title: title ?? this.title,
      authors: authors ?? this.authors,
      publishedDate: publishedDate ?? this.publishedDate,
      printType: printType ?? this.printType,
      maturityRating: maturityRating ?? this.maturityRating,
      allowAnonLogging: allowAnonLogging ?? this.allowAnonLogging,
      contentVersion: contentVersion ?? this.contentVersion,
      imageLinks: imageLinks ?? this.imageLinks,
      language: language ?? this.language,
      previewLink: previewLink ?? this.previewLink,
      infoLink: infoLink ?? this.infoLink,
      canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
    );
  }

  @override
  List<Object> get props {
    return [
      title,
      authors,
      publishedDate,
      printType,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
