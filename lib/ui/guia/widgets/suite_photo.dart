import 'package:flutter/material.dart';
import 'lowercase_text.dart';
import '../pages/suite_photos_page.dart';

class SuitePhoto extends StatelessWidget {
  final String photo;
  final String name;
  final int? qtd;
  final bool exibirQtdDisponiveis;
  final List<String> photos;

  const SuitePhoto({
    super.key,
    required this.photo,
    required this.name,
    required this.photos,
    this.qtd,
    this.exibirQtdDisponiveis = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuitePhotosPage(
                photos: photos,
                suiteName: name,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    photo,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(minHeight: 40),
                      alignment: Alignment.center,
                      child: LowercaseText(
                        name,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    if (exibirQtdDisponiveis && qtd != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wb_twilight,
                            color: Colors.red[600],
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          LowercaseText(
                            'só mais $qtd pelo app',
                            style: TextStyle(
                              color: Colors.red[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
