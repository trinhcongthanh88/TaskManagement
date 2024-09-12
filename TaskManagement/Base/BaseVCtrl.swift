//
//  BaseVCtrl.swift
//  Constructor_Mac
//
//  Created by ThanhTC on 8/21/17.
//  Copyright © 2017 ThanhTC. All rights reserved.
//

import UIKit
//import  CustomControl

class BaseVCtrl: UIViewController {
//    // MARK: - Outlet
//    //    var navColor:UIColor { get { return Base.navColor}}
//    // MARK: - Private properties
//    var schemeOverLayColor: UIColor { get { return UIColor(hexString: "000000", a: 0.3)}}
//    var btnUserLogin:CustomUIButton!
//    // MARK: - Properties
//    //    var module: EModule?
//    
//    //    var viewLoading: UIView!
//    
//    // MARK: - Init
//    init() {
//        super.init(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    // MARK: - ViewController
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configUI()
//        loadData()
//        eventListener()
//        self.view.backgroundColor = UIColor.clear
//    }
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        configUIViewWillAppear()
//    }
//    
//    // MARK: - Func
//    func loadData() {}
//    
//    // MARK: - Layout UI
//    func configUI() {
//        //        title = module?.rawValue ?? ""
//        Base.getURLApi()
//        configNavigationController(navCtrl: Base.navCtrl!)
//        
//        //        self.registerKeyboardNotification()
//    }
//    
//    func adjustsScrollView(flag:Bool = false){
//        self.automaticallyAdjustsScrollViewInsets = flag
//    }
//    
//    func configNavigationController(navCtrl: UINavigationController) {
//        navCtrl.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : Base.textMenuColor, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
//        
//        //        navCtrl.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//        navCtrl.navigationBar.shadowImage = UIImage()
//        navCtrl.navigationBar.isTranslucent = true
//        navCtrl.navigationBar.tintColor = UIColor.white
//        navCtrl.navigationBar.barTintColor = Base.navColor
//        
//        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
//        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
//            statusBar.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//        }
//        navigationItem.hidesBackButton = true
//    }
//    
//    func configUIViewWillAppear() {}
//    
//    /// add a custom view to left item on navigation bar
//    func addViewToLeftBarItem(view: UIView) {
//        let barItem = UIBarButtonItem(customView: view)
//        self.navigationItem.leftBarButtonItem = barItem
//    }
//    
//    /// add a custom view to right item on navigation bar
//    func addViewToRightBarItem(view: UIView) {
//        let barItem = UIBarButtonItem(customView: view)
//        self.navigationItem.rightBarButtonItem = barItem
//    }
//    
//    // MARK: - Event Listerner
//    func eventListener() {}
//    
//    // MARK: - Event Handler
//    func createBtnBack(title text:String?,color:UIColor = UIColor.white,icon:UIImage = UIImage(named: "Back_ic") ?? UIImage(),horizontalAlignment:UIControl.ContentHorizontalAlignment = .left,completion:((_ btn:UIButton)->())?){
//        let btnBack = UIButton(type: .system)
//        btnBack.setTitle(text, for:.normal)
//        btnBack.contentVerticalAlignment = .center
//        btnBack.contentHorizontalAlignment = horizontalAlignment
//        btnBack.tintColor = color
//        btnBack.setImage(icon ,for: UIControl.State.normal)
//        if (completion != nil){
//            btnBack.touchUpInside {_ in
//                completion!(btnBack)
//            }
//        }
//       self.addViewToLeftBarItem(view: btnBack)
//    }
//    // thanh
//    func forcusAndSeletedTextFiled(textFiled:UITextField){
//        textFiled.becomeFirstResponder()
//        textFiled.selectedTextRange = textFiled.textRange(from: textFiled.beginningOfDocument, to: textFiled.endOfDocument)
//    }
//    
//    func notForcusTextFiled(textFiled:[UITextField]){
//        textFiled.forEach{
//            $0.resignFirstResponder()
//        }
//    }
//    
//    func createLeftUserLogin(name:String){
//        if (btnUserLogin == nil){
//            btnUserLogin = CustomUIButton(type: .custom)
//            btnUserLogin.frame.size = CGSize(width: 150, height: 40)
//            btnUserLogin.setTitleColor(UIColor.white, for: .normal)
//            btnUserLogin.isUserInteractionEnabled = true
//            btnUserLogin.setTitle(name, for: .normal)
//            btnUserLogin.backgroundColor = .clear//UIColor(hexString: "FFFFFF", alpha: 0.1)
////            btnUserLogin.paddingLeft = 10.0
//            btnUserLogin.contentHorizontalAlignment = .left
//            btnUserLogin.layer.cornerRadius = 5
//            self.addViewToLeftBarItem(view: btnUserLogin)
//        }
//    }
//    
//    
//    //        func setEdgeInsetsImage(control:UIButton,leftPadding:CGFloat = 0) -> UIEdgeInsets {
//    //            return UIEdgeInsetsMake(0, (control.frame.width * Base.baseRatio.width)  - (control.imageView?.image?.size.width)!-leftPadding, 0, 0);
//    //        }
//    
//    func setEdgeInsetsTitle(control:UIButton,leftPadding:CGFloat = 0) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0);
//    }
//    
//    func scrollToTextFiled(scrollView:UIScrollView,textField: UITextField){
//        var y:CGFloat = 0
//        let frame = textField.superview!.convert(textField.frame, to: view)
//        if frame.maxY + scrollView.contentOffset.y + 8  > view.frame.height - Base.keyboardHeight {
//            //y is distance of textField be hideen by keyboard (show) add with height scrollView was scrolled
//            y = (Base.keyboardHeight - (view.frame.maxY - frame.maxY ) + 8 + scrollView.contentOffset.y) //* BaseEmployees.ratioHeightScreen
//            y = y <= 0 ? 0 : y
//        }
//        self.pushViewWhenShowKeyBoard(scrollView: scrollView,y: y)
//    }
//    
//    func pushViewWhenShowKeyBoard(scrollView:UIScrollView,y : CGFloat){
//        scrollView.setContentOffset(CGPoint(x: 0, y: y), animated: true)
//    }
//    //        func nextFiled(listTextFiled:[UITextField],curentField:UITextField){
//    //            if let txt = (listTextFiled.firstOrDefault({$0.tag > curentField.tag})){
//    //                txt.becomeFirstResponder()
//    //            }
//    //        }
//    
//    var viewLoading: UIView!
//    // Show or hide Loading View
//    func showLoadingView(frameLoading: CGRect = CGRect.zero, loadingBgColor color: UIColor = UIColor(hexString: "000000", a: 0.1)) {
//        //            Base.navCtrl?.topViewController?.navigationItem.rightBarButtonItem?.customView?.isUserInteractionEnabled = !isShow
//        
//        viewLoading = UIView()
//        viewLoading.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        viewLoading.frame = frameLoading == CGRect.zero ? self.view.bounds : frameLoading
//        viewLoading.backgroundColor = color
//        
//        let vLoadingSmall = UIView()
//        vLoadingSmall.frame.size = CGSize(width: 40, height: 40)
//        vLoadingSmall.backgroundColor = UIColor(hexString: "000000", a: 0.3)// UIColor(hexString: "000000", a: 0.3)
//        vLoadingSmall.center = CGPoint(x: viewLoading.width / 2, y: viewLoading.height / 2)
//        vLoadingSmall.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
//        vLoadingSmall.layer.cornerRadius = 4
//        
//        let indicator = UIActivityIndicatorView()
//        indicator.startAnimating()
//        indicator.autoresizingMask = vLoadingSmall.autoresizingMask
//        indicator.center = CGPoint(x: vLoadingSmall.width / 2, y: vLoadingSmall.width / 2)
//        
//        vLoadingSmall.addSubview(indicator)
//        viewLoading.addSubview(vLoadingSmall)
//        
//        self.view.addSubview(viewLoading)
//        self.view.bringSubviewToFront(viewLoading)
//    }
//    
//    func stopLoadingView(){
//        if (viewLoading != nil){
//            viewLoading.subviews.forEach({
//                $0.removeFromSuperview()
//            })
//            viewLoading.removeFromSuperview()
//        }
//    }
    
