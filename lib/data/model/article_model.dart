import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String description;
  final String pubDate;
  final String thumbnail;

  const Article({
    required this.id,
    required this.title,
    required this.description,
    required this.pubDate,
    required this.thumbnail,
  });

  static List<Article> articles = [
    const Article(
        id: '1',
        title: "Mitsubishi Triton akan menjelajah ribuan kilometer di AXCR",
        pubDate: "2022-11-19T05:05:51.000Z",
        description:
            "Mitsubishi Motors Corporation mengumumkan bahwa Tim Mitsubishi Ralliart bersiap berpetualang ribuan kilometer dengan dukungan teknis dari Mitsubishi Motors pada ajang Asia Cross Country Rally (AXCR) yang berlangsung 21-26 ...",
        thumbnail:
            "https://img.antaranews.com/cache/800x533/2022/11/19/Team-Mitsubishi-Ralliart-2.jpg"),
    const Article(
        id: '2',
        title:
            "Lyft & Motional umumkan Ride-Hailing otonom Hyundai Ioniq 5 di LA",
        pubDate: "2022-11-19T02:53:34.000Z",
        description:
            "Lyft dan perusahaan teknologi tanpa pengemudi, Motional&nbsp;akan meluncurkan layanan ride-hailing tanpa pengemudi di Los Angeles, dengan menggunakan Hyundai Ioniq 5.\n&nbsp; Dikutip dari CarsCoops, Sabtu, kedua perusahaan ...",
        thumbnail:
            "https://img.antaranews.com/cache/800x533/2022/03/26/oto.jpg"),
    const Article(
        id: '3',
        title: "Google Maps punya fitur cari stasiun isi ulang EV",
        pubDate: "2022-11-19T02:45:39.000Z",
        description:
            "Seiring berkembangnya dunia elektrifikasi di industri otomotif, Google Maps menghadirkan fitur terbaru yang bisa digunakan pemilik kendaraan elektrik untuk mendapatkan informasi stasiun pengisian ulang terdekat dari lokasi ...",
        thumbnail:
            "https://img.antaranews.com/cache/800x533/2022/11/19/pexels-brett-jordan-5444631.jpg"),
    const Article(
      id: '4',
      title: "Stellantis tarik ratusan ribu truk RAM karena potensi terbakar",
      pubDate: "2022-11-19T01:33:03.000Z",
      description:
          "Produsen otomotif Stelantis, harus menarik kembali untuk perbaikan (recall) ribuan kendaraan truk RAM karena terdapat masalah pada bagian bagian mesin yang dapat menghasilkan panas berlebih sehingga dapat terjadi resiko ...",
      thumbnail:
          "https://img.antaranews.com/cache/800x533/2022/11/19/IMG-20221119-WA0001.jpg",
    ),
    const Article(
        id: '5',
        title: "Tokyo Motor Show ubah nama jadi Japan Mobility Show",
        pubDate: "2022-11-19T00:39:14.000Z",
        description:
            "Setelah rehat selama beberapa kali penyelenggaraan karena pandemi COVID-19, pameran otomotif Tokyo Motor Show (TMS) akan kembali digelar pada Oktober 2023 namun dengan nama baru yakni Japan Mobility Show. Dikutip dari ...",
        thumbnail:
            "https://img.antaranews.com/cache/800x533/2022/11/19/2023-Tokyo-Motor-Show-2.jpg"),
    const Article(
        id: '6',
        title: "Tampilan Citroen My Ami Buggy hingga manfaat bekal untuk anak",
        pubDate: "2022-11-18T23:31:03.000Z",
        description:
            "Pabrikan otomotif asal Prancis, Citroen dipastikan akan memasarkan mobil listrik bergaya mungilnya ke pasar Indonesia hingga manfaat memberikan bekal makanan kepada anak yang akan memberikan dampak positif terhadap aspek ...",
        thumbnail:
            "https://img.antaranews.com/cache/800x533/2022/11/18/WhatsApp-Image-2022-11-17-at-3.41.10-PM.jpeg"),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        pubDate,
        thumbnail,
      ];
}
