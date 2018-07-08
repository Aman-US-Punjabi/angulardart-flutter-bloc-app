import 'model.dart';
import 'package:meta/meta.dart';


// To get ride of AngularDart template errors for final variables,
// all varibles are not declared final
class BookModel extends Model {
  final String id;
  String name;
  String author;
  num price;
  String mainImage;

  final Map<dynamic, dynamic> allImages;

  BookModel({
    @required this.name,
    @required this.author,
    @required this.price,
    this.id = "",
    this.mainImage = '',
    this.allImages = const {}
  });

  BookModel copyWith({
    String id,
    String name,
    String author,
    num price,
    String mainImage,
    Map<dynamic, dynamic> allImages
  }) { 
    return new BookModel(
      id: this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      price: price ?? this.price,
      mainImage: mainImage ?? this.mainImage,
      allImages: allImages ?? this.allImages
    );
  }

  BookModel.fromJson(Map<String, dynamic> data) :
    id = data['id'],
    name = data['name'],
    author = data['author'],
    price = data['price'],
    mainImage = data['images']['main_image'],
    allImages = data['images']['all'];
  
  @override
  Map<String, dynamic> toJson() {
    final imagesJson = {
      'main_image': mainImage,
      'all': allImages
    };

    return {
      'name': name,
      'author': author,
      'price': price,
      'images': imagesJson,
    };
  }

  @override
  bool isValid() {
    if (name == null
      || author == null
      || price == null) {
        return false;
      }

    return true;
  }

}