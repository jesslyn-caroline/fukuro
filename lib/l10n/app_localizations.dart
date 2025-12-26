import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
    Locale('ja'),
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @homeQuizPoint.
  ///
  /// In en, this message translates to:
  /// **'Point'**
  String get homeQuizPoint;

  /// No description provided for @homeFirstQuote.
  ///
  /// In en, this message translates to:
  /// **'Knowledge is your power'**
  String get homeFirstQuote;

  /// No description provided for @homeSecondQuote.
  ///
  /// In en, this message translates to:
  /// **'Study now, success later'**
  String get homeSecondQuote;

  /// No description provided for @homeThirdQuote.
  ///
  /// In en, this message translates to:
  /// **'Try, Fail, Learn, Repeat'**
  String get homeThirdQuote;

  /// No description provided for @homeFourthQuote.
  ///
  /// In en, this message translates to:
  /// **'Progress over perfection'**
  String get homeFourthQuote;

  /// No description provided for @homeOngoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get homeOngoing;

  /// No description provided for @homeStreakQuiz.
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get homeStreakQuiz;

  /// No description provided for @homeChallenge.
  ///
  /// In en, this message translates to:
  /// **'Ready for today\'s challenge'**
  String get homeChallenge;

  /// No description provided for @homeChallengeDesc.
  ///
  /// In en, this message translates to:
  /// **'Test your knowledge with fun, bite-sized quizzes'**
  String get homeChallengeDesc;

  /// No description provided for @homeBanner.
  ///
  /// In en, this message translates to:
  /// **'What would you like to learn today'**
  String get homeBanner;

  /// No description provided for @homePopularCourse.
  ///
  /// In en, this message translates to:
  /// **'Popular Courses'**
  String get homePopularCourse;

  /// No description provided for @homeSeeAllCourse.
  ///
  /// In en, this message translates to:
  /// **'See all courses'**
  String get homeSeeAllCourse;

  /// No description provided for @quizDailyQuiz.
  ///
  /// In en, this message translates to:
  /// **'Daily Quiz'**
  String get quizDailyQuiz;

  /// No description provided for @quizDescription.
  ///
  /// In en, this message translates to:
  /// **'Take a short break and see how many questions you can get right today'**
  String get quizDescription;

  /// No description provided for @quizQuestion.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get quizQuestion;

  /// No description provided for @quizSubmit.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT'**
  String get quizSubmit;

  /// No description provided for @quizComplete.
  ///
  /// In en, this message translates to:
  /// **'Quiz Complete'**
  String get quizComplete;

  /// No description provided for @quizScore.
  ///
  /// In en, this message translates to:
  /// **'Your score'**
  String get quizScore;

  /// No description provided for @coursesTitle.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get coursesTitle;

  /// No description provided for @coursesDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore a variety of tech courses designed to help you grow your skills'**
  String get coursesDescription;

  /// No description provided for @coursesDetailLevel.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get coursesDetailLevel;

  /// No description provided for @coursesDetailLessons.
  ///
  /// In en, this message translates to:
  /// **'Number of Lessons'**
  String get coursesDetailLessons;

  /// No description provided for @coursesDetailEnroll.
  ///
  /// In en, this message translates to:
  /// **'Enroll'**
  String get coursesDetailEnroll;

  /// No description provided for @profileProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Change Profile Picture'**
  String get profileProfilePicture;

  /// No description provided for @profileSwitch.
  ///
  /// In en, this message translates to:
  /// **'Switch Mode'**
  String get profileSwitch;

  /// No description provided for @profileUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get profileUsername;

  /// No description provided for @profilePassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get profilePassword;

  /// No description provided for @profileChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get profileChangeLanguage;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'LOG OUT'**
  String get profileLogout;

  /// No description provided for @profilePictureSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profilePictureSave;

  /// No description provided for @usernameChange.
  ///
  /// In en, this message translates to:
  /// **'Change username'**
  String get usernameChange;

  /// No description provided for @usernameNew.
  ///
  /// In en, this message translates to:
  /// **'New username'**
  String get usernameNew;

  /// No description provided for @passwordChange.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get passwordChange;

  /// No description provided for @passwordCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get passwordCurrent;

  /// No description provided for @passwordNew.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get passwordNew;

  /// No description provided for @passwordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get passwordConfirm;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordNotMatch;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageIndonesian.
  ///
  /// In en, this message translates to:
  /// **'Indonesia'**
  String get languageIndonesian;

  /// No description provided for @languageJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get languageJapanese;

  /// No description provided for @languageQuestion.
  ///
  /// In en, this message translates to:
  /// **'What language do you want to use for Fukuro?'**
  String get languageQuestion;

  /// No description provided for @changeButton.
  ///
  /// In en, this message translates to:
  /// **'CHANGE'**
  String get changeButton;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Something wrong'**
  String get error;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
