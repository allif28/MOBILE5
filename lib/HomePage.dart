import 'package:flutter/material.dart';
import 'detailPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'nama': 'Nasi Goreng Spesial',
        'harga': 25000,
        'deskripsi': 'Nasi goreng dengan telur, ayam suwir, sayuran segar dan bumbu rempah pilihan.',
        'gambar': 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600',
      },
      {
        'nama': 'Chicken Steak',
        'harga': 35000,
        'deskripsi': 'Ayam panggang yang juicy disajikan dengan kentang goreng dan saus spesial.',
        'gambar': 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=600',
      },
      {
        'nama': 'Burger Premium',
        'harga': 28000,
        'deskripsi': 'Burger dengan daging sapi, keju, selada dan saus spesial yang lezat.',
        'gambar': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600',
      },
      {
        'nama': 'Pizza Keju',
        'harga': 45000,
        'deskripsi': 'Pizza dengan topping keju melimpah, saus tomat dan mozzarella.',
        'gambar': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=600',
      },
      {
        'nama': 'Mie Ayam',
        'harga': 18000,
        'deskripsi': 'Mie kenyal dengan topping ayam berbumbu, sayuran dan kuah kaldu gurih.',
        'gambar': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600',
      },
      {
        'nama': 'Pancake Strawberry',
        'harga': 22000,
        'deskripsi': 'Pancake lembut dengan topping strawberry segar dan sirup manis.',
        'gambar': 'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=600',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F0),
        foregroundColor: const Color(0xFF4E342E),
        elevation: 0,
        leading: const Icon(Icons.restaurant_menu),
        title: const Text(
          'Foodie Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFFFF8A50),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hungry Today?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Temukan makanan favoritmu di sini!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 12),
                  Icon(
                    Icons.fastfood,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Menu Makanan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Pilih makanan favoritmu!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 15),

            ListView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final p = products[index];

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 15),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            nama: p['nama'],
                            harga: p['harga'],
                            deskripsi: p['deskripsi'],
                            gambar: p['gambar'],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              p['gambar'],
                              width: 105,
                              height: 105,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 105,
                                  height: 105,
                                  color: Colors.orange.shade100,
                                  child: const Icon(
                                    Icons.restaurant,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p['nama'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4E342E),
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  p['deskripsi'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  'Rp ${p['harga']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF7043),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xFFFF7043),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
