import Swish
import Nocilla

extension LSStubRequestDSL {
    func with(json: JSONFixture) -> LSStubResponseDSL {
        let json = loadJSONFixture(json.rawValue)
        return self
            .andReturn(200)
            .withBody(json)
    }
}

func stub<T: Request>(request: T) -> LSStubRequestDSL {
    let req = request.build()
    return stubRequest(req.HTTPMethod, req.URL!.absoluteString)
        .withHeaders(req.allHTTPHeaderFields)
        .withBody(req.HTTPBody)
}