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
    public func addNavigationTab(for titles: [String], selectIndex: Int = 0) -> NavigationTabView? {
        guard let nav = self.navigationController else { return nil }
        nav.setNavigationBarHidden(false, animated: false)
//        var frame = CGRect(x: (UIScreen.main.bounds.width - tabWidth) / 2 , y: 20, width: tabWidth, height: 44)
//        if UIScreen.main.bounds.height == 812 {
//            frame.origin.y = 44
//        }
//        frame.origin = CGPoint(x: 0, y: 0)
        let frame = CGRect(x: 0, y: 0, width: tabWidth, height: 44)
        let navigationTabView = NavigationTabView(frame: frame, titles: titles, selectIndex: selectIndex)
        navigationItem.titleView = navigationTabView
        return navigationTabView
    }
}
