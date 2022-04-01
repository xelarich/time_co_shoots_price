import 'package:json_annotation/json_annotation.dart';

part 'wedding_formula.g.dart';

@JsonSerializable()
class WeddingFormula {
  int id;
  String name;
  String? commentary;
  String? extra;
  List<WeddingEvent>? events;
  int? price;

  WeddingFormula(this.id, this.name,
      {this.commentary, this.extra, this.events, this.price});

  factory WeddingFormula.fromJson(Map<String, dynamic> json) =>
      _$WeddingFormulaFromJson(json);

  Map<String, dynamic> toJson() => _$WeddingFormulaToJson(this);
}

@JsonSerializable()
class WeddingEvent {
  int id;
  String name;
  String? description;
  String? pathIcon;

  WeddingEvent(this.id, this.name, {this.description, this.pathIcon});

  factory WeddingEvent.fromJson(Map<String, dynamic> json) =>
      _$WeddingEventFromJson(json);

  Map<String, dynamic> toJson() => _$WeddingEventToJson(this);
}
