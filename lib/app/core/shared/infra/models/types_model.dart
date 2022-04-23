import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/app/core/shared/domain/entities/types.dart';

part 'types_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class TypesModel extends Types {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? color;

  TypesModel({this.id, this.type, this.color}) : super(id: id, type: type, color: color);

  factory TypesModel.fromJson(Map<String, dynamic> json) => _$TypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypesModelToJson(this);

  static List<TypesModel>? toListModel(List<Types>? list) {
    List<TypesModel> listEntity = [];
    list?.forEach((element) {
      listEntity
          .add(TypesModel(id: element.id, type: element.type, color: element.color));
    });
    return listEntity;
  }
}
