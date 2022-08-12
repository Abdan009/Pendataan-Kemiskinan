import 'package:app_flutter_cocom/models/jawaban_pertanyaan.dart';

class Pertanyaan {
  int? id;
  String? isiPertanyaan;
  String? createdAt;
  String? updatedAt;
  List<JawabanPertanyaan>? listJawaban;
  JawabanPertanyaan? answer;

  Pertanyaan({
    this.id,
    this.isiPertanyaan,
    this.createdAt,
    this.updatedAt,
    this.listJawaban,
    this.answer,
  });

  Pertanyaan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isiPertanyaan = json['Isi_pertanyaan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // answer = json['idAnswer'];
    listJawaban = (json['opsi_jawaban'] != null)
        ? (json['opsi_jawaban'] as List)
            .map(
              (e) => JawabanPertanyaan.fromJson(
                e,
              ),
            )
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Isi_pertanyaan'] = this.isiPertanyaan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  Pertanyaan copyWith({
    String? isiPertanyaan,
    List<JawabanPertanyaan>? listJawaban,
    JawabanPertanyaan? answer,
  }) {
    return Pertanyaan(
      id: id,
      isiPertanyaan: isiPertanyaan ?? this.isiPertanyaan,
      createdAt: createdAt,
      updatedAt: updatedAt,
      listJawaban: listJawaban ?? this.listJawaban,
      answer: answer ?? this.answer,
    );
  }
}
