import 'package:flutter/material.dart';
import '../model/Cat.dart';

class CatDetailPage extends StatelessWidget {
  final Cat cat;

  const CatDetailPage({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cat.pictureUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Cat Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildInfoRow("Nama", cat.name),
            _buildInfoRow("Umur", "${cat.age} tahun"),
            _buildInfoRow("Ras", cat.breed),
            _buildInfoRow("Warna", cat.color),
            _buildInfoRow("Jenis Kelamin", cat.sex),
            SizedBox(height: 16),
            Text(
              "Characteristics",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildList(cat.characteristics),
            SizedBox(height: 16),
            Text(
              "Vaccines",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            cat.vaccines.isNotEmpty
                ? _buildList(cat.vaccines)
                : Text("No Vaccines", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 16),
            Text(
              "Background",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              cat.background,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  
  Widget _buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Text("- $item")).toList(),
    );
  }
}
