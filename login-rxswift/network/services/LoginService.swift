//
//  LoginViewController.swift
//  login-rxswift
//
//  Created by Vitor Makoto on 3/27/17.
//  Copyright © 2017 Work&Co. All rights reserved.
//

import Foundation
import Moya

enum LoginService {
    case loginWithEmail(email: String, password: String)
}

extension LoginService: TargetType {
    var baseURL: URL {
        guard let url = URL(string:
            "http://ec2-54-94-187-107.sa-east-1.compute.amazonaws.com") else {
                assertionFailure("Unable to initialize login service URL")
                return URL.emptyURL()
        }

        return url
    }

    var path: String {
        switch self {
        case .loginWithEmail:
            return "/login/email"
        }
    }

    var method: Moya.Method {
        switch self {
        case .loginWithEmail:
            return .post
        }
    }

    var parameters: [String : Any]? {
        switch self {
        case .loginWithEmail(let email, let password):
            return ["email": email, "password": password]
        }
    }

    var task: Task {
        return .request
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var sampleData: Data {
        return Data()
    }
}
