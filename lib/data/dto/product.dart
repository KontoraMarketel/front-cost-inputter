import 'package:freezed_annotation/freezed_annotation.dart';

import 'dto.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductPhotoRs {
  final String big;
  final String square;
  final String tm;

  const ProductPhotoRs({
    required this.big,
    required this.square,
    required this.tm,
  });

  factory ProductPhotoRs.fromJson(Json json) => _$ProductPhotoRsFromJson(json);

  Json toJson() => _$ProductPhotoRsToJson(this);
}

@JsonSerializable()
class ReadProductRs {
  List<Product> cards;

  ReadProductRs({required this.cards});

  factory ReadProductRs.fromJson(Json json) => _$ReadProductRsFromJson(json);

  Json toJson() => _$ReadProductRsToJson(this);
}

@JsonSerializable()
class Product {
  final String title;
  final int nmID;
  final String vendorCode;
  final List<ProductPhotoRs>? photos;

  Product({
    required this.title,
    required this.nmID,
    required this.vendorCode,
    this.photos,
  });

  factory Product.fromJson(Json json) => _$ProductFromJson(json);

  Json toJson() => _$ProductToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ReadProductRq {
  final ProductSettings? settings;

  const ReadProductRq({this.settings});

  factory ReadProductRq.fromJson(Json json) => _$ReadProductRqFromJson(json);

  Json toJson() => _$ReadProductRqToJson(this);
}

@JsonSerializable()
class ProductSettings {
  final ProductSettingsSort? sort;
  final ProductSettingsFilter? filter;
  final ProductSettingsCursor? cursor;

  const ProductSettings({this.cursor, this.filter, this.sort});

  factory ProductSettings.fromJson(Map<String, dynamic> json) =>
      _$ProductSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSettingsToJson(this);
}

@JsonSerializable()
class ProductSettingsFilter {
  final String? textSearch;
  final bool? allowedCategory;
  final List<int>? tagIDs;
  final List<int>? objectIDs;
  final List<String>? brands;
  final int? imtID;
  final int? withPhoto;

  const ProductSettingsFilter({
    this.textSearch,
    this.allowedCategory,
    this.tagIDs,
    this.objectIDs,
    this.brands,
    this.imtID,
    this.withPhoto,
  });

  factory ProductSettingsFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductSettingsFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSettingsFilterToJson(this);
}

@JsonSerializable()
class ProductSettingsCursor {
  final DateTime? updatedAt;
  final int? nmID;
  final int? limit;

  const ProductSettingsCursor({this.limit, this.nmID, this.updatedAt});

  factory ProductSettingsCursor.fromJson(Map<String, dynamic> json) =>
      _$ProductSettingsCursorFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSettingsCursorToJson(this);
}

@JsonSerializable()
class ProductSettingsSort {
  final bool? ascending;

  const ProductSettingsSort({this.ascending});

  factory ProductSettingsSort.fromJson(Map<String, dynamic> json) =>
      _$ProductSettingsSortFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSettingsSortToJson(this);
}

@JsonSerializable()
class UpdateCostProductRs {
  final String productID;
  final double cost;
  final DateTime updatedAt;

  const UpdateCostProductRs({
    required this.productID,
    required this.cost,
    required this.updatedAt,
  });

  factory UpdateCostProductRs.fromJson(Map<String, dynamic> json) =>
      _$UpdateCostProductRsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCostProductRsToJson(this);
}

@JsonSerializable()
class UpdateCostProductRq {
  final String productID;
  final double cost;

  const UpdateCostProductRq({required this.productID, required this.cost});

  factory UpdateCostProductRq.fromJson(Map<String, dynamic> json) =>
      _$UpdateCostProductRqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCostProductRqToJson(this);
}
