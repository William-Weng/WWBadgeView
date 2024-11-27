//
//  WWBadgeView.swift
//  WWBadgeView
//
//  Created by William.Weng on 2024/11/26.
//

import UIKit

@IBDesignable
open class WWBadgeView: UIView {
    
    @IBInspectable var value: Int = 0
    @IBInspectable var maxValue: Int = 999
    @IBInspectable var textColor: UIColor = .white
    @IBInspectable var badgeViewColor: UIColor = .systemRed
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    
    private var radius: CGFloat = 0
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initSetting()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSetting()
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        radius = contentView.frame.height * 0.5
        _ = layer._cornerRadius(radius)
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initSetting()
        radius = contentView.frame.height * 0.5
        _ = layer._cornerRadius(radius)
        contentView.prepareForInterfaceBuilder()
    }
}

// MARK - 公開函式
public extension WWBadgeView {
    
    /// 設定數值
    /// - Parameters:
    ///   - value: Int
    ///   - maxValue: 最大值
    ///   - textColor: 文字顏色
    ///   - font: 字型
    func value(_ value: Int, maxValue: Int? = nil, textColor: UIColor? = nil, font: UIFont? = nil) {
        if let font = font { badgeLabel.font = font }
        setting(value: value, maxValue: maxValue, textColor: textColor)
    }
    
    /// 設定外框
    /// - Parameters:
    ///   - width: 寬度
    ///   - color: 顏色
    func border(width: CGFloat, color: UIColor) {
        _ = layer._borderWidth(width)._borderColor(color)
    }
    
    /// 設定背景
    /// - Parameters:
    ///   - badgeViewColor: 顏色
    ///   - radius: 圓角
    func background(_ badgeViewColor: UIColor, radius: CGFloat) {
        layer._cornerRadius(radius)
        setting(textColor: nil, badgeViewColor: badgeViewColor)
    }
}

// MARK: - 小工具
private extension WWBadgeView {
    
    /// 初始化設定
    func initSetting() {
        initViewFromXib()
        setting()
    }
    
    /// 讀取Nib畫面 => 加到View上面
    func initViewFromXib() {
        
        let bundle = Bundle.module
        let name = String(describing: WWBadgeView.self)
        
        bundle.loadNibNamed(name, owner: self, options: nil)
        contentView.frame = bounds
        
        addSubview(contentView)
    }
    
    /// 設定 / 紀錄相關數值
    /// - Parameters:
    ///   - value: 顯示的數值
    ///   - maxValue: 顯示的最大值
    ///   - textColor: 文字顏色
    ///   - badgeViewColor: 背景色
    func setting(value: Int? = nil, maxValue: Int? = nil, textColor: UIColor? = nil, badgeViewColor: UIColor? = nil) {
        
        if let value = value { self.value = value }
        if let maxValue = maxValue { self.maxValue = maxValue }
        if let textColor = textColor { self.textColor = textColor }
        if let badgeViewColor = badgeViewColor { self.badgeViewColor = badgeViewColor }
        
        badgeLabel.text = "\(self.value)"
        badgeLabel.textColor = self.textColor
        badgeView.backgroundColor = self.badgeViewColor
        
        if (self.value > self.maxValue) { badgeLabel.text = "\(self.maxValue)+" }
    }
}
