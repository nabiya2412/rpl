class Admin {
  String nama;
  int nik;
  String email;
  String password;

  Admin({this.nama, this.nik, this.email, this.password});

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    nama: json['nama'],
    nik: int.parse(json['id'].toString()),
    email: json['email'],
    password: json['password'],
  );
}
