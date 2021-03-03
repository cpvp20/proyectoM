import 'package:proyectoM/models/play.dart';
import 'package:proyectoM/models/movie.dart';

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
    }

    // ----------------------              ----------------------------//
    // ----------------------       BOOKSs      ----------------------------//
    // ----------------------              ----------------------------//
    /*
    if (prodType == ProductType.BOOKS)
      return <Book>[
        Book(
          title: "The Midnight Library",
          description:
              " Imagine a library in which each book represents a different path your life could have taken. Now imagine spending eternity in that library. It’s a Goodreads kind of dream…",
          image:
              "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1602190253l/52578297.jpg",
        ),
        Book(
          title: "The Guest List",
          description:
              "Jules and Will have chosen to hold their wedding on a remote island off the coast of Ireland. Then the storm hits. Then the body is found. It’s like the old Irish adage: It’s not a party until somebody ends up dead.",
          image:
              "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1597345150l/54911607._SY475_.jpg",
        ),
        Book(
          title: "The Vanishing Half",
          description:
              "Bennett’s book traces fascinating threads of American identity and is our hands-down winner for the 2020 Historical Fiction award.",
          image:
              "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1577090827l/51791252._SX318_SY475_.jpg",
        ),
        Book(
          title: "A Life on Our Planet",
          description:
              "It provides a vision for the future in which, through collective action, we can still save Earth’s wild places. But we’ll have to act fast.",
          image:
              "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1608723131l/53916142._SY475_.jpg",
        ),
        Book(
          title: "Breath",
          description:
              "There is nothing more essential to our health and well-being than breathing: take air in, let it out, repeat twenty-five thousand times a day. Yet, as a species, humans have lost the ability to breathe correctly, with grave consequences.",
          image:
              "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1575339793l/48890486.jpg",
        ),
        Book(
          title: "How to Argue With a Racist",
          description:
              "Racist pseudoscience has become so commonplace that it can be hard to spot. But its toxic effects on society are plain to see—feeding white nationalism, fueling hatred, endangering lives, and corroding our discourse on everything from sports to intelligence. Even well-intentioned people repeat stereoty ...more",
          image:
              "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1576438164l/50734400._SY475_.jpg",
        ),
      ];

      */
    // ----------------------              ----------------------------//
    // ----------------------       Movies      ----------------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.MOVIES)
      return <Movie>[
        Movie(
          title: "Harry Potter and the Philosopher's Stone",
          description:
              "Harry Potter and the Philosopher's Stone (released in the United States and India as Harry Potter and the Sorcerer's Stone) is a 2001 fantasy film directed by Chris Columbus and distributed by Warner Bros. Pictures, based on J. K. Rowling's 1997 novel of the same name.",
          image:
              "https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_UX182_CR0,0,182,268_AL_.jpg",
          productRating: 99,
        ),
        Movie(
          title: "Harry Potter and the Chamber of Secrets",
          description:
              "Harry Potter and the Chamber of Secrets is a 2002 fantasy film directed by Chris Columbus and distributed by Warner Bros. Pictures, based on J. K. Rowling's 1998 novel of the same name. Produced by David Heyman and written by Steve Kloves, it is the sequel to Harry Potter and the Philosopher's Stone (2001) and the second instalment in the Harry Potter film series..",
          image:
              "https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_UX182_CR0,0,182,268_AL_.jpg",
          productRating: 99,
        ),
        Movie(
          title: "Harry Potter and the Prisoner of Azkaban",
          description:
              "Harry Potter and the Prisoner of Azkaban is a 2004 fantasy film directed by Alfonso Cuarón and distributed by Warner Bros. Pictures, based on J. K. Rowling's 1999 novel of the same name.",
          image:
              "https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg",
          productRating: 99,
        ),
        Movie(
          title: "Harry Potter and the Goblet of Fire",
          description:
              "Harry Potter and the Goblet of Fire is a 2005 fantasy film directed by Mike Newell and distributed by Warner Bros. Pictures, based on J. K. Rowling's 2000 novel of the same name.",
          image:
              "https://m.media-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_UX182_CR0,0,182,268_AL_.jpg",
          productRating: 99,
        ),
      ];
    return []; // otherwise empty list
  }
}
