class EventsDbResponse {
  int id;
  String titulo;
  String imagen;
  String creadoPor;
  String parrafo;
  String lugar;
  String fecha;

  EventsDbResponse({
    required this.id,
    required this.titulo,
    required this.imagen,
    required this.creadoPor,
    required this.parrafo,
    required this.lugar,
    required this.fecha,
  });

  factory EventsDbResponse.fromJson(Map<String, dynamic> json) {
    return EventsDbResponse(
      id: json["id"] ?? 0,
      titulo: json["titulo"] ?? "",
      imagen: json["imagen"] ?? "",
      creadoPor: json["creado_por"] ?? "",
      parrafo: json["parrafo"] ?? "",
      lugar: json["lugar"] ?? "",
      fecha: json["fecha"] ?? "",
    );
  }
}
