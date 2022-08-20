import 'package:home_search/src/domain/entities/response_entity.dart';

class HomeSearchOutput {
  final ResponseEntity? responseEntity;
  late List<String>? errors = [];

  HomeSearchOutput.withData({
    required this.responseEntity,
  });

  HomeSearchOutput.withErrors({
    required this.errors,
    this.responseEntity,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
