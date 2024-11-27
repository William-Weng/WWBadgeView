//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/11/27.
//

import UIKit
import WWBadgeView

@IBDesignable
final class MyBadgeView: WWBadgeView {}

// MARK: - ViewController
final class ViewController: UIViewController {
    
    @IBOutlet weak var myBadgeView1: MyBadgeView!
    @IBOutlet weak var myBadgeView2: MyBadgeView!
    @IBOutlet weak var myBadgeView3: MyBadgeView!
    
    private var value3 = 995
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetting()
    }
    
    @IBAction func valueSetting(_ sender: UIBarButtonItem) {
        value3 += 1
        myBadgeView3.value(value3)
    }
}

// MARK: - 小工具
private extension ViewController {
    
    func initSetting() {
        
        myBadgeView2.value(100, textColor: .black)
        myBadgeView2.border(width: 8, color: .systemBlue)
        myBadgeView2.background(.yellow, radius: 8)
        
        myBadgeView3.value(value3, maxValue: 999, font: .systemFont(ofSize: 20))
        myBadgeView3.border(width: 8, color: .green)
    }
}
