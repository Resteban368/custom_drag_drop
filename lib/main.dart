// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Drag and Drop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Offset position;

  @override
  void initState() {
    super.initState();
    position = const Offset(0, 0);
  }

//* Este método se llama cuando el usuario comienza a arrastrar el widget de imagen NonStopIO.
//* Aquí, podemos realizar cualquier inicialización o registro necesario.
  void _onPanStart(BuildContext context, DragStartDetails details) {
    // print(details.globalPosition.dy);
  }

//*Este método se llama continuamente cuando el usuario mueve su dedo durante la operación de arrastre.
//*Actualizamos el position variable con la posición global actual del dedo.
  void _onPanUpdate(
      BuildContext context, DragUpdateDetails details, Offset offset) {
    setState(() {
      position = details.globalPosition;
    });

    // print(' dx: ${position.dx}');
    // print('dy: ${position.dy}');
  }

//*Este método se llama cuando el usuario suelta su dedo después de arrastrar el widget de imagen NonStopIO.
//*Verificamos la posición final del widget de imagen NonStopIO y determinamos si debe soltarse en el cuadro
//*verde o restablecerse en el cuadro rojo.

  void _onPanEnd(BuildContext context, DragEndDetails details) {
    print(position);
    if (position.dy < 180 &&
        position.dy > 100 &&
        position.dx > 100 &&
        position.dx < 180) {
      setState(() {
        position = const Offset(120, 120);
      });
    } else if (
        //tODO: posisicion para el container de colo azul
        position.dy < 251 &&
            position.dy > 208 &&
            position.dx > 0 &&
            position.dx < 22) {
      setState(() {
        position = const Offset(1.0, 232);
      });
    } else if (
        //tODO: posisicion para el container de colo amber
        position.dy < 251 &&
            position.dy > 208 &&
            position.dx > 218 &&
            position.dx < 262) {
      setState(() {
        position = const Offset(240, 238);
      });
    } else if (
        //tODO: posisicion para el container de colo indigo
        position.dy < 180 &&
            position.dy > 100 &&
            position.dx > 218 &&
            position.dx < 262) {
      setState(() {
        position = const Offset(240, 15);
      });
    } else {
      setState(() {
        position = const Offset(0, 0);
      });
    }
    print(details.velocity);
  }

//*Este método se llama si la operación de arrastre se cancela o interrumpe.
  void _onPanCancel(BuildContext context) {
    print("Pan canceled !!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Custom Drag and Drop'),
      ),
      body: SafeArea(
        child: LimitedBox(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 120,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 120,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 120,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 240,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 240,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 240,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                top: position.dy,
                left: position.dx,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onPanStart: (details) => _onPanStart(context, details),
                    onPanUpdate: (details) =>
                        _onPanUpdate(context, details, position),
                    onPanEnd: (details) => _onPanEnd(context, details),
                    onPanCancel: () => _onPanCancel(context),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/img.jpeg',
                          height: 50,
                          width: 50,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
