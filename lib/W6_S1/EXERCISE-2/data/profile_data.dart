import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';
class ProfileData {
  final String name;
  final String position;
  final String avataUrl;
  final List<TileData> titles;

  ProfileData({
    required this.name,
    required this.position,
    required this.avataUrl,
    required this.titles,
  });
}

final  ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avataUrl: 'assets/images/ann.png',
    titles: [
      TileData( icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ]);
