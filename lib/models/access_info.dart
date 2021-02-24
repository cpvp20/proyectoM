import 'package:equatable/equatable.dart';

class AccessInfo extends Equatable {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final String webReaderLink;
  final String accessViewStatus;
  final bool quoteSharingAllowed;

  const AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  @override
  String toString() {
    return 'AccessInfo(country: $country, viewability: $viewability, embeddable: $embeddable, publicDomain: $publicDomain, textToSpeechPermission: $textToSpeechPermission, ebReaderLink: $webReaderLink, accessViewStatus: $accessViewStatus, quoteSharingAllowed: $quoteSharingAllowed)';
  }

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(
      country: json['country'] as String,
      viewability: json['viewability'] as String,
      embeddable: json['embeddable'] as bool,
      publicDomain: json['publicDomain'] as bool,
      textToSpeechPermission: json['textToSpeechPermission'] as String,
      accessViewStatus: json['accessViewStatus'] as String,
      quoteSharingAllowed: json['quoteSharingAllowed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'viewability': viewability,
      'embeddable': embeddable,
      'publicDomain': publicDomain,
      'textToSpeechPermission': textToSpeechPermission,
      'webReaderLink': webReaderLink,
      'accessViewStatus': accessViewStatus,
      'quoteSharingAllowed': quoteSharingAllowed,
    };
  }

  AccessInfo copyWith({
    String country,
    String viewability,
    bool embeddable,
    bool publicDomain,
    String textToSpeechPermission,
    String webReaderLink,
    String accessViewStatus,
    bool quoteSharingAllowed,
  }) {
    return AccessInfo(
      country: country ?? this.country,
      viewability: viewability ?? this.viewability,
      embeddable: embeddable ?? this.embeddable,
      publicDomain: publicDomain ?? this.publicDomain,
      textToSpeechPermission:
          textToSpeechPermission ?? this.textToSpeechPermission,
      webReaderLink: webReaderLink ?? this.webReaderLink,
      accessViewStatus: accessViewStatus ?? this.accessViewStatus,
      quoteSharingAllowed: quoteSharingAllowed ?? this.quoteSharingAllowed,
    );
  }

  @override
  List<Object> get props {
    return [
      country,
      viewability,
      embeddable,
      publicDomain,
      textToSpeechPermission,
      webReaderLink,
      accessViewStatus,
      quoteSharingAllowed,
    ];
  }
}
