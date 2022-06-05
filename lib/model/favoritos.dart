class Favoritos {
  String titulo;
  String id;
  String ano;
  String descricao;

  Favoritos(this.titulo, this.id, this.ano, this.descricao);

  factory Favoritos.fromJson(Map<String, dynamic> json) {
    return Favoritos(
      json['titulo'],
      json['id'],
      json['ano'],
      json['descricao'],
    );
  }
}
