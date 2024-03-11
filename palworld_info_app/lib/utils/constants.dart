import 'package:flutter/material.dart';

class Constants {
  // static const String host = 'localhost';
  static const String host = '34.83.60.36';
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
enum ItemType {
  weapon('Weapon'),
  specialWeapon('Special Weapon'),
  armor('Armor'),
  accessory('Accessory'),
  material('Material'),
  consume('Consume'),
  ammo('Ammo'),
  food('Food'),
  essential('Essential'),
  glider('Glider'),
  monsterEquipWeapon('Monster Equip Weapon'),
  blueprint('Blueprint');

  const ItemType(this.title);
  final String title;
}

enum StructureType {
  product('Product'),
  pal('Pal'),
  food('Food'),
  infrastructure('Infrastructure'),
  light('Light'),
  foundation('Foundation'),
  defense('Defense'),
  other('Other'),
  furniture('Furniture'),
  dismantle('Dismantle');

  const StructureType(this.title);
  final String title;
}