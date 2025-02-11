import 'package:hive/hive.dart';

part 'product_hive_model.g.dart';

@HiveType(typeId:1)
class ProductHiveModel {

  ProductHiveModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,});

  ProductHiveModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
    thumbnail = json['thumbnail'];
  }
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? category;
  @HiveField(4)
  dynamic price;
  @HiveField(5)
  dynamic discountPercentage;
  @HiveField(6)
  dynamic rating;
  @HiveField(7)
  int? stock;
  @HiveField(8)
  List<String>? tags;
  @HiveField(9)
  String? brand;
  @HiveField(10)
  String? sku;
  @HiveField(11)
  int? weight;
  @HiveField(12)
  Dimensions? dimensions;
  @HiveField(13)
  String? warrantyInformation;
  @HiveField(14)
  String? shippingInformation;
  @HiveField(15)
  String? availabilityStatus;
  @HiveField(16)
  List<Reviews>? reviews;
  @HiveField(17)
  String? returnPolicy;
  @HiveField(18)
  int? minimumOrderQuantity;
  @HiveField(19)
  Meta? meta;
  @HiveField(20)
  List<String>? images;
  @HiveField(21)
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['category'] = category;
    map['price'] = price;
    map['discountPercentage'] = discountPercentage;
    map['rating'] = rating;
    map['stock'] = stock;
    map['tags'] = tags;
    map['brand'] = brand;
    map['sku'] = sku;
    map['weight'] = weight;
    if (dimensions != null) {
      map['dimensions'] = dimensions?.toJson();
    }
    map['warrantyInformation'] = warrantyInformation;
    map['shippingInformation'] = shippingInformation;
    map['availabilityStatus'] = availabilityStatus;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['returnPolicy'] = returnPolicy;
    map['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['images'] = images;
    map['thumbnail'] = thumbnail;
    return map;
  }

}

@HiveType(typeId:2)
class Dimensions {
  Dimensions({
    this.width,
    this.height,
    this.depth,});

  Dimensions.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
  @HiveField(0)
  dynamic width;
  @HiveField(1)
  dynamic height;
  @HiveField(2)
  dynamic depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }

}

@HiveType(typeId:3)
class Reviews {
  Reviews({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,});

  Reviews.fromJson(dynamic json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }
  @HiveField(0)
  int? rating;
  @HiveField(1)
  String? comment;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? reviewerName;
  @HiveField(4)
  String? reviewerEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating'] = rating;
    map['comment'] = comment;
    map['date'] = date;
    map['reviewerName'] = reviewerName;
    map['reviewerEmail'] = reviewerEmail;
    return map;
  }

}

@HiveType(typeId:4)
class Meta {
  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,});

  Meta.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }
  @HiveField(0)
  String? createdAt;
  @HiveField(1)
  String? updatedAt;
  @HiveField(2)
  String? barcode;
  @HiveField(3)
  String? qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['barcode'] = barcode;
    map['qrCode'] = qrCode;
    return map;
  }

}
