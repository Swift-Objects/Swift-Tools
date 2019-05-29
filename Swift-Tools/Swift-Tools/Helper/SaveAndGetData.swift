//
//  SaveAndGetData.swift
//  Swift-Tools
//
//  Created by lemo on 2019/5/29.
//  Copyright © 2019 wangli. All rights reserved.
//  存储获取数据

import Foundation

class SaveAndGetData: NSObject {
    static var share = SaveAndGetData()
    
    
}

/*
if SaveAndGetData.share.saveJsonString(content: "o我也保障房", fileName: "wang.json") {
    print("存储成功")
}
 
 
print(SaveAndGetData.share.getJsonString(fileName: "wang.json"))
*/

// plist 文件的存取
extension SaveAndGetData {
    // 存储 plist 文件到内存
    func savePropertyListData(content: NSArray, plistFileName name: String) -> Bool? {
        let filePath = documentPath + "/" + name
        print(filePath)
        let url = URL(fileURLWithPath: filePath)
        if FileManager.default.fileExists(atPath: filePath) {
            return content.write(to: url, atomically: true)
        } else {
            FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
            return content.write(to: url, atomically: true)
        }
    }
    
    // 从内存中获取 plist 文件
    func getPropertyListData(plistFileName name: String) -> NSArray? {
        let filePath = documentPath + "/" + name
        print(filePath)
        let url = URL(fileURLWithPath: filePath)
        if FileManager.default.fileExists(atPath: filePath) {
            return NSArray(contentsOf: url)
        }
        return nil
    }
    
    // 读取 bundle 里面的 plist 文件
    func readPlistFileFromBundle(plistFileName name: String) -> NSArray? {
        if let filePath = Bundle.main.path(forResource: name, ofType: "plist") {
            return NSArray(contentsOfFile: filePath)
        }
        return nil
    }
}


// 存取 json 字符串
extension SaveAndGetData {
    // 存储
    func saveJsonString(content: String, fileName name: String) -> Bool {
        let filePath = documentPath + "/" + name
        print(filePath)
        let url = URL(fileURLWithPath: filePath)
        let data = content.data(using: .utf8)
        do {
            try data?.write(to: url)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    // 获取
    func getJsonString(fileName name: String) -> String? {
        let filePath = documentPath + "/" + name
        print(filePath)
        if FileManager.default.fileExists(atPath: filePath) {
            do {
                let content = try String(contentsOf: URL(fileURLWithPath: filePath))
                return content
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
