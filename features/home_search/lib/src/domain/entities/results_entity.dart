class ResultsEntity {
  final String href;
  final int limit;
  final String next;
  final int offset;
  final String previous;
  final int total;

  ResultsEntity({
    required this.href,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });
}
