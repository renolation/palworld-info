import 'package:flutter/material.dart';

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

const kOddBackground = Colors.white10;
const kEvenBackground = Colors.white30;

enum Size {
  L,
  M,
  S,
  XL,
  XS
}
enum SortBy {
  name('Name'),
  size('Size'),
  rarity('Rarity'),
  hp('HP'),
  meleeAttack('Melee Attack'),
  magicAttack('Magic Attack'),
  defense('Defense'),
  rideSprintSpeed('Ride Sprint Speed');

  const SortBy(this.title);
  final String title;
}
enum SortType {
  Asc,
  Desc
}