import 'package:flutter/material.dart';

void main() {
  runApp(const AlaBurgerApp());
}

class AlaBurgerApp extends StatelessWidget {
  const AlaBurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlaBurger al Carbón',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Simulamos los 14 productos de tu negocio
  // Nota: Sustituye las URLs por las de tu repositorio de GitHub
  final List<Map<String, String>> productos = const [
    {'nombre': 'Burger Clásica', 'sub': 'Al carbón con queso', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img1.jpg'},
    {'nombre': 'Boneless BBQ', 'sub': '10 piezas crujientes', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img2.jpg'},
    {'nombre': 'Burger Especial', 'sub': 'Doble carne y tocino', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img3.jpg'},
    {'nombre': 'Papas Sazonadas', 'sub': 'Corte natural', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img4.jpg'},
    {'nombre': 'Hot Dog Jumbo', 'sub': 'Salchicha para asar', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img5.jpg'},
    {'nombre': 'Boneless Buffalo', 'sub': 'Nivel de picante: Medio', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img6.jpg'},
    {'nombre': 'Burger Hawaiiana', 'sub': 'Piña a la parrilla', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img7.jpg'},
    {'nombre': 'Aros de Cebolla', 'sub': 'Extra crujientes', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img8.jpg'},
    {'nombre': 'Monster Burger', 'sub': 'Para los valientes', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img9.jpg'},
    {'nombre': 'Boneless Mango H.', 'sub': 'Dulce y picoso', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img10.jpg'},
    {'nombre': 'Burger Pollo', 'sub': 'Pechuga empanizada', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img11.jpg'},
    {'nombre': 'Dedos de Queso', 'sub': '6 piezas con marinara', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img12.jpg'},
    {'nombre': 'Combo Familiar', 'sub': '4 burgers + 2 papas', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img13.jpg'},
    {'nombre': 'Malteada Oreo', 'sub': 'El postre perfecto', 'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/main/img14.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlaBurger al Carbón - Menú'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        // Aquí defines las 2 columnas
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columnas
          childAspectRatio: 0.75, // Ajusta el alto de la tarjeta
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productos.length, // Esto dará los 14 elementos (7 filas)
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen desde GitHub
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      productos[index]['img']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // Imagen de error por si falla GitHub
                      errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.fastfood, size: 50, color: Colors.grey),
                    ),
                  ),
                ),
                // Información inferior
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productos[index]['nombre']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        productos[index]['sub']!,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      // Estrellitas
                      Row(
                        children: const [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star_half, size: 16, color: Colors.amber),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}