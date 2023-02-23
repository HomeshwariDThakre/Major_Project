class SoilDataModel {
  String? about;
  String? characteristics;
  String? foundIn;
  String? image;
  String? imagemap;
  List? images;
  String? mainimage;
  String? name;
  String? suitableCrops;

  SoilDataModel();
  Map<String, dynamic> toMap() {
    return {
      'about': about,
      'characteristics': characteristics,
      'foundIn': foundIn,
      'imagemap': image,
      'images': images,
      'image_map': imagemap,
      'mainimage': mainimage,
      'name': name,
      'suitableCrops': suitableCrops
    };
  }

  SoilDataModel.from(data)
      : about = data['about'],
        images = data['images'],
        characteristics = data['characteristics'],
        foundIn = data['foundIn'],
        image = data['image2'],
        imagemap = data['image_map'],
        mainimage = data['mainimage'],
        name = data['name'],
        suitableCrops = data['suitableCrops'];
}
