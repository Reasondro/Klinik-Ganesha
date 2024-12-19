import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:klinik/router/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ConsultScreen extends StatefulWidget {
  const ConsultScreen({Key? key}) : super(key: key);

  @override
  State<ConsultScreen> createState() => _ConsultScreenState();
}

class _ConsultScreenState extends State<ConsultScreen> {
  final List<String> _banners = [
    'https://via.placeholder.com/800x400?text=Banner+1',
    'https://via.placeholder.com/800x400?text=Banner+2',
    'https://via.placeholder.com/800x400?text=Banner+3',
  ];

  final List<String> _categories = [
    'Kardiologi',
    'Dokter Umum',
    'Kulit & Kelamin',
    'Gigi',
    'Psikiatri',
    'Saraf',
    'Pediatri',
  ];

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. Angga',
      'specialty': 'Spesialis Jantung',
      'imageUrl': 'https://via.placeholder.com/150?text=Dr+Angga'
    },
    {
      'name': 'Dr. Sari Lestari',
      'specialty': 'Spesialis Kulit',
      'imageUrl': 'https://via.placeholder.com/150?text=Dr+Sari'
    },
    {
      'name': 'Dr. B. Santoso',
      'specialty': 'Dokter Umum',
      'imageUrl': 'https://via.placeholder.com/150?text=Dr+Budi'
    },
    {
      'name': 'Dr. Rina Dewi',
      'specialty': 'Spesialis Gigi',
      'imageUrl': 'https://via.placeholder.com/150?text=Dr+Rina'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Text(
              "Temukan Layanan Konsultasi",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Pilih layanan dan temukan dokter sesuai kebutuhan kesehatan Anda.",
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: _banners.map((bannerUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: bannerUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              "Kategori Konsultasi",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return Chip(
                    backgroundColor: theme.colorScheme.surfaceVariant,
                    label: Text(_categories[index],
                        style: theme.textTheme.bodyMedium),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Dokter Pilihan",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _doctors.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 220,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final doc = _doctors[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),
                        CachedNetworkImage(
                          imageUrl: doc['imageUrl']!,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 36,
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) => const CircleAvatar(
                            radius: 36,
                            backgroundColor: Colors.grey,
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const CircleAvatar(
                            radius: 36,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          doc['name']!,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          doc['specialty']!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Lihat Detail"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  context.push(Routes.nestedDoctorsScreen);
                },
                icon: const Icon(Icons.add),
                label: const Text('Buat Janji Konsultasi Baru'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
