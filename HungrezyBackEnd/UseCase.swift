//
//  UseCase.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 05/04/23.
//

import Foundation

open class Request {
    public var qos: DispatchQoS.QoSClass = .utility
    public var id: String?
    
    public init(id: String) {
        self.id = id
    }
    
    public init() {
        
    }
}

open class Response {
    enum Status {
        case success
        case networkUnavailable
        case timeout
        case authenticationFailure
        case unknownError
    }
    
    var status: Status
    
    public init() {
        self.status = .success
    }
}

open class Error {
    public enum Status {
        case networkUnavailable
        case timeout
        case authenticationFailure
        case unknownError
    }
    
    var status: Status
    
    public init(status: Status) {
        self.status = status
    }
}

struct UsecaseQueue {
    static let queue: DispatchQueue = DispatchQueue(label: Bundle.main.bundleIdentifier!, attributes: .concurrent)
}

open class UseCase<CustomRequest: Request, CustomResponse: Response, CustomError: Error>: NSObject {
    
    public final func execute(request: CustomRequest, onSuccess success: @escaping (_ response: CustomResponse) -> Void = { _ in } , onFailure failure: @escaping (_ error: CustomError) -> Void = { _ in } ) {
        UsecaseQueue.queue.async { [weak self] in
            self?.run(request: request, success: success, failure: failure)
        }
    }
    
    open func run(request: CustomRequest, success: @escaping (_ response: CustomResponse) -> Void , failure: @escaping (_ error: CustomError) -> Void) {
        
    }
    
    public final func invokeSuccess(callback:@escaping (_ response: CustomResponse) -> Void, response: CustomResponse) {
        if Thread.isMainThread {
            callback(response)
        } else {
            DispatchQueue.main.async(execute: {
                callback(response)
            })
        }
    }
    
    public final func invokeFailure(callback:@escaping (_ failure: CustomError) -> Void, failure: CustomError) {
        if Thread.isMainThread {
            callback(failure)
        } else {
            DispatchQueue.main.async(execute: {
                callback(failure)
            })
        }
        
    }
    
    deinit {
        
    }
}
