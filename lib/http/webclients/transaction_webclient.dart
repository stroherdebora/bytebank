import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(Uri.http('192.168.13.122:8080', 'transactions'));

    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
  }

  Future<Transaction?> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response? response = await client.post(Uri.http('192.168.13.122:8080', 'transactions'),
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response!.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    _throwHttpError(response.statusCode);
    return Transaction.fromJson(jsonDecode(response.body));
  }

  void _throwHttpError(int statusCode) {
    throw Exception(_statusCodeResponses[statusCode]);
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submiting transaction',
    401: 'authentication failed',
  };
}
