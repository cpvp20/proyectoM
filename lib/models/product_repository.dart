import 'package:proyectoM/models/product_play.dart';
import 'package:proyectoM/models/product_movie.dart';
import 'package:proyectoM/models/product_book.dart';

enum ProductType { MOVIES, BOOKS, PLAYS }

class ProductRepository {
  static List<dynamic> loadProducts(ProductType prodType) {
    // ----------------------              ----------------------------//
    // ----------------------       Plays      ----------------------------//
    // ----------------------              ----------------------------//

    if (prodType == ProductType.PLAYS) {
      return <ProductPlay>[
        ProductPlay(
          productTitle: "Wicked",
          productDescription:
              "Wicked is a Broadway musical, with music and lyrics by Stephen Schwartz and book by Winnie Holzman. It is based on the 1995 Gregory Maguire novel Wicked: The Life and Times of the Wicked Witch of the West, itself a retelling of the classic 1900 novel, The Wonderful Wizard of Oz by L. Frank Baum and the 1939 Metro-Goldwyn-Mayer film The Wizard of Oz.",
          productImage:
              "http://www.thejeffersonchronicle.com/wp-content/uploads/2017/05/wicked.jpg",
          productRating: 100,
        ),
        ProductPlay(
          productTitle: "Wicked",
          productDescription:
              "Wicked is a Broadway musical, with music and lyrics by Stephen Schwartz and book by Winnie Holzman. It is based on the 1995 Gregory Maguire novel Wicked: The Life and Times of the Wicked Witch of the West, itself a retelling of the classic 1900 novel, The Wonderful Wizard of Oz by L. Frank Baum and the 1939 Metro-Goldwyn-Mayer film The Wizard of Oz.",
          productImage:
              "http://www.thejeffersonchronicle.com/wp-content/uploads/2017/05/wicked.jpg",
          productRating: 100,
        ),
        ProductPlay(
          productTitle: "Wicked",
          productDescription:
              "Wicked is a Broadway musical, with music and lyrics by Stephen Schwartz and book by Winnie Holzman. It is based on the 1995 Gregory Maguire novel Wicked: The Life and Times of the Wicked Witch of the West, itself a retelling of the classic 1900 novel, The Wonderful Wizard of Oz by L. Frank Baum and the 1939 Metro-Goldwyn-Mayer film The Wizard of Oz.",
          productImage:
              "http://www.thejeffersonchronicle.com/wp-content/uploads/2017/05/wicked.jpg",
          productRating: 100,
        ),
        ProductPlay(
          productTitle: "Wicked",
          productDescription:
              "Wicked is a Broadway musical, with music and lyrics by Stephen Schwartz and book by Winnie Holzman. It is based on the 1995 Gregory Maguire novel Wicked: The Life and Times of the Wicked Witch of the West, itself a retelling of the classic 1900 novel, The Wonderful Wizard of Oz by L. Frank Baum and the 1939 Metro-Goldwyn-Mayer film The Wizard of Oz.",
          productImage:
              "http://www.thejeffersonchronicle.com/wp-content/uploads/2017/05/wicked.jpg",
          productRating: 100,
        ),
      ];
    }

    // ----------------------              ----------------------------//
    // ----------------------       BOOKSs      ----------------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.BOOKS)
      return <ProductBook>[
        ProductBook(
          productTitle: "Lavazza",
          productDescription: "Endulzado con aromas florales.",
          productImage:
              "https://www.lavazza.it/content/dam/lavazza/products/caffe/macinato/moka/qualitaoro/new_render/tin_250_en/Tin-oro-en-250-thumb.png",
          productRating: 97.0,
        ),
        ProductBook(
          productTitle: "Lavazza",
          productDescription: "Endulzado con aromas florales.",
          productImage:
              "https://www.lavazza.it/content/dam/lavazza/products/caffe/macinato/moka/qualitaoro/new_render/tin_250_en/Tin-oro-en-250-thumb.png",
          productRating: 97.0,
        ),
        ProductBook(
          productTitle: "La Mexicana",
          productDescription:
              "Es un café único por la manera en la que están tostados sus BOOKSs.",
          productImage:
              "https://www.lamexicana.es/404-large_default/cafe-1890-mezcla-suave.jpg",
          productRating: 97.0,
        ),
      ];
    // ----------------------              ----------------------------//
    // ----------------------       Bebida caliente      ----------------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.MOVIES)
      return <ProductMovie>[
        ProductMovie(
          productTitle: "Harry Potter and the Philosopher's Stone",
          productDescription:
              "Harry Potter and the Philosopher's Stone (released in the United States and India as Harry Potter and the Sorcerer's Stone) is a 2001 fantasy film directed by Chris Columbus and distributed by Warner Bros. Pictures, based on J. K. Rowling's 1997 novel of the same name.",
          productImage:
              "https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_UX182_CR0,0,182,268_AL_.jpg",
          productRating: 99,
        ),
        ProductMovie(
          productTitle: "Harry Potter and the Chamber of Secrets",
          productDescription:
              "Harry Potter and the Chamber of Secrets is a 2002 fantasy film directed by Chris Columbus and distributed by Warner Bros. Pictures, based on J. K. Rowling's 1998 novel of the same name. Produced by David Heyman and written by Steve Kloves, it is the sequel to Harry Potter and the Philosopher's Stone (2001) and the second instalment in the Harry Potter film series..",
          productImage:
              "https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_UX182_CR0,0,182,268_AL_.jpg",
          productRating: 99,
        ),
        ProductMovie(
          productTitle: "Harry Potter and the Prisoner of Azkaban",
          productDescription:
              "Harry Potter and the Prisoner of Azkaban is a 2004 fantasy film directed by Alfonso Cuarón and distributed by Warner Bros. Pictures, based on J. K. Rowling's 1999 novel of the same name.",
          productImage:
              "https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg",
          productRating: 99,
        ),
        ProductMovie(
          productTitle: "Harry Potter and the Goblet of Fire",
          productDescription:
              "Harry Potter and the Goblet of Fire is a 2005 fantasy film directed by Mike Newell and distributed by Warner Bros. Pictures, based on J. K. Rowling's 2000 novel of the same name.",
          productImage:
              "https://m.media-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_UX182_CR0,0,182,268_AL_.jpg",
          productRating: 99,
        ),
      ];
    return []; // otherwise empty list
  }
}
