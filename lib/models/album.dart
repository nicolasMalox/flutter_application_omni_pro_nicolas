class Album {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Album({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  Album.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'] as int;
    id = json['id'] as int;
    title = json['title'] as String;
    url = json['url'] as String;
    thumbnailUrl = json['thumbnailUrl'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;

    return data;
  }
}
