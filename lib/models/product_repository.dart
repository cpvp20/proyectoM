import 'package:proyectoM/models/play.dart';

enum ProductType { MOVIES, BOOKS, PLAYS }

class ProductRepository {
  static List<dynamic> loadProducts(ProductType prodType) {
    // ----------------------              ----------------------------//
    // ----------------------       Plays      ----------------------------//
    // ----------------------              ----------------------------//

    if (prodType == ProductType.PLAYS) {
      return <Play>[
        Play(
          title: "Wicked",
          description:
              "Wicked is a Broadway musical, with music and lyrics by Stephen Schwartz and book by Winnie Holzman. It is based on the 1995 Gregory Maguire novel Wicked: The Life and Times of the Wicked Witch of the West, itself a retelling of the classic 1900 novel, The Wonderful Wizard of Oz by L. Frank Baum and the 1939 Metro-Goldwyn-Mayer film The Wizard of Oz.",
          image:
              "http://www.thejeffersonchronicle.com/wp-content/uploads/2017/05/wicked.jpg",
          productRating: 100,
        ),
        Play(
          title: "Lion King",
          description:
              "The Lion King is a musical based on the 1994 Walt Disney Animation Studios' animated feature film of the same name with music by Elton John, lyrics by Tim Rice, and book by Roger Allers and Irene Mecchi, along with additional music and lyrics by Lebo M, Mark Mancina, Jay Rifkin, Julie Taymor, and Hans Zimmer.[1] Directed by Taymor, the musical features actors in animal costumes as well as giant, hollow puppets. ",
          image:
              "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0005/1618/brand.gif?itok=8WKWePuu",
          productRating: 90,
        ),
        Play(
          title: "Mamma Mia!",
          description:
              "Mamma Mia! (promoted as Benny Andersson & Björn Ulvaeus' Mamma Mia!) is a jukebox musical written by British playwright Catherine Johnson, based on the songs of ABBA composed by Benny Andersson and Björn Ulvaeus, former members of the band. The title of the musical is taken from the group's 1975 chart-topper Mamma Mia. Ulvaeus and Andersson, who composed the original music for ABBA, were involved in the development of the show from the beginning. Singer Anni-Frid Lyngstad was involved financially in the production and she was also present at many of the premieres around the world.",
          image:
              "https://stagea.blob.core.windows.net/images/show/1583/mamma-mia-xtutmgyi.bhx.jpg",
          productRating: 60,
        ),
      ];
    } else
      return [];
  }
}
