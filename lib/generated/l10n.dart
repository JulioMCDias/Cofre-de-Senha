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

  /// `Cofre de senha`
  String get title {
    return Intl.message(
      'Cofre de senha',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Nova senha`
  String get titleNewPassword {
    return Intl.message(
      'Nova senha',
      name: 'titleNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Editar senha`
  String get titleEditPassword {
    return Intl.message(
      'Editar senha',
      name: 'titleEditPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cadernos`
  String get titleBooks {
    return Intl.message(
      'Cadernos',
      name: 'titleBooks',
      desc: '',
      args: [],
    );
  }

  /// `Abrir repositorio`
  String get infoOpenRepository {
    return Intl.message(
      'Abrir repositorio',
      name: 'infoOpenRepository',
      desc: '',
      args: [],
    );
  }

  /// `Repositório:`
  String get infoRepository {
    return Intl.message(
      'Repositório:',
      name: 'infoRepository',
      desc: '',
      args: [],
    );
  }

  /// `Nome do arquivo:`
  String get infoFileName {
    return Intl.message(
      'Nome do arquivo:',
      name: 'infoFileName',
      desc: '',
      args: [],
    );
  }

  /// `Nome do Caderno`
  String get infoNameBook {
    return Intl.message(
      'Nome do Caderno',
      name: 'infoNameBook',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar caderno`
  String get infoAddNewBook {
    return Intl.message(
      'Adicionar caderno',
      name: 'infoAddNewBook',
      desc: '',
      args: [],
    );
  }

  /// `Editar caderno`
  String get infoEditBook {
    return Intl.message(
      'Editar caderno',
      name: 'infoEditBook',
      desc: '',
      args: [],
    );
  }

  /// `Titulo da senha`
  String get fieldTitlePassword {
    return Intl.message(
      'Titulo da senha',
      name: 'fieldTitlePassword',
      desc: '',
      args: [],
    );
  }

  /// `Nome`
  String get fieldName {
    return Intl.message(
      'Nome',
      name: 'fieldName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get fieldEmail {
    return Intl.message(
      'Email',
      name: 'fieldEmail',
      desc: '',
      args: [],
    );
  }

  /// `Senha`
  String get fieldPassword {
    return Intl.message(
      'Senha',
      name: 'fieldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter com a senha do repositorio`
  String get hintPassword {
    return Intl.message(
      'Enter com a senha do repositorio',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Descrição`
  String get fieldDescription {
    return Intl.message(
      'Descrição',
      name: 'fieldDescription',
      desc: '',
      args: [],
    );
  }

  /// `Abrir`
  String get btnOpenRepository {
    return Intl.message(
      'Abrir',
      name: 'btnOpenRepository',
      desc: '',
      args: [],
    );
  }

  /// `Criar Repositório`
  String get btnNewRepository {
    return Intl.message(
      'Criar Repositório',
      name: 'btnNewRepository',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get btnCancel {
    return Intl.message(
      'Cancelar',
      name: 'btnCancel',
      desc: '',
      args: [],
    );
  }

  /// `Salvar`
  String get btnSave {
    return Intl.message(
      'Salvar',
      name: 'btnSave',
      desc: '',
      args: [],
    );
  }

  /// `usar biometria`
  String get checkBoxBiometric {
    return Intl.message(
      'usar biometria',
      name: 'checkBoxBiometric',
      desc: '',
      args: [],
    );
  }

  /// `Relembrar senha`
  String get checkBoxPassword {
    return Intl.message(
      'Relembrar senha',
      name: 'checkBoxPassword',
      desc: '',
      args: [],
    );
  }

  /// `por favor entre com a senha`
  String get validatePassword {
    return Intl.message(
      'por favor entre com a senha',
      name: 'validatePassword',
      desc: '',
      args: [],
    );
  }

  /// `entre com um nome para o arquivo`
  String get validateNameFile {
    return Intl.message(
      'entre com um nome para o arquivo',
      name: 'validateNameFile',
      desc: '',
      args: [],
    );
  }

  /// `entre com um nome para o caderno`
  String get validateNameBook {
    return Intl.message(
      'entre com um nome para o caderno',
      name: 'validateNameBook',
      desc: '',
      args: [],
    );
  }

  /// `por favor entre com um titulo`
  String get validateTitle {
    return Intl.message(
      'por favor entre com um titulo',
      name: 'validateTitle',
      desc: '',
      args: [],
    );
  }

  /// `por favor entre com um email`
  String get validateEmail {
    return Intl.message(
      'por favor entre com um email',
      name: 'validateEmail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt'),
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