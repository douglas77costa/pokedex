import 'package:dartz/dartz.dart';

import '../../entities/pokemon.dart';
import '../../errors/errors.dart';

abstract class GetListPokemonUseCase {
  Future<Either<Failure, List<Pokemon>>> call();
}
