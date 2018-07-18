//
//  BQSHTTPManager.swift
//  FaceStore-Swift
//
//  Created by lemo on 2018/4/20.
//  Copyright © 2018年 wangli. All rights reserved.
//  网络请求

import UIKit
import Alamofire


class BQSHTTPManager {
    //单例
    let mainPath = "http://bq.pingpingapp.com/"
    let header: HTTPHeaders = ["APP-KEY": "gVTXMOWz"]
    
    static let shared = BQSHTTPManager()
    private init() {}
    
    //GET-请求
    func getRequestWithURL(path: String, parameter: [String: Any], success: @escaping(_ result: [String: Any]) -> Void, failure: @escaping(_ error: NSError) -> Void) -> Void {
        let urlString = mainPath + path
//        let header: HTTPHeaders = ["APP-KEY": "gVTXMOWz"]
        Alamofire.request(urlString, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: header).responseJSON { (responseData) in
            if responseData.error != nil {
                failure(responseData.error! as NSError)
            }
            if let json = responseData.result.value {
                success(json as! [String: Any])
            }
            return
        }
        
    }
    
    //POST-请求
    func postRequestWithURL(path: String, parameter: [String: Any], success: @escaping(_ result: String) -> Void, failure: @escaping(_ error: NSError) ->Void) -> Void {
        let urlString = mainPath + path
//        let header: HTTPHeaders = ["APP-KEY": "Ir0qH2Zh"]
        Alamofire.request(urlString, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: header).responseJSON { (responseData) in
            if responseData.error != nil {
                failure(responseData.error! as NSError)
            }
            if let json = responseData.result.value {
                let jsonString = self.getJSONStringFromDictionary(dictionary: json as! NSDictionary)
                
                success(jsonString)
            }
            return
        }
    }
    
    //排序-请求-参数是数组类型的
    func sortRequestWithURL(path: String, parameter: [Any], success: @escaping(_ result: String) -> Void, failure: @escaping(_ error: NSError) ->Void) -> Void {
        //通知后台排序
        let url = URL(string: mainPath + path)!
//        let header: HTTPHeaders = ["APP-KEY": "Ir0qH2Zh"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameter)
        request.allHTTPHeaderFields = header
        Alamofire.request(request)
            .responseJSON { responseData in
                if responseData.error != nil {
                    failure(responseData.error! as NSError)
                }
                if let json = responseData.result.value {
                    let jsonString = self.getJSONStringFromDictionary(dictionary: json as! NSDictionary)
                    
                    success(jsonString)
                }
                return
        }
        
    }
    
    
    
    
    //删除收藏图片
    func postDeleteImageRequestWithURL(path: String, parameter: [String: Any], success: @escaping(_ result: String) -> Void, failure: @escaping(_ error: NSError) ->Void) -> Void {
        let urlString = mainPath + path
//        let header: HTTPHeaders = ["APP-KEY": "Ir0qH2Zh"]
        
        Alamofire.request(urlString, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) in
            
            
            if responseData.error != nil {
                failure(responseData.error! as NSError)
            }
            if let json = responseData.result.value {
                let jsonString = self.getJSONStringFromDictionary(dictionary: json as! NSDictionary)
                
                success(jsonString)
            }
            return
        }
    }
    
    /**
     字典转换为JSONString
     */
    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try! JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    
    
    func downloadFile(filePath: String, fileName:String) {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileNames = fileName.components(separatedBy: "/")
            let name = fileNames.last
            documentsURL.appendPathComponent(name!)
            return (documentsURL, [.removePreviousFile])
        }
        let url = URL(string: filePath)
        
        Alamofire.download(url!, to: destination).downloadProgress(closure: { (progress) in
            print("progress:\(progress.fractionCompleted)")
        }).responseData { response in
            if let destinationUrl = response.destinationURL {
                print("destinationUrl \(destinationUrl.absoluteURL)")
            }
        }
    }
    //下载zip文件
    func downloadZipFile(filePath: String, fileName: String, progressCall: @escaping (_ progress:Float) -> Void) -> Void {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileNames = fileName.components(separatedBy: "/")
            let name = "\(UserId)/" + fileNames.last!
            documentsURL.appendPathComponent(name)
            return (documentsURL, [.removePreviousFile])
        }
        let url = URL(string: filePath)
        
        Alamofire.download(url!, to: destination).downloadProgress(closure: { (progress) in
            //            print("progress1:\(progress.fractionCompleted)")
            progressCall(Float(progress.fractionCompleted))
        }).responseData { response in
            if let destinationUrl = response.destinationURL {
                print("destinationUrl \(destinationUrl.absoluteURL)")
            }
        }
    }
    
    
    /*
     - (NSDictionary *)transitionDictionaryToStringWithParameter:(NSDictionary *)parameter{
     NSMutableDictionary * dictionary = [NSMutableDictionary dictionaryWithDictionary:parameter];
     NSArray * keyArray = [parameter allKeys];
     for (NSString * key in keyArray) {
     id value = parameter[key];
     if ([value isKindOfClass:[NSDictionary class]]) {
     NSDictionary * dic = (NSDictionary *)value;
     NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
     NSString * valueString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
     [dictionary setObject:valueString forKey:key];
     }
     }
     return dictionary;
     }
     */
    
    //    func transitionDictionaryToStringWithParameter(parameter: [String: Any]) -> [String: Any] {
    //        var dictionary = Dictionary<String, Any>()
    //
    //        let keyArray = parameter.keys
    //        for key in keyArray {
    //            let value = parameter[key]
    //            if value is Dictionary<String, Any> {
    //                let value1 = value as? Dictionary<String, Any>
    //                do {
    //                    let jsonData = try JSONSerialization.data(withJSONObject: value1, options: .prettyPrinted)
    //                    let valueString = try String(describing: jsonData .encode(to: UTF8() as! Encoder))
    //                    dictionary[key] = valueString
    //                } catch {
    //
    //                }
    //
    //            }
    //        }
    //        return dictionary
    //
    //    }
    
}

