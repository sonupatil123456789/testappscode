class FlowScreenQueries {





  // static String loginScheema = '''
  //   query Login(\$password: String!, \$email: String!) {
  //     login(password: \$password, email: \$email) {
  //       ... on Result {
  //         success
  //         message
  //       }
  //     }
  //   }
  // ''';

  static String getAllLocation = '''
  query AllLocations {
  allLocations {
    _id
    location
  }
}
  ''';

  static String getAllQualifications = '''
  query AllQualifications {
  allQualifications {
    _id
    qualification
  }
}
''' ;


  static String getAllJobIndustries = '''
query AllIndustries {
  allIndustries {
    _id
    industry
    desc
  }
}
''' ;

  static String getAllDepartment = '''
query AllDomains {
  allDomains {
    _id
    domain
  }
}
''' ;

  static String getAllSubDepartment = '''
query AllSubDomains {
  allSubDomains {
    _id
    subDomain
    domain {
      _id
      domain
    }
  }
}
''' ;

  static String getSubDepartmentLength = '''
query MaxSubdomains {
  maxSubdomains
}
''' ;



  static String getAllSkills = '''
query AllSkills {
  allSkills {
    _id
    skill
  }
}
''' ;

static String getSkillsLength = '''
query MaxSkills {
  maxSkills
}
''' ;


  static String getAllDesignations = '''
query AllDesignations {
  allDesignations {
    _id
    designation
  }
}
''' ;
  static String getAllBenefits = '''
query AllBenefits {
  allBenefits {
    _id
    benefit
  }
}
''' ;




// query AllSkills {
//   allSkills {
//     _id
//     skill
//   }
// }

// query AllBenefits {
//   allBenefits {
//     _id
//     benefit
//   }
// }

// query AllDesignations {
//   allDesignations {
//     _id
//     designation
//   }
// }

// query MaxSkills {
//   maxSkills
// }








}