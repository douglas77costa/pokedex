import 'package:dartz/dartz.dart';

import '../../entities/flavor_text_entries_api.dart';
import '../../entities/pokemon_api.dart';
import '../../entities/pokemon_item.dart';
import '../../errors/errors.dart';

abstract class PokemonApiRepository {
  Future<Either<Failure, List<PokemonItem>?>> getAllPokemonList();

  Future<Either<Failure, PokemonApi?>> getPokemonById(int id);

  Future<Either<Failure, List<FlavorTextEntriesApi>?>> getPokemonTextById(int id);
}
