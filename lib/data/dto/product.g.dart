// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPhotoRs _$ProductPhotoRsFromJson(Map<String, dynamic> json) =>
    ProductPhotoRs(
      big: json['big'] as String,
      square: json['square'] as String,
      tm: json['tm'] as String,
    );

Map<String, dynamic> _$ProductPhotoRsToJson(ProductPhotoRs instance) =>
    <String, dynamic>{
      'big': instance.big,
      'square': instance.square,
      'tm': instance.tm,
    };

ReadProductRs _$ReadProductRsFromJson(Map<String, dynamic> json) =>
    ReadProductRs(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReadProductRsToJson(ReadProductRs instance) =>
    <String, dynamic>{'cards': instance.cards};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  title: json['title'] as String,
  nmID: (json['nmID'] as num).toInt(),
  vendorCode: json['vendorCode'] as String,
  photos: (json['photos'] as List<dynamic>?)
      ?.map((e) => ProductPhotoRs.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'title': instance.title,
  'nmID': instance.nmID,
  'vendorCode': instance.vendorCode,
  'photos': instance.photos,
};

ReadProductRq _$ReadProductRqFromJson(Map<String, dynamic> json) =>
    ReadProductRq(
      settings: json['settings'] == null
          ? null
          : ProductSettings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReadProductRqToJson(ReadProductRq instance) =>
    <String, dynamic>{
      if (instance.settings case final value?) 'settings': value,
    };

ProductSettings _$ProductSettingsFromJson(
  Map<String, dynamic> json,
) => ProductSettings(
  cursor: json['cursor'] == null
      ? null
      : ProductSettingsCursor.fromJson(json['cursor'] as Map<String, dynamic>),
  filter: json['filter'] == null
      ? null
      : ProductSettingsFilter.fromJson(json['filter'] as Map<String, dynamic>),
  sort: json['sort'] == null
      ? null
      : ProductSettingsSort.fromJson(json['sort'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductSettingsToJson(ProductSettings instance) =>
    <String, dynamic>{
      'sort': instance.sort,
      'filter': instance.filter,
      'cursor': instance.cursor,
    };

ProductSettingsFilter _$ProductSettingsFilterFromJson(
  Map<String, dynamic> json,
) => ProductSettingsFilter(
  textSearch: json['textSearch'] as String?,
  allowedCategory: json['allowedCategory'] as bool?,
  tagIDs: (json['tagIDs'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  objectIDs: (json['objectIDs'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  brands: (json['brands'] as List<dynamic>?)?.map((e) => e as String).toList(),
  imtID: (json['imtID'] as num?)?.toInt(),
  withPhoto: (json['withPhoto'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductSettingsFilterToJson(
  ProductSettingsFilter instance,
) => <String, dynamic>{
  'textSearch': instance.textSearch,
  'allowedCategory': instance.allowedCategory,
  'tagIDs': instance.tagIDs,
  'objectIDs': instance.objectIDs,
  'brands': instance.brands,
  'imtID': instance.imtID,
  'withPhoto': instance.withPhoto,
};

ProductSettingsCursor _$ProductSettingsCursorFromJson(
  Map<String, dynamic> json,
) => ProductSettingsCursor(
  limit: (json['limit'] as num?)?.toInt(),
  nmID: (json['nmID'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ProductSettingsCursorToJson(
  ProductSettingsCursor instance,
) => <String, dynamic>{
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'nmID': instance.nmID,
  'limit': instance.limit,
};

ProductSettingsSort _$ProductSettingsSortFromJson(Map<String, dynamic> json) =>
    ProductSettingsSort(ascending: json['ascending'] as bool?);

Map<String, dynamic> _$ProductSettingsSortToJson(
  ProductSettingsSort instance,
) => <String, dynamic>{'ascending': instance.ascending};

UpdateCostProductRs _$UpdateCostProductRsFromJson(Map<String, dynamic> json) =>
    UpdateCostProductRs(
      productID: json['productID'] as String,
      cost: (json['cost'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UpdateCostProductRsToJson(
  UpdateCostProductRs instance,
) => <String, dynamic>{
  'productID': instance.productID,
  'cost': instance.cost,
  'updatedAt': instance.updatedAt.toIso8601String(),
};

UpdateCostProductRq _$UpdateCostProductRqFromJson(Map<String, dynamic> json) =>
    UpdateCostProductRq(
      productID: json['productID'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$UpdateCostProductRqToJson(
  UpdateCostProductRq instance,
) => <String, dynamic>{'productID': instance.productID, 'cost': instance.cost};
