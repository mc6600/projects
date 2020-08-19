import Foundation

class FBUser {
    
    var lastName: String
    var fisrtName: String
    var loginId: String
    var privilege: String
    
    init( firstName: String,
        lastName: String,
        loginId: String,
        privilege: String
    ) {
        self.fisrtName = firstName
        self.lastName = lastName
        self.loginId = loginId
        self.privilege = privilege
    }
}
