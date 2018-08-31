//
//  WillAddNavigationTab.swift
//  NavigationTabView
//
//  Created by Winann on 2018/8/29.
//

import Foundation
let tabWidth: CGFloat = 180
public protocol WillAddNavigationTab {
    
}
extension WillAddNavigationTab where Self: UIViewController {
    public func addNavigationTab(for titles: [String], selectIndex: Int = 0, to view: UIView? = nil, viewWidth: CGFloat = UIScreen.main.bounds.width) -> NavigationTabView? {
        var frame = CGRect(x: 0, y: 0, width: tabWidth, height: 44)
        let navigationTabView = NavigationTabView(frame: frame, titles: titles, selectIndex: selectIndex)
        if let superView = view {
            print("\(superView.frame)-----------\(superView.bounds)")
            frame.origin.x = (viewWidth - tabWidth) / 2
            frame.origin.y = superView.bounds.maxY - 44
            navigationTabView.frame = frame
            superView.addSubview(navigationTabView)
        } else {
            navigationItem.titleView = navigationTabView
        }
        return navigationTabView
    }
}
