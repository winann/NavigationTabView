//
//  NavigationTabView.swift
//  NavigationTabView
//
//  Created by Winann on 2018/8/29.
//

import UIKit

let selectColor = UIColor.black
let deselectColor = UIColor(red: 115 / 255.0, green: 119 / 255.0, blue: 126 / 255.0, alpha: 1)
public class NavigationTabView: UIView {
    
    public var selectResult: ((Int) -> Void)?
    private var tabBtns: [UIButton] = []
    public private(set) var selectIndex: Int = 0
    private var bottomView = UIView(frame: CGRect.zero)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(frame: CGRect, titles: [String], selectIndex: Int = 0) {
        self.init(frame: frame)
        configSubviews(titles, selectIndex: selectIndex)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 选择某个tab
    ///
    /// - Parameter index: 要选择 tab 的 Index
    public func select(for index: Int) {
        guard tabBtns.count > index else {
            return
        }
        btnSelect(tabBtns[index])
    }
    
    private func configSubviews(_ titles: [String], selectIndex: Int) {
//        lastSelectIndex = selectIndex
        tabBtns = titles.enumerated().map { [weak self] (i, title) -> UIButton in
            guard let `self` = self else { return UIButton() }
            let btn = generateBtn(title, 0 == i)
            btn.tag = 1000 + i
            let width = self.bounds.width / CGFloat(titles.count)
            var tempFrame = CGRect(x: 0, y: 0, width: width, height: self.bounds.height)
            if 0 < i {
                tempFrame.origin.x = CGFloat(i) * width
            }
            btn.frame = tempFrame
            self.addSubview(btn)
            return btn
        }
        /// 布局状态条
        guard selectIndex < tabBtns.count else { return }
        bottomView.bounds.size = CGSize(width: 30, height: 2)
        bottomView.center = CGPoint(x: tabBtns[0].center.x, y: bounds.maxY - 1)
        bottomView.backgroundColor = UIColor(red: 82 / 255.0, green: 137 / 255.0, blue: 254 / 255.0, alpha: 1)
        addSubview(bottomView)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) { [weak self] in
//            self?.selectResult?(selectIndex)
            self?.select(for: selectIndex)
        }
    }
    
    private func generateBtn(_ title: String, _ select: Bool = false) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        if #available(iOS 8.2, *) {
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        } else {
            // Fallback on earlier versions
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        }
        btn.setTitleColor(selectColor, for: .selected)
        btn.setTitleColor(deselectColor, for: .normal)
        btn.isSelected = select
        btn.addTarget(self, action: #selector(btnSelect), for: .touchUpInside)
        return btn
    }
    
    private func bottomViewAnimation(to selectBtn: UIButton) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.bottomView.center.x = selectBtn.center.x
        }
    }
    
    @objc private func btnSelect(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
            bottomViewAnimation(to: sender)
            if let lastSelectBtn = viewWithTag(1000 + selectIndex) as? UIButton {
                lastSelectBtn.isSelected = false
            }
            selectIndex = sender.tag - 1000
            selectResult?(sender.tag - 1000)
        }
    }
}
