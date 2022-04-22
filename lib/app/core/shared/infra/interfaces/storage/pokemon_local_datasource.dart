import 'package:pokedex/app/core/shared/infra/models/pokemon_model.dart';

abstract class PokemonLocalDataSource{
  Future<PokemonModel> getAllPokemon();
}