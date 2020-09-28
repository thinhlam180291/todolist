// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Todo List`
  String get app_name {
    return Intl.message(
      'Todo List',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `In Completed`
  String get in_completed {
    return Intl.message(
      'In Completed',
      name: 'in_completed',
      desc: '',
      args: [],
    );
  }

  /// `Description (*)`
  String get desciption {
    return Intl.message(
      'Description (*)',
      name: 'desciption',
      desc: '',
      args: [],
    );
  }

  /// `dd/MM/yyyy hh:ss (*)`
  String get format_time {
    return Intl.message(
      'dd/MM/yyyy hh:ss (*)',
      name: 'format_time',
      desc: '',
      args: [],
    );
  }

  /// `ADD`
  String get add_task {
    return Intl.message(
      'ADD',
      name: 'add_task',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the fields`
  String get error_add {
    return Intl.message(
      'Please fill all the fields',
      name: 'error_add',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}