class AuthScheema {
  static String loginScheema = '''
    query Login(\$password: String!, \$email: String!) {
      login(password: \$password, email: \$email) {
        ... on Result {
          success
          message
        }
      }
    }
  ''';

  static String authanticateUser = '''
  query MeQuery {
    me {
        firstName
    }
}
  ''';
}
