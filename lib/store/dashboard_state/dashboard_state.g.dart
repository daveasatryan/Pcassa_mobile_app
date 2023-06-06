// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardState on DashboardStateBase, Store {
  late final _$selectedTabAtom =
      Atom(name: 'DashboardStateBase.selectedTab', context: context);

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  late final _$changeLanguageAsyncAction =
      AsyncAction('DashboardStateBase.changeLanguage', context: context);

  @override
  Future<void> changeLanguage(int id, String language, String tip) {
    return _$changeLanguageAsyncAction
        .run(() => super.changeLanguage(id, language, tip));
  }

  @override
  String toString() {
    return '''
selectedTab: ${selectedTab}
    ''';
  }
}
