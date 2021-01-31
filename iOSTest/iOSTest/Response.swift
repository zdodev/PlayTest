//
//  Response.swift
//  iOSTest
//
//  Created by Zero DotOne on 2021/01/31.
//

import Foundation

enum RequestType {
    case data
    case download
    case upload
}

enum ResponseType {
    case json
    case file
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

typealias RequestHeaders = [String: String]
typealias RequestParameters = [String: Any?]
typealias ProgressHandler = (Float) -> Void

protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var headers: RequestHeaders? { get }
    var parameters: RequestParameters { get }
    var requestType: RequestType { get }
    var responseType: ResponseType { get }
    var progressHandler: ProgressHandler? { get }
}

protocol EnvironmentProtocol {
    var headers: RequestHeaders? { get }
    var baseURL: String { get }
}

enum APIEnvironment: EnvironmentProtocol {
    case development
    case production
    
    var headers: RequestHeaders? {
        switch self {
        case .development:
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer yourBearerToken"
            ]
        case .production:
            return [:]
        }
    }
    
    var baseURL: String {
        switch self {
        case .development:
            return "http://api.localhost:3000/v1/"
        case .production:
            return "https://api.yourapp.com/v1/"
        }
    }
}

protocol NetworkSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask?
    
    func downloadTask(request: URLRequest, progressHandler: ProgressHandler?, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask?
    
    func uploadTask(with request: URLRequest, from fileURL: URL, progressHandler: ProgressHandler?, completion: @escaping (Data?, URLResponse?, Error?)-> Void) -> URLSessionUploadTask?
}

class APINetworkSession: NSObject {
    var session: URLSession!
    private typealias ProgressAndCompletionHandlers = (progress: ProgressHandler?, completion: ((URL?, URLResponse?, Error?) -> Void)?)
    private var taskToHandlerMap: [URLSessionTask: ProgressAndCompletionHandlers] = [:]
    
    public override convenience init() {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 30
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3
        queue.qualityOfService = .userInitiated
        
        self.init(configuration: sessionConfiguration, delegateQueue: queue)
    }
    
    init(configuration: URLSessionConfiguration, delegateQueue: OperationQueue) {
        super.init()
//        self.session = URLSession(configuration: configuration, delegate: self, delegateQueue: delegateQueue)
        self.session = URLSession(configuration: configuration, delegate: nil, delegateQueue: delegateQueue)
    }
    
    deinit {
        // We have to invalidate the session becasue URLSession strongly retains its delegate. https://developer.apple.com/documentation/foundation/urlsession/1411538-invalidateandcancel
        session.invalidateAndCancel()
        session = nil
    }
}
