class ContatosModel {
  List<Results>? results;

  ContatosModel({this.results});

  ContatosModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results extends ContatosModel {
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? nome;
  String? telefone;
  String? email;
  String? photoPath;

  Results(
      {this.objectId,
      this.createdAt,
      this.updatedAt,
      this.nome,
      this.telefone,
      this.email,
      this.photoPath});

  Results.criar(String name, String phoneNumber, String email);

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    nome = json['Nome'];
    telefone = json['Telefone'];
    email = json['Email'];
    photoPath = json['Photo_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['Nome'] = nome;
    data['Telefone'] = telefone;
    data['Email'] = email;
    data['Photo_path'] = photoPath;
    return data;
  }
}


class Contato {
  String nome;
  String telefone;
  String email;
  String foto;

  Contato(this.nome, this.telefone, this.email ,this.foto);

  Map toJson() => {
        'Nome': nome,
        'Telefone': telefone,
        'Email': email,
        'Photo_path': foto,
      };
}