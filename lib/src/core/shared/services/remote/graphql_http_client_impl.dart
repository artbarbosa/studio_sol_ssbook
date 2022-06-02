import 'package:graphql/client.dart';

import '../../failures/failures.dart';
import 'http_client_service.dart';

class GraphqlHttpClientServiceImp implements IHttpClientService {
  final GraphQLClient _client;

  GraphqlHttpClientServiceImp(this._client);

  @override
  Future<QueryResult<TParsed>> query<TParsed>(QueryOptions<TParsed> options) {
    try {
      return _client.query<TParsed>(options);
    } catch (error, stackTrace) {
      throw GraphqlHttpClientError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
