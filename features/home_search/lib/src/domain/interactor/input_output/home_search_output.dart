import 'package:home_search/src/domain/entities/artist_entity.dart';

class HomeSearchOutput {
  final ArtistEntity? artistEntity;
  late List<String>? errors = [];

  HomeSearchOutput.withData({
    required this.artistEntity,
  });

  HomeSearchOutput.withErrors({
    required this.errors,
    this.artistEntity,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
