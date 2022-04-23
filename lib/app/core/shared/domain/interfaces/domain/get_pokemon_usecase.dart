import 'package:dartz/dartz.dart';

import '../../entities/pokemon.dart';
import '../../errors/errors.dart';

abstract class GetPokemonUseCase{
  Future<Either<Failure, Pokemon?>> call(int id);
}