import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';

abstract class CheckPokemonStorageUseCase{
  Future<Either<Failure,bool>?> call();
}