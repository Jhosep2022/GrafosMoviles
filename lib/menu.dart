import 'package:flutter/material.dart';
import 'asignacion.dart';
import 'johnson.dart';
import 'no.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 239, 152, 20),
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Grafos Moviles',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 232, 231, 229),
                    fontWeight: FontWeight.bold)),
            accountEmail: Text('Grupo Instrumentalizacion Humana',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 225, 225, 224),
                    fontWeight: FontWeight.bold)),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'asset/foto2.webp',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          ListTile(
            title: Text('Jhonson'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Apple()));
            },
            leading: const Icon(
              Icons.task,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.task,
              color: Colors.black,
            ),
            title: const Text(
              'Asignacion',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Search()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.task,
              color: Colors.black,
            ),
            title: const Text(
              'Northoest',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Account()));
            },
          ),
        ],
      ),
    );
  }

  //class imagen
}

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return no();
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return asignacion();
  }
}

class Apple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return johnson();
  }
}
