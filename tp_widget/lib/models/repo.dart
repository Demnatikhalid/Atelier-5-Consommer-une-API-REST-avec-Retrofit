import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()
class SearchResult {
  final List<Repo> items;

  SearchResult({required this.items});

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}

@JsonSerializable()
class Repo {
  final String name;
  
  @JsonKey(name: "full_name")
  final String fullName;
  
  final String? description;
  
  @JsonKey(name: "stargazers_count")
  final int? stars;
  
  @JsonKey(name: "html_url")
  final String htmlUrl;
  
  final String? language;
  final Owner owner;

  Repo({
    required this.name,
    required this.fullName,
    this.description,
    this.stars,
    required this.htmlUrl,
    this.language,
    required this.owner,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}

@JsonSerializable()
class Owner {
  final String login;
  
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  Owner({required this.login, required this.avatarUrl});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}