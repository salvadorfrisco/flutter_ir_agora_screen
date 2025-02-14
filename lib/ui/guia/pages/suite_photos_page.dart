import 'package:flutter/material.dart';
import '../widgets/lowercase_text.dart';

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
    const double imageHeight = 150.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: LowercaseText(
          suiteName,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF333333),
          size: 20,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: photos.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildSingleImage(photos[index], imageHeight);
          } else if (index == 1 || index == 2) {
            if (index == 1) {
              return _buildDoubleImage(
                  photos[index], photos[index + 1], imageHeight);
            }
            return const SizedBox();
          } else if (index == 3 || index == 4) {
            return _buildSingleImage(photos[index], imageHeight);
          } else {
            final adjustedIndex = index - 5;
            final isDoubleLine = (adjustedIndex ~/ 3) % 2 == 0;

            if (isDoubleLine) {
              if (adjustedIndex % 3 == 0) {
                final nextIndex = index + 1;
                if (nextIndex < photos.length) {
                  return _buildDoubleImage(
                      photos[index], photos[nextIndex], imageHeight);
                }
              } else if (adjustedIndex % 3 == 1) {
                return const SizedBox();
              }
            }
            return _buildSingleImage(photos[index], imageHeight);
          }
        },
      ),
    );
  }

  Widget _buildSingleImage(String imageUrl, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        height: height,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildDoubleImage(String imageUrl1, String imageUrl2, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: SizedBox(
                height: height,
                child: Image.network(
                  imageUrl1,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SizedBox(
                height: height,
                child: Image.network(
                  imageUrl2,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
