import 'package:json_annotation/json_annotation.dart';

import '../../domain/enitities/language_api.dart';

part 'language_api_model.g.dart';

@JsonSerializable()
class LanguageApiModel extends LanguageApi {
  LanguageApiModel():super();

  factory LanguageApiModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageApiModelToJson(this);
}