class User {
  int? id;
  String? name;
  String? email;
  String? role;
  String? kecamatan;
  String? desa;
  String? createdAt;
  String? updatedAt;
  static int? token;

  User(
      {this.id,
      this.name,
      this.email,
      this.role,
      this.kecamatan,
      this.desa,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    kecamatan = json['kecamatan'];
    desa = json['desa'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['kecamatan'] = this.kecamatan;
    data['desa'] = this.desa;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}