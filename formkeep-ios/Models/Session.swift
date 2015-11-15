import Argo
import Curry

struct Session {
    let email: String
    let password: String
}

extension Session: Decodable {
    static func decode(j: JSON) -> Decoded<Session> {
        return curry(Session.init)
            <^> j <| "email"
            <*> j <| "password"
    }
}