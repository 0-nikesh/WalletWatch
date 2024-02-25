class Transaction {
  String? userId;
  String? category;
  double? cost;
  String? type;
  String? remarks;
  DateTime? dateTime;
  String? imageUrl;

  Transaction({
    this.userId,
    this.category,
    this.cost,
    this.type,
    this.remarks,
    this.dateTime,
    this.imageUrl,
  });
}
