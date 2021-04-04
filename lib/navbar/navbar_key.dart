import 'package:flutter/cupertino.dart';

class NavbarKey{
  NavbarKey._();

  static final GlobalKey _key= GlobalKey();

  static GlobalKey getkey()=> _key;
}