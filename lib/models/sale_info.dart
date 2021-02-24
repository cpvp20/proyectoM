import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
	final String country;
	final String saleability;
	final bool isEbook;

	const SaleInfo({
		this.country,
		this.saleability,
		this.isEbook,
	});

	@override
	String toString() {
		return 'SaleInfo(country: $country, saleability: $saleability, isEbook: $isEbook)';
	}

	factory SaleInfo.fromJson(Map<String, dynamic> json) {
		return SaleInfo(
			country: json['country'] as String,
			saleability: json['saleability'] as String,
			isEbook: json['isEbook'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'country': country,
			'saleability': saleability,
			'isEbook': isEbook,
		};
	}

	SaleInfo copyWith({
		String country,
		String saleability,
		bool isEbook,
	}) {
		return SaleInfo(
			country: country ?? this.country,
			saleability: saleability ?? this.saleability,
			isEbook: isEbook ?? this.isEbook,
		);
	}

	@override
	List<Object> get props => [country, saleability, isEbook];
}
