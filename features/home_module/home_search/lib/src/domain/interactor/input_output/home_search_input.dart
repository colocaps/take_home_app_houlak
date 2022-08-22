class HomeSearchInput {
  final String query;
  final List<String> type;
  final String? market;
  final int? limit;
  final int? offset;
  final String token;

  HomeSearchInput({
    required this.query,
    required this.type,
    this.market,
    this.limit,
    this.offset,
    required this.token,
  });
}
