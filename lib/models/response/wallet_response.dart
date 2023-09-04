class WalletResponse {
  String? balance;

  WalletResponse({this.balance});

  WalletResponse.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
  }
}