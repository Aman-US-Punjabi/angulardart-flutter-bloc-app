import 'package:build/build.dart';
import 'package:sass_builder/sass_builder.dart' as sass;

Builder scssBuilder(BuilderOptions options) =>
  new sass.SassBuilder(outputExtension: '.scss.css');