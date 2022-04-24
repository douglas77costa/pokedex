import 'package:dartz/dartz.dart';
import 'package:pokedex/app/core/shared/domain/entities/id_index.dart';

import '../../errors/errors.dart';

abstract class GetIdsAllPokemonApiUseCase {
  Future<Either<Failure, List<IdIndex>>> call();
}
