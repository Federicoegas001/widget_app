import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const List<MenuItem> appMenuItems = [
  MenuItem(
    title: 'botones',
    subtitle: 'varios botones',
    link: '/botones',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'tarjetas',
    subtitle: 'varios tarjetas',
    link: '/tarjetas',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicator',
    subtitle: 'Generales y controladoas',
    link: '/progress',
    icon: Icons.refresh_rounded,
  )
];
