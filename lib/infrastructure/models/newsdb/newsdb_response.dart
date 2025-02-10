class NewsDbResponse {
  int id;
  String titulo;
  String imagen;
  String creadoPor;
  String parrafo;
  String url;

  NewsDbResponse({
    required this.id,
    required this.titulo,
    required this.imagen,
    required this.creadoPor,
    required this.parrafo,
    required this.url,
  });

  factory NewsDbResponse.fromJson(Map<String, dynamic> json) {
    return NewsDbResponse(
      id: json["id"] ?? 0,
      titulo: json["titulo"] ?? "",
      imagen: json["imagen"] ?? "",
      creadoPor: json["creado_por"] ?? "",
      parrafo: json["parrafo"] ?? "",
      url: json["url"] ?? "",
    );
  }
}
