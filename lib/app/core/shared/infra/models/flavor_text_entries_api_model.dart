import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/flavor_text_entries_api.dart';
import 'language_api_model.dart';

part 'flavor_text_entries_api_model.g.dart';

@JsonSerializable()
class FlavorTextEntriesApiModel extends FlavorTextEntriesApi {
  @JsonKey(name: 'flavor_text')
  final String? flavorText;
  final LanguageApiModel? language;

  FlavorTextEntriesApiModel({this.flavorText, this.language})
      : super(language: language, flavorText: flavorText);

  factory FlavorTextEntriesApiModel.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntriesApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextEntriesApiModelToJson(this);
}
