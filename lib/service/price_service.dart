import 'package:time_co_shoots_price/data/local_model/photo_printing.dart';
import 'package:time_co_shoots_price/data/local_model/wedding_formula.dart';

class PriceService {
  List<WeddingFormula> getListWeedingType() {
    return [
      WeddingFormula(1, "Just Married",
          commentary:
              "Comprend l'intégralité des clichés numériques et clichés retouchés",
          price: 350,
          events: [
            WeddingEvent(2, "ceremony",
                description: "Cérémonie",
                pathIcon: "assets/images/diamond.png"),
            WeddingEvent(3, "wine",
                description: "Vin d'honneur",
                pathIcon: "assets/images/cheers.png"),
            WeddingEvent(5, "photo",
                description: "Photo de groupe/couple",
                pathIcon: "assets/images/camera.png"),
          ]),
      WeddingFormula(
        2,
        "Emotions",
        commentary:
            "Comprend l'intégralité des clichés numériques et clichés retouchés",
        price: 500,
        events: [
          WeddingEvent(1, "preparation",
              description: "Préparatif",
              pathIcon: "assets/images/high-heels.png"),
          WeddingEvent(2, "ceremony",
              description: "Cérémonie", pathIcon: "assets/images/diamond.png"),
          WeddingEvent(3, "wine",
              description: "Vin d'honneur",
              pathIcon: "assets/images/cheers.png"),
          WeddingEvent(5, "photo",
              description: "Photo de groupe/couple",
              pathIcon: "assets/images/camera.png"),
        ],
      ),
      WeddingFormula(
        3,
        "Passion",
        commentary:
            "Comprend l'intégralité des clichés numériques et clichés retouchés",
        price: 600,
        events: [
          WeddingEvent(2, "ceremony",
              description: "Cérémonie", pathIcon: "assets/images/diamond.png"),
          WeddingEvent(3, "wine",
              description: "Vin d'honneur",
              pathIcon: "assets/images/cheers.png"),
          WeddingEvent(4, "cake",
              description: "Soirée (jusqu'au gâteau)",
              pathIcon: "assets/images/wedding-cake.png"),
          WeddingEvent(5, "photo",
              description: "Photo de groupe/couple",
              pathIcon: "assets/images/camera.png"),
        ],
      ),
      WeddingFormula(4, "L'integral",
          commentary:
              "Comprend l'intégralité des clichés numériques et clichés retouchés",
          price: 750,
          events: [
            WeddingEvent(1, "preparation",
                description: "Préparatif",
                pathIcon: "assets/images/high-heels.png"),
            WeddingEvent(2, "ceremony",
                description: "Cérémonie",
                pathIcon: "assets/images/diamond.png"),
            WeddingEvent(3, "wine",
                description: "Vin d'honneur",
                pathIcon: "assets/images/cheers.png"),
            WeddingEvent(4, "cake",
                description: "Soirée (jusqu'au gâteau)",
                pathIcon: "assets/images/wedding-cake.png"),
            WeddingEvent(5, "photo",
                description: "Photo de groupe/couple",
                pathIcon: "assets/images/camera.png"),
          ]),
      WeddingFormula(5, "L'integral plus",
          extra: "Album photo paysage ou portrait 20x30cm 50 pages",
          commentary:
              "Comprend l'intégralité des clichés numériques et clichés retouchés",
          price: 850,
          events: [
            WeddingEvent(1, "preparation",
                description: "Préparatif",
                pathIcon: "assets/images/high-heels.png"),
            WeddingEvent(2, "ceremony",
                description: "Cérémonie",
                pathIcon: "assets/images/diamond.png"),
            WeddingEvent(3, "wine",
                description: "Vin d'honneur",
                pathIcon: "assets/images/cheers.png"),
            WeddingEvent(4, "cake",
                description: "Soirée (jusqu'au gâteau)",
                pathIcon: "assets/images/wedding-cake.png"),
            WeddingEvent(5, "photo",
                description: "Photo de groupe/couple",
                pathIcon: "assets/images/camera.png"),
          ]),
    ];
  }

  List<PhotoSize> getListPhotoSize() {
    return [
      PhotoSize(1, "10x15", 0.22),
      PhotoSize(1, "20x30", 1.11),
      PhotoSize(1, "21x30", 1.11),
      PhotoSize(1, "24x30", 1.11),
      PhotoSize(1, "30x40", 3.31),
      PhotoSize(1, "30x45", 3.31),
    ];
  }

  List<PhotoPrinting> getListPhotoPrinting() {
    return [
      PhotoPrinting(1, "Tirage photo", sizes: [
        PhotoSize(1, "10x15", 0.22),
        PhotoSize(1, "20x30", 1.11),
        PhotoSize(1, "21x30", 1.11),
        PhotoSize(1, "24x30", 1.11),
        PhotoSize(1, "30x40", 3.31),
        PhotoSize(1, "30x45", 3.31),
      ]),
      PhotoPrinting(1, "Impression sur Aluminium", sizes: [
        PhotoSize(1, "30x45", 50),
        PhotoSize(1, "60x40", 75),
        PhotoSize(1, "90x60", 130),
      ]),
      PhotoPrinting(1, "Toile", sizes: [
        PhotoSize(1, "30x45", 60),
        PhotoSize(1, "60x40", 70),
        PhotoSize(1, "90x60", 105),
        PhotoSize(1, "80x120", 140),
      ]),
      PhotoPrinting(1, "Acrylglas (Verre acrylique)", sizes: [
        PhotoSize(1, "20x30", 55),
        PhotoSize(1, "30x45", 75),
        PhotoSize(1, "60x40", 105),
        PhotoSize(1, "80x130", 130),
      ]),
      PhotoPrinting(1, "Photo encadrée", sizes: [
        PhotoSize(1, "20x30", 55),
        PhotoSize(1, "30x30", 65),
        PhotoSize(1, "40x45", 75),
        PhotoSize(1, "60x40", 95),
      ])
    ];
  }
}
