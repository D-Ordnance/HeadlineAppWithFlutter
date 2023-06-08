
class HeadLineDomain{
  String? author;
  String? title;
  String? url;
  String? urlToImage;

  HeadLineDomain({required this.author, required this.title, required this.url, required this.urlToImage});

  HeadLineDomain.fromJson(Map<String, dynamic> json){
    author = json["author"];
    title = json["title"];
    url = json["url"];
    urlToImage = json["urlToImage"];
  }
}