    //    func showLoadingButton(sender: UIButton, isShow: Bool = true) {
    //        Base.navCtrl?.topViewController?.navigationItem.rightBarButtonItem?.customView?.userInteractionEnabled = !isShow
    //        self.view.isUserInteractionEnabled = !isShow
    //        sender.isUserInteractionEnabled = !isShow
    //
    //        if !isShow {
    //            sender.setTitle(sender.accessibilityLabel, for: .Normal)
    //            sender.accessibilityLabel = ""
    //            if let indicator = sender.subviews.firstOrDefault({ $0 is UIActivityIndicatorView}) as? UIActivityIndicatorView {
    //                indicator.stopAnimating()
    //                indicator.removeFromSuperview()
    //            }
    //            return
    //        }
    //
    //        sender.accessibilityLabel = sender.currentTitle
    //        sender.setTitle("", for: .normal)
    //
    //        let indicator = UIActivityIndicatorView()
    //        indicator.color = .black
    //        indicator.center = CGPoint(x: sender.width / 2, y: sender.height / 2)
    //        indicator.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    //        indicator.startAnimating()
    //        sender.addSubview(indicator)
    //    }
    
    //    func getVCtrlInNavigation<T: UIViewController>(type: T.Type) -> T? {
    //        return self.navigationController?.viewControllers.firstOrDefault{$0 is T} as? T
    //    }
    //
    
    
    //     func keyboardWillShow(notify: NSNotification) {
    //        let userInfo:NSDictionary = notify.userInfo! as NSDictionary
    //        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
    //        let keyboardRectangle = keyboardFrame.cgRectValue
    //        Base.keyboardHeight = keyboardRectangle.height
    //    }
}
