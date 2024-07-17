import 'dart:io';

import 'package:cyber_safe/core/domains.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class AccountOjbModel {
  @Id()
  int id;
  String title;
  String? email;
  String? password;
  String? notes;
  String? icon;
  @Property(type: PropertyType.date)
  DateTime? passwordUpdatedAt;
  @Property(type: PropertyType.date)
  DateTime? createdAt;
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  CategoryOjbModel? categoryOjbModel;
  List<AccountCustomFieldOjbModel>? customFieldOjbModel;

  AccountOjbModel(
      {this.id = 0,
      required this.title,
      this.email,
      this.password,
      this.notes,
      this.icon,
      DateTime? passwordUpdatedAt,
      DateTime? createdAt,
      this.updatedAt,
      this.categoryOjbModel,
      this.customFieldOjbModel}) {
    this.createdAt = createdAt ?? DateTime.now();
    this.passwordUpdatedAt = passwordUpdatedAt ?? DateTime.now();
    updatedAt = updatedAt ?? DateTime.now();
  }
  final String defaultLocale = Platform.localeName;
  String get createdAtFromat =>
      "${DateFormat.yMMMd(defaultLocale).format(createdAt!)} ${DateFormat.Hm(defaultLocale).format(createdAt!)}";

  String get updatedAtFromat =>
      "${DateFormat.yMMMd(defaultLocale).format(updatedAt!)} ${DateFormat.Hm(defaultLocale).format(updatedAt!)}";

  String get passwordUpdatedAtFromat =>
      "${DateFormat.yMMMd(defaultLocale).format(passwordUpdatedAt!)} ${DateFormat.Hm(defaultLocale).format(passwordUpdatedAt!)}";

  //from json
  factory AccountOjbModel.fromJson(Map<String, dynamic> json) {
    return AccountOjbModel(
      id: json['id'],
      title: json['title'],
      email: json['email'],
      password: json['password'],
      notes: json['notes'],
      icon: json['icon'],
      passwordUpdatedAt: DateTime.parse(
          json['passwordUpdatedAt'] ?? DateTime.now().toIso8601String()),
      createdAt:
          DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt:
          DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      categoryOjbModel: json['category'] != null
          ? CategoryOjbModel.fromJson(json['category'])
          : null,
      customFieldOjbModel: json['customFields'] != null
          ? (json['customFields'] as List)
              .map((e) => AccountCustomFieldOjbModel.fromJson(e))
              .toList()
          : null,
    );
  }

//to json

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'email': email,
      'password': password,
      'notes': notes,
      'icon': icon,
      "customFields": customFieldOjbModel?.map((e) => e.toJson()).toList(),
      'category': categoryOjbModel?.toJson(),
      'passwordUpdatedAt': passwordUpdatedAt?.toIso8601String() ??
          DateTime.now().toIso8601String(),
    };
  }

  final category = ToOne<CategoryOjbModel>();
  @Backlink("account")
  final customFields = ToMany<AccountCustomFieldOjbModel>();
}
