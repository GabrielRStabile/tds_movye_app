/// Biblioteca usada para centralizar as dependências e suas versões
/// Os módulos que usam dependências externas devem importar este arquivo
/// e não as dependências diretamente. Para adicionar uma nova dependência
/// basta colocar no arquivo pubspec.yaml e exportar aqui.
library dependencies;

export 'package:auto_injector/auto_injector.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:dio/dio.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:form_validator/form_validator.dart';
export 'package:go_router/go_router.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:intl/intl.dart';
export 'package:pinput/pinput.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:video_player/video_player.dart';
export 'package:youtube_player_flutter/youtube_player_flutter.dart';
