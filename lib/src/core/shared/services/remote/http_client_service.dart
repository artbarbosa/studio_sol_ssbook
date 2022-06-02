import 'package:graphql/client.dart';

abstract class IHttpClientService {
  Future<QueryResult<TParsed>> query<TParsed>(QueryOptions<TParsed> options);
}
