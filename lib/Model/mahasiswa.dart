class Mahasiswa{
  String nim;
  String nama;
  String semester;
  String tahun;
  String email;

  Mahasiswa({
    this.nim,
    this.nama,
    this.semester,
    this.tahun,
    this.email,
});
  factory Mahasiswa.fromJson(Map<String, dynamic> json) =>Mahasiswa(
    nim: json['nim'],
    nama: json['nama'],
    semester: json['semester'],
    tahun: json['tahun'],
    email: json['emai'],
  );
}