//
//  LoadingHandler.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 2.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    init() {
        
        if let keyWindow = UIApplication.shared.keyWindow {
            
            let frame = keyWindow.frame
            super.init(frame: frame)
            backgroundColor = UIColor.black.withAlphaComponent(0.3)
            let activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            activity.style = .whiteLarge
            //activity.color = UIColor.lightGray
            activity.hidesWhenStopped = false
            activity.center = self.center
            addSubview(activity)
            activity.startAnimating()
        } else {
            
            super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
    }
    
    init(excludeNavigationBar: Bool = true) {
        let bounds = UIApplication.shared.keyWindow?.frame
        let statusBarBounds = UIApplication.shared.statusBarFrame
        
        super.init(frame: CGRect(x: bounds!.minX, y: -(statusBarBounds.height+44), width: bounds!.width, height: bounds!.height-statusBarBounds.height))
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        let activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        activity.style = .whiteLarge
        //activity.color = UIColor.lightGray
        activity.hidesWhenStopped = false
        activity.center = self.center
        addSubview(activity)
        activity.startAnimating()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

///Yükleme ekranı protokolü
protocol LoadingHandler {
    var loadingView: LoadingView { get }
    
    func showLoading()
    func hideLoading()
    func hideLoading(completionHandler: @escaping () -> Void)
}

extension LoadingHandler where Self: UIViewController {
    
    /**
     Yükleme imleci ekrana getirilir
     */
    func showLoading() {
        
        loadingView.alpha = 0
        
        let window = UIApplication.shared.keyWindow!
        loadingView.frame = window.frame
        loadingView.center = window.center
        window.addSubview(loadingView)
        UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 1 })
    }
    
    /**
     Yükleme imleci ekrandan kaldırılır.
     */
    
    func hideLoading() {
        
        DispatchQueue.main.async(execute: {
            
            UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 0 }, completion: { _ in
                
                UIApplication.shared.keyWindow?.subviews.forEach {
                    if $0 is LoadingView { $0.removeFromSuperview() }
                }
            })
        })
    }
    
    func hideLoading(completionHandler: @escaping () -> Void) {
        
        DispatchQueue.main.async(execute: {
            
            UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 0 }, completion: { _ in
                
                UIApplication.shared.keyWindow?.subviews.forEach {
                    if $0 is LoadingView { $0.removeFromSuperview() }
                }
                completionHandler()
            })
        })
    }
}

extension LoadingHandler where Self: UITableViewController {
    
    func showLoading() {
        
        loadingView.alpha = 0
        
        let window = UIApplication.shared.keyWindow!
        loadingView.frame = CGRect(x: window.frame.origin.x, y: window.frame.origin.y, width: window.frame.width, height: window.frame.height)
        window.addSubview(loadingView)
        UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 1 })
    }
    
    func hideLoading() {
        
        DispatchQueue.main.async(execute: {
            
            UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 0 }, completion: { _ in
                
                self.loadingView.removeFromSuperview()
            })
        })
    }
    
    func hideLoading(completionHandler: @escaping () -> Void) {
        
        DispatchQueue.main.async(execute: {
            
            UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 0 }, completion: { _ in
                
                UIApplication.shared.keyWindow?.subviews.forEach {
                    if $0 is LoadingView { $0.removeFromSuperview() }
                }
                completionHandler()
            })
        })
    }
}

extension LoadingHandler where Self: UICollectionViewController {
    
    func showLoading() {
        
        let window = UIApplication.shared.keyWindow!
        loadingView.alpha = 0
        loadingView.frame = CGRect(x: window.frame.origin.x, y: window.frame.origin.y, width: window.frame.width, height: window.frame.height)
        window.addSubview(loadingView)
        UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 1 })
    }
    
    func hideLoading() {
        
        UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 0 }, completion: { _ in
            self.loadingView.removeFromSuperview()
        })
    }
    
    func hideLoading(completionHandler: @escaping () -> Void) {
        
        DispatchQueue.main.async(execute: {
            
            UIView.animate(withDuration: 0.3, animations: { self.loadingView.alpha = 0 }, completion: { _ in
                
                UIApplication.shared.keyWindow?.subviews.forEach {
                    if $0 is LoadingView { $0.removeFromSuperview() }
                }
                completionHandler()
            })
        })
    }
}
