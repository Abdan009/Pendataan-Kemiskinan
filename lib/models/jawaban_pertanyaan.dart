import 'package:equatable/equatable.dart';

class JawabanPertanyaan extends Equatable {
  final int? id;
  final int? idPertanyaan;
  final String? pilihanJawaban;
  final int? poinJawaban;
  final String? createdAt;
  final String? updatedAt;

  const JawabanPertanyaan(
      {this.id,
      this.idPertanyaan,
      this.pilihanJawaban,
      this.poinJawaban,
      this.createdAt,
      this.updatedAt});

  factory JawabanPertanyaan.fromJson(Map<String, dynamic> json) {
    return JawabanPertanyaan(
      id: json['id'],
      idPertanyaan: json['id_pertanyaan'],
      pilihanJawaban: json['pilihan_jawaban'],
      poinJawaban: json['poin_jawaban'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_pertanyaan'] = this.idPertanyaan;
    data['pilihan_jawaban'] = this.pilihanJawaban;
    data['poin_jawaban'] = this.poinJawaban;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        idPertanyaan,
        pilihanJawaban,
        poinJawaban,
        createdAt,
        updatedAt,
      ];
}
