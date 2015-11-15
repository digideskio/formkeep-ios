import Argo
import Curry

func currentlyAuthenticated() -> Bool {
    let currentUser = CurrentUser.read()
    return currentUser.value != nil
}

struct CurrentUser {
    let email: String
    let auth_token: String
}

extension CurrentUser: Decodable {
    static func decode(j: JSON) -> Decoded<CurrentUser> {
        return curry(CurrentUser.init)
            <^> j <| "email"
            <*> j <| "auth_token"
    }
}

extension CurrentUser : SecureItem {
    static var key: String {
        return "CurrentUser"
    }
    
    init?(data: AnyObject) {
        let user = CurrentUser.decode(.parse(data))
        switch user {
        case let .Success(u):
            email = u.email
            auth_token = u.auth_token
        case .Failure:
            return nil
        }
    }
}

