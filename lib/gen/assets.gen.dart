// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsDummyGen {
  const $AssetsDummyGen();

  /// File path: assets/dummy/amico.svg
  String get amico => 'assets/dummy/amico.svg';

  /// File path: assets/dummy/bro.svg
  String get bro => 'assets/dummy/bro.svg';

  /// File path: assets/dummy/d.png
  AssetGenImage get d => const AssetGenImage('assets/dummy/d.png');

  /// File path: assets/dummy/ddd.svg
  String get ddd => 'assets/dummy/ddd.svg';

  /// File path: assets/dummy/fa.png
  AssetGenImage get fa => const AssetGenImage('assets/dummy/fa.png');

  /// File path: assets/dummy/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/dummy/logo.png');

  /// File path: assets/dummy/pana.svg
  String get pana => 'assets/dummy/pana.svg';

  /// File path: assets/dummy/sh.png
  AssetGenImage get sh => const AssetGenImage('assets/dummy/sh.png');

  /// List of all assets
  List<dynamic> get values => [amico, bro, d, ddd, fa, logo, pana, sh];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/appoinment.svg
  String get appoinment => 'assets/icons/appoinment.svg';

  /// File path: assets/icons/empty.svg
  String get empty => 'assets/icons/empty.svg';

  /// File path: assets/icons/find.svg
  String get find => 'assets/icons/find.svg';

  /// File path: assets/icons/hh.svg
  String get hh => 'assets/icons/hh.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/reject.svg
  String get reject => 'assets/icons/reject.svg';

  /// File path: assets/icons/success.svg
  String get success => 'assets/icons/success.svg';

  /// List of all assets
  List<String> get values => [
    appoinment,
    empty,
    find,
    hh,
    profile,
    reject,
    success,
  ];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/ssraad.png
  AssetGenImage get ssraad => const AssetGenImage('assets/logo/ssraad.png');

  /// List of all assets
  List<AssetGenImage> get values => [ssraad];
}

class Assets {
  const Assets._();

  static const $AssetsDummyGen dummy = $AssetsDummyGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
