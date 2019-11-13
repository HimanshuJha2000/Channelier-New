////
////  Api.swift
////  PCEX
////
////  Created by CHHAGAN on 15/03/19.
////  Copyright © 2019 Chhagan SIngh. All rights reserved.
////
//
//import Foundation
//
//
//class Api {
//
//    static let base = APP_BASE_URL
//
//    public enum Endpoints {
//        case login(username:String, password:String)
//
//        case getBanks
//        case Balances
//        case switchParent
//
//
//        public var method: HTTPMethod {
//            switch self {
//            case .login:
//                return .post
//            case .getBanks:
//                return.post
//            case .Balances:
//                return .post
//            case .switchParent:
//              return .post
//
//            }
//        }
//
//        public var path: String {
//            switch self {
//            case .login:
//                return "sandeeppvec@gmail.com"
//            case .getBanks:
//                return "/wallet/getBanksOfSpecificUser"
//            case .Balances:
//                return "/v1/balances"
////            case .TradeHistory(let symbol, _, _, _):
////                return "/v1/trades/\(symbol)"
//            case .switchParent:
//                return "hello"
//            }
//        }
//
//        public var url: String {
//
//             let urlconcat = "\(base)\(self.path)"
//           // let urlconcat = "\(base)\("api2")\(self.path)"
//
//            // testing server
//            //let urlconcat = "\(testingServer)\(self.path)"
//            //let urlconcat = "\(base)\("api1")\(self.path)"
//            print("URL xxxx ",urlconcat)
//            return urlconcat
//        }
//
//        public var parameters: [String : Any] {
//            switch self {
//            case .login(let username):
//                return ["username":username]
//            case .getBanks:
//                return ["userId":userId,"sessionId":sessionId,"fastSessionId":fastSessionId]
//
////            case .TradeHistory(_, let since, let limit, let breaks):
////                return ["include_breaks": String(breaks ?? false), "limit_trades": limit ?? 50, "timestamp": since * 1000]
//            default:
//                return [:]
//            }
//        }
//
////        public var headers: HTTPHeaders {
////            switch self {
////            case .Balances:
////                return createHeaders(request: self.path)
//////            case .getPendingOrders:
//////                return createHeaders(request: self.path)
////            default:
////                return [:]
////            }
////        }
//
//    }
//
//
//    /**
//     Create HTTP Headers for a gemini request
//
//     - parameter request: the path, ex: "/v1/order/status", of the request.
//     - parameter additionalData: the additional payload data requested by the API
//
//     - returns: the http headers for the request
//     */
////    private static func createHeaders(request: String, withAdditionalData additionalData: JSON? = nil) -> HTTPHeaders {
////
////        var payload = additionalData ?? JSON()
////        let nonce = Int64(Date().timeIntervalSince1970 * 1000)
////        payload["request"] = JSON(request)
////        payload["nonce"]  = JSON(String(nonce))
////        // let payloadb64 = payload.serialize().toBase64()
////
////        var headers: [String: String] = [:]
////        headers["Content-Type"] = "application/x-www-form-urlencoded"
////
////        headers["Cache-Control"] = "no-cache"
////
////        return headers
////    }
////
//    /**
//     Make a request to the gemini API
//
//     - parameter endpoint: the API endpoint
//     - parameter completionHandler: the function to handle the JSON response from the API
//     */
//    public static func request(endpoint: Api.Endpoints, completionHandler: @escaping (JSON) -> Void) {
//        // KRProgressHUD.show(withMessage: "Loading...")
//        let manager = Alamofire.SessionManager.default
//
//        manager.request(endpoint.url, method: endpoint.method, parameters: endpoint.parameters, encoding: JSONEncoding.default, headers: endpoint.headers).responseJSON { (response) in
//            print("params for request",endpoint.parameters)
//            KRProgressHUD.dismiss()
//            print(response.request?.url ?? "na")
//            if (response.result.value != nil) {
//                completionHandler(JSON(response.result.value!))
//            } else {
//                if (response.result.error != nil) {
//
//                    print(response.result.error!) // known error
//                } else {
//                    print("Unkown error") // unkown error
//                }
//            }
//        }
//    }
//
//
//}
//
//
//extension JSON {
//
//    // serialize the json into a standard JSON string
//    func serialize() -> String {
//        let s0: String = self.rawString() ?? ""
//        let s1: String = s0.replacingOccurrences(of: "\\/", with: "/")
//        return s1
//    }
//
//}
//
//
//extension String {
//
//    // appends the <path> with slashes before and after it, if not already present
//    mutating func appendPath(path: String) {
//        self.append((self.last == "/" || path.first == "/" ? "":"/") + path + (path.last == "/" ? "" : "/"))
//    }
//
//}
//
