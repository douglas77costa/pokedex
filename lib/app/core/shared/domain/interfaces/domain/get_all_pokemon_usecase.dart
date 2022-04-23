import 'package:dartz/dartz.dart';
import 'package:pokedex/app/core/shared/domain/entities/id_index.dart';

import '../../errors/errors.dart';

abstract class GetIdsAllPokemonUseCase {
  Future<Either<Failure, List<IdIndex>>> call();
}
