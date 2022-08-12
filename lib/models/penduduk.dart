class Penduduk {
  int? id;
  String? nik;
  String? kks;
  String? nama;
  String? tanggalLahir;
  String? jenisKelamin;
  String? agama;
  int? idStatus;
  String? pekerjaan;
  int? districtId;
  int? villageId;
  String? alamatLengkap;
  String? longitude;
  String? latitude;

  double? distance;
  String? nameStatus;
  String? nameDistrict;
   String? nameVillage;
   String? statusSurvey;

  Penduduk({
    this.id,
    this.nik,
    this.kks,
    this.nama,
    this.tanggalLahir,
    this.jenisKelamin,
    this.agama,
    this.idStatus,
    this.pekerjaan,
    this.districtId,
    this.villageId,
    this.alamatLengkap,
    this.longitude,
    this.latitude,
    this.distance,
    this.nameDistrict,
    this.nameVillage,
    this.nameStatus,
    this.statusSurvey,
  });

  Penduduk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kks = json['kks'];
    nama = json['nama'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    agama = json['agama'];
    idStatus = json['id_status'];
    pekerjaan = json['pekerjaan'];
    districtId = json['district_id'];
    villageId = json['village_id'];
    alamatLengkap = json['alamat_lengkap'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    nameDistrict = json['district']['name'];
    nameVillage = json['village']['name'];
    nameStatus =json['status']['status_penduduk'];
    statusSurvey =json['status_survey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nik'] = this.nik;
    data['kks'] = this.kks;
    data['nama'] = this.nama;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['agama'] = this.agama;
    data['id_status'] = this.idStatus;
    data['pekerjaan'] = this.pekerjaan;
    data['district_id'] = this.districtId;
    data['village_id'] = this.villageId;
    data['alamat_lengkap'] = this.alamatLengkap;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }

  Penduduk copyWith({
    String? nama,
    String? tanggalLahir,
    String? jenisKelamin,
    String? agama,
    int? idStatus,
    String? pekerjaan,
    int? districtId,
    int? villageId,
    String? alamatLengkap,
    String? longitude,
    String? latitude,
    double? distance,
    String? statusSurvey
  }) {
    return Penduduk(
      id: id,
      nik: nik,
      kks: kks,
      nama: nama ?? this.nama,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      agama: agama ?? this.agama,
      idStatus: idStatus ?? this.idStatus,
      pekerjaan: pekerjaan ?? this.pekerjaan,
      districtId: districtId ?? this.districtId,
      villageId: villageId ?? this.villageId,
      alamatLengkap: alamatLengkap ?? this.alamatLengkap,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      distance: distance ?? this.distance,
      nameDistrict: nameDistrict,
      nameStatus:nameStatus,
      nameVillage: nameVillage ,
      statusSurvey:statusSurvey??this.statusSurvey
    );
  }
}
