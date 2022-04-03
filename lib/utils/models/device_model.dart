abstract class Model {}

class DeviceModel extends Model {
  DeviceModel({required this.name, required this.id});

  final String name;
  final String id;
}
