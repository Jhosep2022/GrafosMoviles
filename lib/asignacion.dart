// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'figuras/figuras.dart';
import 'models/modelos.dart';

class asignacion extends StatefulWidget {
  @override
  _asignacionState createState() => _asignacionState();
}

class _asignacionState extends State<asignacion> {
  int _currentIndex = 0;
  Nodo nodoOrigen = Nodo(valor: "", x: 0, y: 0);
  Nodo nodoDestino = Nodo(valor: "", x: 0, y: 0);
  Nodo nodoSeleccionado = Nodo(valor: "", x: 0, y: 0);
  final _random = new Random();
  Color colorsito = Colors.blue;
  List<Color> list = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.grey,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown
  ];
  int click = 0;
  int i = 0;
  String nomb = "", peso = "";
  String _chosenValue = "Rojo";
  List<Nodo> nodos = [];
  List<Enlace> enlaces = [];
  TextEditingController _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        centerTitle: true,
        title: Text('Asignacion',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  nodos = [];
                  enlaces = [];
                });
              },
              icon: Icon(Icons.clear, color: Colors.black)),
          IconButton(
            icon: Icon(Icons.help, color: Colors.black),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('HELP'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add_circle),
                          label: Text(
                              'Para Agregar un nodo, seleccione la opcion "Agregar nodo (+)" y seleccione en el lugar donde desea agregarlo.'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.move_up),
                          label: Text(
                              ' Para Mover un nodo, seleccione la opcion "Mover nodo " y arrastre el nodo.'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.delete_forever_outlined),
                          label: Text(
                              ' Para Eliminar un nodo, seleccione la opcion "Remover nodo (Tarro de basura)de fondo oscuro" y seleccione el nodo que desea eliminar.'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.linear_scale_rounded),
                          label: Text(
                              'Para agregar un enlace, seleccione la opcion "Agregar enlace (->)" y seleccione el nodo de origen y luego en el nodo de destino. '),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.remove_circle_outline_rounded),
                          label: Text(
                              'Para eliminar un enlace, seleccione la opcion "Remover enlace (-)de fondo claro" y seleccione el un Nodo donde le aparecerá una lista de enlaces del nodo, eliminelo con el icono de basurero.'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),
                        /*
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add_comment),
                          label: Text(
                              'Para agregar un peso a un enlace, seleccione la opcion "Agregar valor al enlace (icono de vía con un +)" y seleccione el Nodo que tiene el enlace a Editar. Seleccione de la lista el enlace.'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),*/
                        /*
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.generating_tokens_outlined),
                          label: Text(
                              'Para cambiar el nombre del grafo presione el icono que muestra a la izquierda. Y luego escriba el nombre del grafo.'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),*/
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.numbers_outlined),
                          label: Text(
                              'Para generar la matriz de adyacencia presione el icono que muestra a la izquierda.'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.clear),
                          label: Text(
                              'Para limpiar toda la pantalla presione el icono que muestra a la izquierda y luego presione la pantalla'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          CustomPaint(
            painter: Nodos(nodos: nodos),
            child: Container(),
          ),
          CustomPaint(
            painter: Enlaces(enlaces: enlaces),
            child: Container(),
          ),
          //OPCION AGREAGAR NODO
          if (_currentIndex == 0)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Ingrese el nombre del nodo"),
                            content: TextField(
                              onChanged: (value) {
                                nomb = value;
                              },
                            ),
                            actions: <Widget>[
                              TextButton(
                                  child: Text("Cancelar"),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  }),
                              TextButton(
                                  child: Text("Aceptar"),
                                  onPressed: () {
                                    setState(() {
                                      nodos.add(Nodo(
                                        valor: nomb,
                                        x: details.localPosition.dx,
                                        y: details.localPosition.dy,
                                      ));
                                      Navigator.pop(context);
                                    });
                                  }),
                            ],
                          );
                        });
                    /*
                    String valor = "";
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Ingrese el nombre del nodo"),
                            content: TextField(
                              onChanged: (value) {
                                nodos.add(Nodo(
                                  valor: value.toString(),
                                  x: details.localPosition.dx,
                                  y: details.localPosition.dy,
                                ));
                              },
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Aceptar"))
                            ],
                          );
                        });*/
                  });
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          //OPCION REMOVER NODO
          if (_currentIndex == 1)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    try {
                      nodos.forEach((nodo) {
                        if (sqrt(pow(nodo.x - details.localPosition.dx, 2) +
                                pow(nodo.y - details.localPosition.dy, 2)) <
                            25) {
                          nodos.remove(nodo);
                          enlaces.removeWhere((enlace) =>
                              enlace.origen == nodo || enlace.destino == nodo);
                        }
                      });
                    } catch (e) {}
                  });
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          //OPCION MOVER NODO
          if (_currentIndex == 2)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    nodos.forEach((nodo) {
                      if (sqrt(pow(nodo.x - details.localPosition.dx, 2) +
                              pow(nodo.y - details.localPosition.dy, 2)) <
                          25) {
                        nodo.x = details.localPosition.dx;
                        nodo.y = details.localPosition.dy;
                      }
                    });
                  });
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          //OPCION AGREGAR ENLACE
          if (_currentIndex == 3)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    nodos.forEach((nodo) {
                      if (sqrt(pow(nodo.x - details.localPosition.dx, 2) +
                              pow(nodo.y - details.localPosition.dy, 2)) <
                          25) {
                        if (click == 0) {
                          nodoOrigen = nodo;
                          click = 1;
                        } else {
                          nodoDestino = nodo;
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Ingrese el peso del enlace"),
                                  content: Container(
                                      width: 100,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text("Peso: "),
                                                Expanded(
                                                  child: TextField(
                                                    onChanged: (value) {
                                                      peso = value;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            /*Row(
                                              children: <Widget>[
                                                Text("Color: "),
                                                new DropdownButton<String>(
                                                  value: _chosenValue,
                                                  items: <String>[
                                                    'Rojo',
                                                    'Verde',
                                                    'Amarillo'
                                                  ].map((String value) {
                                                    return new DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: new Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      _chosenValue = value;
                                                    });
                                                  },
                                                )
                                              ],
                                            )*/
                                          ],
                                        ),
                                      )),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text("Cancelar"),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        }),
                                    TextButton(
                                        child: Text("Aceptar"),
                                        onPressed: () {
                                          setState(() {
                                            enlaces.add(Enlace(
                                                origen: nodoOrigen,
                                                destino: nodoDestino,
                                                id: enlaces.length + 1,
                                                peso: int.parse(peso),
                                                color: getcolor() as Color));
                                            Navigator.pop(context);
                                          });
                                        }),
                                  ],
                                );
                              });
                          /*enlaces.add(Enlace(
                              origen: nodoOrigen,
                              destino: nodoDestino,
                              id: enlaces.length + 1,
                              peso: 0));*/
                          click = 0;
                        }
                      }
                    });
                  });
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

          //OPCION MOSTRAR UNA LISTA DE LOS ENLACES Y PODER EDITARLOS O ELIMINARLOS opcion 4
          if (_currentIndex == 4)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    nodos.forEach((nodo) {
                      if (sqrt(pow(nodo.x - details.localPosition.dx, 2) +
                              pow(nodo.y - details.localPosition.dy, 2)) <
                          25) {
                        nodoSeleccionado = nodo;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Enlaces del nodo ${nodo.valor}'),
                              content: Container(
                                height: 200,
                                width: 200,
                                child: ListView.builder(
                                  itemCount: enlaces
                                      .where((enlace) =>
                                          enlace.origen == nodo ||
                                          enlace.destino == nodo)
                                      .length,
                                  itemBuilder: (context, index) {
                                    final enlacesFiltrados = enlaces
                                        .where((enlace) =>
                                            enlace.origen == nodo ||
                                            enlace.destino == nodo)
                                        .toList();
                                    final enlace = enlacesFiltrados[index];
                                    return ListTile(
                                      title: Text(
                                          'Origen: ${enlace.origen.valor} - Destino: ${enlace.destino.valor}'),
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          setState(() {
                                            enlaces.remove(
                                                enlace); // Remueve el enlace de la lista original
                                          });
                                          Navigator.of(context)
                                              .pop(); // Cierra el dialogo
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cerrar'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  });
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

          if (_currentIndex == 5)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onLongPressStart: (LongPressStartDetails details) {
                  setState(() {
                    nodos.forEach((nodo) {
                      if (sqrt(pow(nodo.x - details.localPosition.dx, 2) +
                              pow(nodo.y - details.localPosition.dy, 2)) <
                          25) {
                        nodoSeleccionado = nodo;
                        final enlacesFiltrados = enlaces
                            .where((enlace) =>
                                enlace.origen == nodo || enlace.destino == nodo)
                            .toList();
                        final opciones = enlacesFiltrados
                            .map((enlace) =>
                                'Enlace ${enlace.id} - Peso ${enlace.peso}')
                            .toList();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Nodo ${nodo.valor}'),
                              content: Container(
                                height: 200,
                                width: 200,
                                child: Column(
                                  children: [
                                    Text('Nodo: ${nodo.valor}'),
                                    Text('X: ${nodo.x}'),
                                    Text('Y: ${nodo.y}'),
                                    Text('Enlaces: ${enlacesFiltrados.length}'),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: opciones.length,
                                        itemBuilder: (context, index) {
                                          final enlace =
                                              enlacesFiltrados[index];
                                          return ListTile(
                                            title: Text(opciones[index]),
                                            onTap: () {
                                              _pesoController =
                                                  TextEditingController(
                                                      text: enlace.peso
                                                          .toString());
                                              Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  _pesoController =
                                                      TextEditingController(
                                                          text: enlace.peso
                                                              .toString());
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Editar peso del enlace ${enlace.id}'),
                                                    content: Container(
                                                      height: 200,
                                                      width: 200,
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                _pesoController,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText: 'Peso',
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                enlace
                                                                    .peso = value
                                                                        .isEmpty
                                                                    ? 0
                                                                    : int.parse(
                                                                        value);
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Cancelar'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            enlace.peso =
                                                                int.parse(
                                                                    _pesoController
                                                                        .text);
                                                            int index = enlaces
                                                                .indexWhere(
                                                                    (e) =>
                                                                        e.id ==
                                                                        enlace
                                                                            .id);
                                                            enlaces[index] =
                                                                enlace;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Guardar'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cerrar'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  });
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          //OPCION CAMBIAR NOMBRE
          if (_currentIndex == 6)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    try {
                      nodos.forEach((nodo) {
                        if (sqrt(pow(nodo.x - details.localPosition.dx, 2) +
                                pow(nodo.y - details.localPosition.dy, 2)) <
                            25) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Ingrese el nombre del nodo"),
                                  content: TextField(
                                    onChanged: (value) {
                                      nodo.valor = value;
                                    },
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Aceptar"))
                                  ],
                                );
                              });
                        }
                      });
                    } catch (e) {}
                  });
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          //boton para limpiar la pantalla
          // if (_currentIndex == 7)
          //   Positioned(
          //     top: 0,
          //     left: 0,
          //     right: 0,
          //     bottom: 0,
          //     child: GestureDetector(
          //       onTapDown: (details) {
          //         setState(() {
          //           nodos.clear();
          //           enlaces.clear();
          //         });
          //       },
          //       child: Container(
          //         color: Colors.transparent,
          //       ),
          //     ),
          //   ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber.shade700,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.add_circle),
              tooltip: 'Agregar nodo',
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.move_up),
              tooltip: 'Mover nodo',
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            GestureDetector(
              onLongPress: () => setState(() {
                _currentIndex = 10;
              }),
              child: IconButton(
                icon: Icon(Icons.delete_forever_outlined),
                tooltip: 'Remover nodo',
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.linear_scale_rounded),
              tooltip: 'Agregar enlace',
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.remove_circle_outline_rounded),
              tooltip: 'Remover enlace',
              onPressed: () {
                setState(() {
                  _currentIndex = 4;
                });
              },
            ),
            /*
            IconButton(
              icon: Icon(Icons.add_comment),
              tooltip: 'Agregar valor enlace',
              onPressed: () {
                setState(() {
                  _currentIndex = 5;
                });
              },
            ),*/
            /*IconButton(
              icon: Icon(Icons.generating_tokens_outlined),
              tooltip: 'Cambiar nombre nodo',
              onPressed: () {
                setState(() {
                  _currentIndex = 6;
                });
              },
            ),*/
            IconButton(
              icon: Icon(Icons.numbers_outlined),
              tooltip: 'Generar Matriz de Adyacencia',
              onPressed: () {
                setState(() {
                  if (nodos.length > 0) {
                    generarMatrizAdyacencia();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.amber.shade700,
                          title: Text('Error'),
                          content: Text('No hay nodos para generar la matriz'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.drag_handle),
              tooltip: 'Resolver algoritmo',
              onPressed: () {
                setState(() {
                  _currentIndex = 5;
                });
              },
            ),
            //limpiar la pantalla
            // IconButton(
            //   icon: Icon(Icons.clear),
            //   tooltip: 'Limpiar',
            //   onPressed: () {
            //     setState(() {
            //       _currentIndex = 7;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  List<Enlace> obtenerEnlacesAdyacentes(Nodo nodo) {
    List<Enlace> enlacesAdyacentes = [];
    for (Enlace enlace in enlaces) {
      if (enlace.origen == nodo || enlace.destino == nodo) {
        enlacesAdyacentes.add(enlace);
      }
    }
    return enlacesAdyacentes;
  }

  void generarMatrizAdyacencia() {
    List<List<int>> matriz = [];

    // Insertar primera fila con los números de los nodos y un espacio en blanco
    List<String> nombresNodos = nodos.map((nodo) => "${nodo.valor}").toList();
    nombresNodos.insert(0, "");
    matriz.add(List<int>.filled(nombresNodos.length, 0));
    for (int i = 1; i < nombresNodos.length; i++) {
      List<int> fila = List<int>.filled(nombresNodos.length, 0);

      // Insertar nombre del nodo en primera columna
      fila[0] = i;

      matriz.add(fila);
    }

    for (Enlace enlace in enlaces) {
      int origen = nodos.indexOf(enlace.origen) + 1;
      int destino = nodos.indexOf(enlace.destino) + 1;
      matriz[origen][destino] = enlace.peso;
      matriz[destino][origen] = enlace.peso;
    }

    List<DataColumn> columnas = List<DataColumn>.generate(
      nombresNodos.length,
      (index) {
        if (index == 0) {
          return DataColumn(label: Text("Nodo"));
        }
        return DataColumn(label: Text(nombresNodos[index]));
      },
    );

    List<DataRow> filas = List<DataRow>.generate(
      nombresNodos.length - 1,
      (index) => DataRow(
        cells: List<DataCell>.generate(
          nombresNodos.length,
          (j) => DataCell(Text(matriz[index + 1][j].toString() + " ")),
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber.shade200,
          title: Text('Matriz de Adyacencia'),
          content: SingleChildScrollView(
            child: DataTable(
              columns: columnas,
              rows: filas,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  getcolor() {
    i++;
    if (i > 8) {
      i = 1;
    }

    return list[i];
  }
}
