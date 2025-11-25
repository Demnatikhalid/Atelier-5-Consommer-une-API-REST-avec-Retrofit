// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
  items: (json['items'] as List<dynamic>)
      .map((e) => Repo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{'items': instance.items};

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo(
  name: json['name'] as String,
  fullName: json['full_name'] as String,
  description: json['description'] as String?,
  stars: (json['stargazers_count'] as num?)?.toInt(),
  htmlUrl: json['html_url'] as String,
  language: json['language'] as String?,
  owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
  'name': instance.name,
  'full_name': instance.fullName,
  'description': instance.description,
  'stargazers_count': instance.stars,
  'html_url': instance.htmlUrl,
  'language': instance.language,
  'owner': instance.owner,
};

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
  login: json['login'] as String,
  avatarUrl: json['avatar_url'] as String,
);

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
  'login': instance.login,
  'avatar_url': instance.avatarUrl,
};
