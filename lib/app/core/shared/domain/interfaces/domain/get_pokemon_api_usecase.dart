import 'package:dartz/dartz.dart';

import '../../entities/pokemon.dart';
import '../../errors/errors.dart';

abstract class GetPokemonApiUseCase{
  Future<Either<Failure, Pokemon?>> call(int id);
}