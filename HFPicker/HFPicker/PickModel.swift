//
//  PickModel.swift
//  琴加
//
//  Created by 韩艳锋 on 2017/11/22.
//  Copyright © 2017年 韩艳锋. All rights reserved.
//

import UIKit

protocol PickModelProtocol: NSObjectProtocol {
    var showIdStr: [String] { get }
}

class PickModel<Element>: NSObject where Element: PickModelProtocol {
    
    private var containData: [PickModelModel] = []
    
    
    /// 当前各列滑动到的行数（从0开始）
    public var currentIndex: [Int] = []
    
    ///  当前对应的值
    public var currentValue: Element!{
        get{
            var dataModel = PickModelModel(showValuee: "")
            dataModel.lastValues = containData
            for index in currentIndex {
                dataModel = dataModel.lastValues[index]
            }
            return dataModel.value as! Element
        }
    }
    
    /// 当前列的数据的数组
    public var currentColAndRowStrArr: [[String]]!{
        var backArr: [[String]] = []
        var dataModel = PickModelModel(showValuee: "")
        dataModel.lastValues = containData
        for index in currentIndex {
            var column:[String] = []
            for item in dataModel.lastValues {
                column.append(item.showValue)
            }
            dataModel = dataModel.lastValues[index]
            backArr.append(column)
        }
        return backArr
    }
    
    init(data: [Element]) {
        super.init()
        assert(!data.isEmpty,"[Element] cannot empyt")
        var currentModel : PickModelModel?
        var offsit: Int = 0
        /// 此方法的功能是将一个Element添加到containData中去
        func 添加数据到containData(element: Element) {
            /// 递归结束条件并添加
            if (element.showIdStr.count) - 1 < offsit {
                currentModel?.value = element
                return
            }
            
            if let currentModelneibu = currentModel {
                let pickModelModelArr = currentModelneibu.lastValues.filter() {
                    return $0.showValue == element.showIdStr[offsit]
                }
                if let pickModelModelArr = pickModelModelArr.first {
                    offsit += 1
                    currentModel = pickModelModelArr
                    添加数据到containData(element: element)
                }else{
                    let newPickModelModel = PickModelModel(showValuee: element.showIdStr[offsit])
                    offsit += 1
                    currentModelneibu.lastValues.append(newPickModelModel)
                    currentModel = newPickModelModel
                    添加数据到containData(element: element)
                }
            }else{
                let pickModelModelArr = containData.filter(){
                    return $0.showValue == element.showIdStr[offsit]
                }
                if let pickModelModel = pickModelModelArr.first {
                    currentModel = pickModelModel
                    offsit += 1
                    添加数据到containData(element: element)
                }else{
                    let newPickModelModel = PickModelModel(showValuee: element.showIdStr.first!)
                    offsit += 1
                    newPickModelModel.lastValues = []
                    containData.append(newPickModelModel)
                    currentModel = newPickModelModel
                    添加数据到containData(element: element)
                }
            }
        }
        for element in data {
            
            添加数据到containData(element: element)
            currentModel = nil
            offsit = 0
        }
        /// 排序currentModel
        
        var dataModel = PickModelModel(showValuee: "")
        dataModel.lastValues = containData
        
        func 排序(){
            if dataModel.lastValues.isEmpty {
                return
            }else{
                dataModel.lastValues.sort(){
                    return $0.showValue < $1.showValue
                }
                for item in dataModel.lastValues {
                    dataModel = item
                    排序()
                }
            }
        }
        排序()
        
        dataModel = PickModelModel(showValuee: "")
        dataModel.lastValues = containData
        func initIndexArr(){
            if dataModel.lastValues.isEmpty {
                return
            }else{
                dataModel = dataModel.lastValues.first!
                currentIndex.append(0)
                initIndexArr()
            }
        }
        initIndexArr()
        
    }
    
    func 滑动第X(列: Int, 到第X行 行: Int) -> Bool {
        if self.currentIndex.count - 1 < 列{
            print("没有那么多列")
            return false
        }else{
            var dataModel = PickModelModel(showValuee: "")
            dataModel.lastValues = containData
            for item in self.currentIndex.enumerated() {
                if 列 == item.offset {
                    if dataModel.lastValues.count - 1 >= 行 {
                        self.currentIndex[item.offset] = 行
                        var offset = item.offset + 1
                        func 将后面的变为第一行(){
                            if self.currentIndex.count - 1 >= offset {
                                self.currentIndex[offset] = 0
                                offset += 1
                                将后面的变为第一行()
                            }else{
                                return
                            }
                        }
                        将后面的变为第一行()
                        return true
                    }else{
                        print("第\(列)列没有第\(行)行")
                        return false
                    }
                }else{
                    dataModel = dataModel.lastValues[item.element]
                    
                }
            }
            print("未知失败原因")
            return false
        }
    }
}
//[
//    {
//        "showValue": "",
//        "values": [
//                    {
//                        "showValue": "",
//                        "values":
//                    },
//                    {
//                        "showValue": "",
//                        "values":
//                    },
//                ]
//    },
//    {
//        "showValue": "",
//        "values":
//    },
//]

class PickModelModel: NSObject{
    let showValue: String
    var lastValues: [PickModelModel] = []
    var value: PickModelProtocol?
    
    init(showValuee: String) {
        showValue = showValuee
    }
    override var description: String {
        return "\(showValue)"
    }
}

