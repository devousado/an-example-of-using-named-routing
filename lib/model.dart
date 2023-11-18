class UserModel {
  String name;
  int id;
  UserModel({
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }

  @override
  String toString() => 'UserModel(name: $name, id: $id)';
}
