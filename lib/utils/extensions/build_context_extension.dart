import 'package:flutter/material.dart';

import '../../ui/core/theme/theme.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  Palette get palette => theme.extension<PaletteExtension>()!.palette;
}
