// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductHiveModelAdapter extends TypeAdapter<ProductHiveModel> {
  @override
  final int typeId = 1;

  @override
  ProductHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductHiveModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      category: fields[3] as String?,
      price: fields[4] as dynamic,
      discountPercentage: fields[5] as dynamic,
      rating: fields[6] as dynamic,
      stock: fields[7] as int?,
      tags: (fields[8] as List?)?.cast<String>(),
      brand: fields[9] as String?,
      sku: fields[10] as String?,
      weight: fields[11] as int?,
      dimensions: fields[12] as Dimensions?,
      warrantyInformation: fields[13] as String?,
      shippingInformation: fields[14] as String?,
      availabilityStatus: fields[15] as String?,
      reviews: (fields[16] as List?)?.cast<Reviews>(),
      returnPolicy: fields[17] as String?,
      minimumOrderQuantity: fields[18] as int?,
      meta: fields[19] as Meta?,
      images: (fields[20] as List?)?.cast<String>(),
      thumbnail: fields[21] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductHiveModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.discountPercentage)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.stock)
      ..writeByte(8)
      ..write(obj.tags)
      ..writeByte(9)
      ..write(obj.brand)
      ..writeByte(10)
      ..write(obj.sku)
      ..writeByte(11)
      ..write(obj.weight)
      ..writeByte(12)
      ..write(obj.dimensions)
      ..writeByte(13)
      ..write(obj.warrantyInformation)
      ..writeByte(14)
      ..write(obj.shippingInformation)
      ..writeByte(15)
      ..write(obj.availabilityStatus)
      ..writeByte(16)
      ..write(obj.reviews)
      ..writeByte(17)
      ..write(obj.returnPolicy)
      ..writeByte(18)
      ..write(obj.minimumOrderQuantity)
      ..writeByte(19)
      ..write(obj.meta)
      ..writeByte(20)
      ..write(obj.images)
      ..writeByte(21)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DimensionsAdapter extends TypeAdapter<Dimensions> {
  @override
  final int typeId = 2;

  @override
  Dimensions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dimensions(
      width: fields[0] as dynamic,
      height: fields[1] as dynamic,
      depth: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Dimensions obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.width)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.depth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DimensionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReviewsAdapter extends TypeAdapter<Reviews> {
  @override
  final int typeId = 3;

  @override
  Reviews read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Reviews(
      rating: fields[0] as int?,
      comment: fields[1] as String?,
      date: fields[2] as String?,
      reviewerName: fields[3] as String?,
      reviewerEmail: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Reviews obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.rating)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.reviewerName)
      ..writeByte(4)
      ..write(obj.reviewerEmail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final int typeId = 4;

  @override
  Meta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meta(
      createdAt: fields[0] as String?,
      updatedAt: fields[1] as String?,
      barcode: fields[2] as String?,
      qrCode: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.updatedAt)
      ..writeByte(2)
      ..write(obj.barcode)
      ..writeByte(3)
      ..write(obj.qrCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
