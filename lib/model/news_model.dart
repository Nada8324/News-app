class NewsModel{
  String ?status;
  int? totalResults;
  List<News_details>? List_of_articles=[];
  NewsModel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    totalResults=json['totalResults'];
    if(status!='error') {
      json['articles'].forEach((value) {
        if (

            value['author'] == null ||
            value['title'] == null ||
            value['description'] == null ||
            value['publishedAt'] == null ||
            value['url'] == null ||
            value['urlToImage'] == null ||
            value['content'] == null

        ) {

        }
        else {
          List_of_articles?.add(News_details.fromJson(value));
        }
      });
    }
  }
}
class News_details{
  bool saved=false;
  String ? author;
  String ? title;
  String ? description;
  String ? url;
  String ? urlToImage;
  String ? publishedAt;
  String ? content;
  String ?category;
  News_details.fromJson(Map<String,dynamic>json){

    author=json['author'];
    title=json['title'];
    description=json['description'];
    url=json['url'];
    urlToImage=json['urlToImage'];
    publishedAt=json['publishedAt'];
    content=json['content'];
    category=json['category'];
  }
  News_details.database(Map<String,dynamic>json){
    author=json['author'];
    title=json['title'];
    description=json['description'];
    url=json['url'];
    urlToImage=json['urlToImage'];
    publishedAt=json['publishedAt'];
    content=json['content'];
    category=json['category'];
  }
}