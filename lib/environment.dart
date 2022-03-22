import 'package:flutter_dotenv/flutter_dotenv.dart';


class Environment{
  static String get _baseUrl => dotenv.env['base_url']!;


}