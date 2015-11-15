import Result
import Argo
import Swish

let APIPath = "https://formkeep.com/"
private let baseURL = NSURL(string: APIPath)!

func baseRequest(endpoint endpoint: String, method: RequestMethod = .GET) -> NSMutableURLRequest {
    let url = NSURL(string: endpoint, relativeToURL: baseURL)!
    let request = NSMutableURLRequest(URL: url)
    request.HTTPMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("gzip;q=1.0,compress;q=0.5", forHTTPHeaderField: "Accept-Encoding")
    
    return request
}

struct LoginRequest: Request {
    typealias ResponseType = CurrentUser
    
    let email: String
    let password: String
    
    func build() -> NSURLRequest {
        let endpoint = "api/auth"
        let request = baseRequest(endpoint: endpoint, method: .POST)
        request.jsonPayload = ["email": email, "password": password]
        
        return request
    }
}
