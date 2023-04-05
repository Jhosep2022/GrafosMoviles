import 'package:flutter/material.dart';

class Nodo {
  String valor;

  double x;
  double y;

  Nodo({
    required this.valor,
    required this.x,
    required this.y,
  });
}

class Enlace {
  final Nodo origen;
  final Nodo destino;
  final int id;

  int peso;
  Color color;

  Enlace({
    required this.id,
    required this.origen,
    required this.destino,
    required this.peso,
    required this.color,
  });
}

class Grafo {
  List<Nodo> nodos;
  List<Enlace> enlaces;

  Grafo({required this.nodos, required this.enlaces});
}
