class Photo {
  final int id;
  final String title;
  final String url;

  Photo(this.id, this.title, this.url);

  @override
  String toString() {
    return "{ID: $id, TITLE: $title, URL: $url}";
  }
}
