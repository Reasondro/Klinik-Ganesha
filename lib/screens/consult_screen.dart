import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:klinik/router/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ConsultScreen extends StatefulWidget {
  const ConsultScreen({super.key});

  @override
  State<ConsultScreen> createState() => _ConsultScreenState();
}

class _ConsultScreenState extends State<ConsultScreen> {
  final List<String> _banners = [
    // 'https://via.placeholder.com/800x400?text=Banner+1',
    'https://images.unsplash.com/photo-1651760301007-5080dc7fc6a9?q=80&w=1505&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

    'https://images.unsplash.com/photo-1519494080410-f9aa76cb4283?q=80&w=1474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    "https://images.unsplash.com/photo-1620050382792-434b5828873d?q=80&w=1412&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
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
      'name': 'dr. Tirta',
      'specialty': 'Spesialis Sepatu',
      'imageUrl':
          'https://static.republika.co.id/uploads/images/inpicture_slide/073599800-1602844804-5f89678d176f0-dokter-tirtajpg.jpg'
    },
    {
      'name': 'dr. Olivia M.',
      'specialty': 'Spesialis Kulit',
      'imageUrl':
          'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/03/08055643/Cari-Dokter-Umum-Terbaik-di-Yogyakarta_-Ini-5-Rekomendasinya.jpg'
    },
    {
      'name': 'dr. Budi S.',
      'specialty': 'Dokter Umum',
      'imageUrl':
          'https://rssantamariapekanbaru.com/wp-content/uploads/2024/03/dr.-Audric-scaled.jpg'
    },
    {
      'name': 'dr. Rina Dewi',
      'specialty': 'Spesialis Gigi',
      'imageUrl':
          'https://asset.kompas.com/crops/y-6LDwtdT6_RTbt3P-atlAPEhC8=/0x0:998x665/1200x800/data/photo/2022/10/20/6350beaeeafc7.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          Text(
            "Temukan Layanan Konsultasi",
            style: theme.textTheme.titleMedium?.copyWith(
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
                        child: const Center(child: CircularProgressIndicator()),
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
                  backgroundColor: theme.colorScheme.surfaceContainer,
                  label: Text(_categories[index],
                      style: theme.textTheme.bodyMedium),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Dokter of the Week",
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
                    color: theme.colorScheme.inverseSurface,
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
                        imageBuilder: (context, imageProvider) => CircleAvatar(
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
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doc['specialty']!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onInverseSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      // TODO make detail doctor page
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Lihat Detail",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
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
    );
  }
}
