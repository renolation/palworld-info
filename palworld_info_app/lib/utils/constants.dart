class Constants {
  static const String host = 'localhost';
  // static const String host = '192.168.1.144';
  //
  static const String scheme = 'http';
  // static const String scheme = 'https';
  //
  static const int port = 3000;
// static const int? port = null;
}

enum Size {
  L,
  M,
  S,
  XL,
  XS
}
enum SortBy {
  Name,
  Size,
  Rarity,
  Hp,
  Melee_Attack,
  Magic_Attack,
  Defense,
  Ride_Sprint_Speed,
}
enum SortType {
  Asc,
  Desc
}