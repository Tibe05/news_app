import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiKey = dotenv.env['NEWS_API_KEY'] ?? ""; // Replace with your WeatherAPI key
