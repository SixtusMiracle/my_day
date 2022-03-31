import 'package:flutter/material.dart';

import '../models/mi_icon.dart';

const miTextColor = Color(0xFF181743);
const miTextBoldColor = Color(0xFF464569);
const miDefaultSize = 14.0;

Map<String, MiIcon> mi_icons = {
  "cart": MiIcon(
    iconPath: "assets/icons/shopping_cart.svg",
    colorCode: 0x4dfea64c,
    gradientStartColor: 0xfffe1e9a,
    gradientStopColor: 0xfffea64c,
    beginStart: 1.0,
    beginStop: -1.0,
    endStart: -0.83,
    endStop: 1.0,
  ),
  "basketball": MiIcon(
    iconPath: "assets/icons/basketball.svg",
    colorCode: 0x4dfe1e9a,
    gradientStartColor: 0xfffe1e9a,
    gradientStopColor: 0xff254dde,
    beginStart: -0.83,
    beginStop: 1.0,
    endStart: 0.85,
    endStop: -1.0,
  ),
  "location": MiIcon(
    iconPath: "assets/icons/location.svg",
    colorCode: 0x4d254dde,
    gradientStartColor: 0xd9254dde,
    gradientStopColor: 0xd9181743,
    beginStart: -0.92,
    beginStop: 1.07,
    endStart: 1.0,
    endStop: -1.0,
  ),
  "tick": MiIcon(
    iconPath: "assets/icons/tick.svg",
    colorCode: 0xffffffff,
    gradientStartColor: 0xFFFFFB01,
    gradientStopColor: 0xFF067017,
    beginStart: -0.8,
    beginStop: 0.81,
    endStart: 1.2,
    endStop: -1.23,
  ),
  "calendar": MiIcon(
    iconPath: "assets/icons/calendar.svg",
    colorCode: 0xffffffff,
    gradientStartColor: 0xffffffff,
    gradientStopColor: 0xffffffff,
    beginStart: -0.8,
    beginStop: 0.81,
    endStart: 1.2,
    endStop: -1.23,
  ),
  "plus": MiIcon(
    iconPath: "assets/icons/plus.svg",
    colorCode: 0xffffffff,
    gradientStartColor: 0xFF020202,
    gradientStopColor: 0xFF01E1FF,
    beginStart: 1.22,
    beginStop: -1.22,
    endStart: -0.65,
    endStop: 1.52,
  ),
};
