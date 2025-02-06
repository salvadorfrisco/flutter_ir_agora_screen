import 'package:flutter/material.dart';

class SuitePhotosPage extends StatelessWidget {
  final List<String> photos;
  final String suiteName;

  const SuitePhotosPage({
    super.key,
    required this.photos,
    required this.suiteName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(suiteName.toLowerCase()),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: (photos.length / 3).ceil() * 2,
        itemBuilder: (context, index) {
          final startIndex = (index ~/ 2) * 3;
          final isFullWidth = index.isEven;

          if (isFullWidth) {
            // Linha com uma foto grande
            if (startIndex < photos.length) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      photos[startIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }
          } else {
            // Linha com duas fotos
            final photos1Index = startIndex + 1;
            final photos2Index = startIndex + 2;
            if (photos1Index < photos.length) {
              return Row(
                children: [
                  if (photos1Index < photos.length)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              photos[photos1Index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (photos2Index < photos.length)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              photos[photos2Index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
