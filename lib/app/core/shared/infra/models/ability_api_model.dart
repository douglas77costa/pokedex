import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/ability_api.dart';

part 'ability_api_model.g.dart';

@JsonSerializable()
class AbilityApiModel extends AbilityApi{

  AbilityApiModel():super();

  factory AbilityApiModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityApiModelToJson(this);
}
