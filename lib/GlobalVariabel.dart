import 'package:flutter/foundation.dart'; 
class GlobalData {
  static double money = 1000000.0;
}

class Historys {
  List<String> nama = ["Kelvyn", "Seven", "Nathaniel"];
  List<String> money = ["+ Rp 69.277", "- Rp 77.989", "+ 46.233"];
  List<String> date = [
    "28 September 2023, 13:32",
    "29 September 2023, 13:31",
    "30 September 2023, 11:31"
  ];

  void addHistory(String newNama, String newMoney, String newDate) {
    nama.add(newNama);
    money.add(newMoney);
    date.add(newDate);
  }
}

class Balance {
  int balance = 0;

  void addMoney(int balance) {
    this.balance += balance;
  }

  void deductMoney(int balance) {
    this.balance -= balance;
  }
}


class Coin {
  final ValueNotifier<double> jumlah;
  final double harga;
  final String symbol;

  Coin({required this.jumlah, required this.harga, required this.symbol});
}

class GlobalVariables {
  static final Coin bitcoin = Coin(
    symbol: 'BTC',
    harga: 29850.0,
    jumlah: ValueNotifier<double>(0),
  );

  static final Coin ethereum = Coin(
    symbol: 'ETH',
    harga: 10560.0,
    jumlah: ValueNotifier<double>(0),
  );

  static final Coin litecoin = Coin(
    symbol: 'LTC',
    harga: 3676.0,
    jumlah: ValueNotifier<double>(0),
  );

  static final Coin ripple = Coin(
    symbol: 'XRP',
    harga: 5240.0,
    jumlah: ValueNotifier<double>(0),
  );
}

