import 'item_entity.dart';

class ResultsEntity {
  final String href;
  final int limit;
  final String next;
  final int offset;
  final String previous;
  final int total;
  final List<ItemEntity>? itemEntity;

  ResultsEntity({
    required this.href,
    this.itemEntity,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });
}
