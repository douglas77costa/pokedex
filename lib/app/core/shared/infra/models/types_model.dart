import 'package:pokedex/app/core/shared/domain/entities/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'types_model.g.dart';

@JsonSerializable()
class TypesModel extends Types{
  TypesModel(): super();

  factory TypesModel.fromJson(Map<String, dynamic> json) =>
      _$TypesModelFromJson(json);
  Map<String, dynamic> toJson() => _$TypesModelToJson(this);
}