import 'package:hive/hive.dart';

import '../../model/login.dart';

class LoginResponseAdapter extends TypeAdapter<LoginResponse> {
  @override
  int get typeId => 1;

  @override
  LoginResponse read(BinaryReader reader) {
    return LoginResponse(
      id: reader.read(),
      code: reader.readString(),
      name: reader.readString(),
      email: reader.readString(),
      phone: reader.readString(),
      address: reader.readString(),
      role: reader.readString(),
      avatarLink: reader.readString(),
      lastLogin: DateTime(reader.readInt(), reader.readInt()),
      lastUpdate: DateTime(reader.readInt(), reader.readInt()),
      status: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, LoginResponse obj) {
    writer.write(obj.id);
    writer.writeString(obj.code);
    writer.writeString(obj.name);
    writer.writeString(obj.email);
    writer.writeString(obj.phone ?? "");
    writer.writeString(obj.address ?? "");
    writer.writeString(obj.role);
    writer.writeString(obj.avatarLink ?? "");

    writer.writeInt(obj.lastLogin.year);
    writer.writeInt(obj.lastLogin.month);
    writer.writeInt(obj.lastLogin.day);
    writer.writeInt(obj.lastLogin.hour);
    writer.writeInt(obj.lastLogin.minute);

    writer.writeInt(obj.lastUpdate.year);
    writer.writeInt(obj.lastUpdate.month);
    writer.writeInt(obj.lastUpdate.day);
    writer.writeInt(obj.lastUpdate.hour);
    writer.writeInt(obj.lastUpdate.minute);
    writer.writeString(obj.status);
  }
}
