// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wedding_formula.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeddingFormula _$WeddingFormulaFromJson(Map<String, dynamic> json) =>
    WeddingFormula(
      json['id'] as int,
      json['name'] as String,
      commentary: json['description'] as String?,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => WeddingEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as int?,
    );

Map<String, dynamic> _$WeddingFormulaToJson(WeddingFormula instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.commentary,
      'events': instance.events,
      'price': instance.price,
    };

WeddingEvent _$WeddingEventFromJson(Map<String, dynamic> json) => WeddingEvent(
      json['id'] as int,
      json['name'] as String,
      pathIcon: json['pathIcon'] as String?,
    );

Map<String, dynamic> _$WeddingEventToJson(WeddingEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pathIcon': instance.pathIcon,
    };
