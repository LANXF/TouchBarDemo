//
//  WindowController.swift
//  TouchBarDemo
//
//  Created by 蓝潇枫 on 2017/2/14.
//  Copyright © 2017年 蓝潇枫. All rights reserved.
//


/*

 实现一个能够自定义的，基本的TouchBar。需要下面三点：
 1.给你的 TouchBar 和 Bar Item 生成标识符
 2.告诉 TouchBar 默认会显示哪些 Bar Item
 3.让 TouchBar 生成这些 Bar Item
 */
import Cocoa


// MARK: - 标识符
fileprivate extension NSTouchBarCustomizationIdentifier {
    static let touchBarID = NSTouchBarCustomizationIdentifier("LANXF.TouchBarSample.touchBar")
}

fileprivate extension NSTouchBarItemIdentifier {
    static let smallerID = NSTouchBarItemIdentifier("LANXF.TouchBarSample.smaller")
    static let equalID = NSTouchBarItemIdentifier("LANXF.TouchBarSample.equal")
    static let biggerID = NSTouchBarItemIdentifier("LANXF.TouchBarSample.bigger")
}

class WindowController: NSWindowController,NSTouchBarDelegate {
    
    @IBOutlet weak var numberA: NSTextField!
    @IBOutlet weak var numberB: NSTextField!
    @IBOutlet weak var resultLabel: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        reset()
    }
    
    override var windowNibName: String? {
        return "WindowController"
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        //touchBar的代理
        touchBar.delegate = self
        touchBar.customizationAllowedItemIdentifiers = [.smallerID,.equalID,.biggerID]
        touchBar.defaultItemIdentifiers = [.smallerID,.equalID,.biggerID]
        
        return touchBar
        
    }
    
    //MARK: - touchBaeDelegate代理方法
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        //自定义TouchBar的按钮
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        var title:String
        //判断点击是什么
        switch identifier {
        case NSTouchBarItemIdentifier.smallerID:
            title = "小于，你这个白痴。小学题都不会做"
        case NSTouchBarItemIdentifier.equalID:
            title = "等于，你太棒了！！！"
        case NSTouchBarItemIdentifier.biggerID:
            title = "大于，错错错❌！！"
        default: title = ""
        }
        
        let touchBarButton = NSButton(title: title, target: self, action: #selector(compare(with:)))
        touchBarItem.view = touchBarButton
        
        return touchBarItem
    }
    
    /// 对比两个数字
    func compare(with symbol:NSButton) {
        let number1 = self.numberA.intValue
        let number2 = self.numberB.intValue
        var result: Bool
        
        switch symbol.title {
        case "小于，你这个白痴。小学题都不会做":
            result = (number1 < number2)
        case "等于，你太棒了！！！":
            result = (number1 == number2)
        case "大于，错错错❌！！":
            result = (number1 > number2)
        default:
            result = false
        }
        
        resultLabel.stringValue = (result == true) ? "正确" : "错误"
    }
    
    //按钮点击事件
    @IBAction func randomize(_ sender: NSButton) {
        reset()
    }
    
    // MARK: - Private Method
    
    /// 初始化数字
    private func reset() {
        numberA.intValue = randomAInt()
        numberB.intValue = randomAInt()
        resultLabel.stringValue = ""
    }
    
    /// 生成随机数
    private func randomAInt() -> Int32 {
        return Int32(arc4random_uniform(10))
    }
    
    
    
}





































