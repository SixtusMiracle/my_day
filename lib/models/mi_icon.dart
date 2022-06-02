class MiIcon {
  /// Holds data for an icon

  MiIcon({
    required this.iconPath,
    required this.colorCode,
    required this.gradientStartColor,
    required this.gradientStopColor,
    required this.beginStart,
    required this.beginStop,
    required this.endStart,
    required this.endStop,
  });

  final String iconPath;
  final int? colorCode;
  final int gradientStartColor, gradientStopColor;
  final double beginStart, beginStop, endStart, endStop;
}
