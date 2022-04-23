import 'package:dartz/dartz.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';

import '../../errors/errors.dart';

abstract class SavePokemonUseCase{
  Future<Either<Failure, bool>> call(List<Pokemon> list);
}