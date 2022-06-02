class ApiConst {
  static const apiUrl =
      'https://us-central1-ss-devops.cloudfunctions.net/GraphQL';

  static const queryFavoriteBooks = r"""
    query FavoriteBooks {
      favoriteBooks {
        name 
        author {
          name
        }
        cover
    }
  }""";

  static const queryAllBooks = r"""
    query AllBooks {
      allBooks{
  	    name
        cover
        author{
          name
        }
	    }
    }""";

  static const queryFavoriteAuthors = r"""
    query FavoriteAuthors  {
      favoriteAuthors{
        name
        booksCount
        picture   
      }
    }""";

  static String queryBookById(int id) => r"""
    query BookById {
      book(id: 1){
        name
        author{
          name
        }
        description
      }
    }""";
}
