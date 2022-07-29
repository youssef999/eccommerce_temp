


class CatModel {

  String  name, image;
  CatModel({this.name,this.image});

  CatModel.fromJson(Map<dynamic,dynamic>map){
    if(map ==null){
      return;
    }

    name=map['name'];
    image=map['image'];
  }

  toJson(){
    return {
      'name':name,
      'image':image
    };
  }
}
