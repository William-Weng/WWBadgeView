//
//  Extension.swift
//  WWBadgeView
//
//  Created by William.Weng on 2024/11/26.
//

import UIKit

// MARK: - CALayer
extension CALayer {
    
    /// 設定frame
    /// - Parameter frame: CGRect
    /// - Returns: Self
    func _frame(_ frame: CGRect) -> Self { self.frame = frame; return self }
    
    /// 設定框線寬度
    /// - Parameter width: CGFloat
    /// - Returns: Self
    func _borderWidth(_ width: CGFloat) -> Self { self.borderWidth = width; return self }
    
    /// 設定框線顏色
    /// - Parameter color: UIColor
    /// - Returns: Self
    func _borderColor(_ color: UIColor) -> Self { self.borderColor = color.cgColor; return self }
    
    /// 設定圓角
    /// - Parameter color: UIColor
    /// - Returns: Self
    func _cornerRadius(_ cornerRadius: CGFloat) -> Self {
        self.masksToBounds = true
        self.cornerRadius = cornerRadius
        return self
    }
}

