class ApplicationModel {
  factory ApplicationModel({
    required final String baseUrl,
    required final ApplicationMode flavor,
    required final String applicationName,
    required final ApplicationTheme theme,
    required final ApplicationLanguage language,
    required final String fontFamily,
  }) {
    _instance = ApplicationModel._internal(
      baseUrl: baseUrl,
      flavor: flavor,
      applicationName: applicationName,
      theme: theme,
      language: language,
      fontFamily: fontFamily,
    );
    return _instance;
  }
  ApplicationModel._internal({
    required this.baseUrl,
    required this.flavor,
    required this.applicationName,
    required this.theme,
    required this.language,
    required this.fontFamily,
  });
  String applicationName;
  ApplicationTheme theme;
  ApplicationLanguage language;
  String fontFamily;
  String baseUrl;
  ApplicationMode flavor;

  // ApplicationModel({
  //   required this.baseUrl,
  //   required this.flavor,
  //   required this.applicationName,
  //   required this.theme,
  //   required this.language,
  //   required this.fontFamily,
  // });

  static late ApplicationModel _instance;
  static ApplicationModel get instance => _instance;
  ApplicationModel fromJson(final Map<String, dynamic> json) =>
      ApplicationModel(
        baseUrl: json['baseUrl'],
        flavor: json['flavor'],
        applicationName: json['applicationName'],
        theme: getThemeFromString(json['theme']),
        language: getLanguageFromString(json['language']),
        fontFamily: json['fontFamily'],
      );

  Map<String, dynamic> toJson() => {
    'baseUrl': baseUrl,
    'flavor': flavor,
    'applicationName': applicationName,
    'theme': getTheme(theme),
    'language': getLanguage(language),
    'fontFamily': fontFamily,
  };

  String getTheme(final ApplicationTheme theme) {
    switch (theme) {
      case ApplicationTheme.light:
        return ApplicationTheme.light.name;
      case ApplicationTheme.dark:
        return ApplicationTheme.dark.name;
    }
  }

  String getLanguage(final ApplicationLanguage language) {
    switch (language) {
      case ApplicationLanguage.ar:
        return ApplicationLanguage.ar.name;
      case ApplicationLanguage.en:
        return ApplicationLanguage.en.name;
    }
  }

  ApplicationTheme getThemeFromString(final String theme) {
    switch (theme) {
      case 'light':
        return ApplicationTheme.light;
      case 'dark':
        return ApplicationTheme.dark;

      default:
        return ApplicationTheme.light;
    }
  }

  ApplicationLanguage getLanguageFromString(final String language) {
    switch (language) {
      case 'ar':
        return ApplicationLanguage.ar;
      case 'en':
        return ApplicationLanguage.en;
      default:
        return ApplicationLanguage.en;
    }
  }
}

enum ApplicationTheme { light, dark }

enum ApplicationLanguage { ar, en }

enum ApplicationMode { development, production }
