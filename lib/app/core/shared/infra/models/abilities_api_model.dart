import 'package:json_annotation/json_annotation.dart';

import '../../domain/enitities/abilities_api.dart';
import 'ability_api_model.dart';

part 'abilities_api_model.g.dart';

@JsonSerializable()
class AbilitiesApiModel extends AbilitiesApi{
  final AbilityApiModel? ability;

  AbilitiesApiModel({this.ability}):super();

  factory AbilitiesApiModel.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$AbilitiesApiModelToJson(this);
}