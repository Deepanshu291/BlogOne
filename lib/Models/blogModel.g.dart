// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogModelAdapter extends TypeAdapter<BlogModel> {
  @override
  final int typeId = 0;

  @override
  BlogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogModel(
      id: fields[0] as String,
      imageUrl: fields[1] as String,
      title: fields[2] as String,
      isFav: fields[3] == null ? false : fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BlogModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.isFav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
