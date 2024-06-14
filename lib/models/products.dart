class Products {
  final List<Car> cars;
  final List<Car> computer;
  final Uylar uylar;

  Products({
    required this.cars,
    required this.computer,
    required this.uylar,
  });

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        cars: List<Car>.from(json["cars"].map((x) => Car.fromMap(x))),
        computer: List<Car>.from(json["computer"].map((x) => Car.fromMap(x))),
        uylar: Uylar.fromMap(json["uylar"]),
      );

  Map<String, dynamic> toMap() => {
        "cars": List<dynamic>.from(cars.map((x) => x.toMap())),
        "computer": List<dynamic>.from(computer.map((x) => x.toMap())),
        "uylar": uylar.toMap(),
      };
}

class Car {
  final String auksiontime;
  final String description;
  final int endprice;
  final List<dynamic> images;
  final String name;
  final int rating;
  final int startprice;

  Car({
    required this.auksiontime,
    required this.description,
    required this.endprice,
    required this.images,
    required this.name,
    required this.rating,
    required this.startprice,
  });

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        auksiontime: json["auksiontime"],
        description: json["description"],
        endprice: json["endprice"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        rating: json["rating"],
        startprice: json["startprice"],
      );

  Map<String, dynamic> toMap() => {
        "auksiontime": auksiontime,
        "description": description,
        "endprice": endprice,
        "images": List<Image>.from(images.map((x) => x.toMap())),
        "name": name,
        "rating": rating,
        "startprice": startprice,
      };
}

class Image {
  final String imageUrl;

  Image({
    required this.imageUrl,
  });

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        imageUrl: json["imageURL"],
      );

  Map<String, dynamic> toMap() => {
        "imageURL": imageUrl,
      };
}

class Uylar {
  final Car car;
  final List<Image> images;

  Uylar({
    required this.car,
    required this.images,
  });

  factory Uylar.fromMap(Map<String, dynamic> json) => Uylar(
        car: Car.fromMap(json["0"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "0": car.toMap(),
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
      };
}
