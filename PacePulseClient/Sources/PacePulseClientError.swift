//
//  PacePulseClientError.swift
//  PacePulseClient
//
//  Created by hyukmac on 6/6/25.
//

import Foundation

public enum PacePulseClientError: Error {
    case signUpEmailError
    case signInEmailError
}

extension PacePulseClientError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .signUpEmailError:
            return "PacePulse sign up email error"
        case .signInEmailError:
            return "PacePulse sign in email error"
        }
    }
}
