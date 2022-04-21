import 'package:time_co_shoots_price/data/local_model/photo_printing_format.dart';
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

  List<PhotoPrintingFormat> getListPhotoPrinting(){
    return [
      PhotoPrintingFormat(1,format: "10x15",price: 0.22),
      PhotoPrintingFormat(1,format: "20x30",price: 1.11),
      PhotoPrintingFormat(1,format: "21x30",price: 1.11),
      PhotoPrintingFormat(1,format: "24x30",price: 1.11),
      PhotoPrintingFormat(1,format: "30x40",price: 3.31),
      PhotoPrintingFormat(1,format: "30x45",price: 3.31),
    ];
  }
}
