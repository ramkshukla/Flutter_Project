class EnvConfig {
  final String apiBaseUrl;
  final String imageBaseUrl;
  final String apiKey;
  final String language;

  EnvConfig({
    required this.apiBaseUrl,
    required this.imageBaseUrl,
    required this.apiKey,
    required this.language,
  });
}

final development = EnvConfig(
  apiBaseUrl: "https://api.themoviedb.org/3",
  imageBaseUrl: "https://image.tmdb.org/t/p/w500",
  apiKey: "65ee47d743f17bdb30c86cef505966b7",
  language: "en-US",
);

final production = EnvConfig(
  apiBaseUrl: "https://api.themoviedb.org/3",
  imageBaseUrl: "https://image.tmdb.org/t/p/w500",
  apiKey: "65ee47d743f17bdb30c86cef505966b7",
  language: "en-US",
);
