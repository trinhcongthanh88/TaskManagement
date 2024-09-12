//
//  Base.swift
//  Constructor_Mac
//
//  Created by ThanhTC on 8/21/17.
//  Copyright © 2017 ThanhTC. All rights reserved.
//

import UIKit
import RealmSwift
//import  CustomControl
//import  ConstructorAPI_Mac
class Base: NSObject {
    //        static var dbContext = (UIApplication.sharedApplication.delegate as? AppDelegate).managedObjectContext//DBController().managedObjectContext
    static var navCtrl: UINavigationController?
//    static var keyboardHeight: CGFloat = 450
//    //        static var baseRatio = BaseRatioScreen()
//    static var basePageSize:Int = 20
//    static var navColor:UIColor { get { return UIColor(hexString: "#000033")}}//1429cc//
//    static var headerMenuColor:UIColor { get { return UIColor(hexString: "1429cc")}}//4caf50
//    static var textMenuColor:UIColor { get { return UIColor(hexString: "FFFFFF")}}//4caf50
//    static var btnTabTextMenuColor:UIColor { get { return UIColor(hexString: "AAAAA")}}
//    static var btnPaymentColor:UIColor { get { return UIColor(hexString: "FFD131")}}
//    static var btnPaymentTextColor:UIColor { get { return UIColor(hexString: "FFFFFF")}}
//    static var btnCancelColor:UIColor { get { return UIColor(hexString: "DEDEDE")}}
//    static var btnViewColor:UIColor { get { return UIColor(hexString: "4caf50")}}
//    static var btnViewTextColor:UIColor { get { return UIColor(hexString: "FFD131")}}
//    static var btnCancelTextColor:UIColor { get { return UIColor(hexString: "DEDEDE")}}
//    static var heightitemExt:CGFloat = 49
//    static var deviceMode = UIDevice.current.model
//    static var imgLogo:UIImageView!
//    static var alphaLogo:CGFloat = 0.2{
//        didSet{
//            self.alphaLogo = self.alphaLogo > 1 ? 1 : self.alphaLogo
//        }
//    }
    
    //    static var storeID:String { //"a4a658bb-cac7-4ca4-9181-d0d6e879627a" {
    //        get {
    //            return KeychainSwift().get("LinkApp-StoreID") ?? ""
    //        } set {
    //            KeychainSwift().set(newValue, forKey: "LinkApp-StoreID")
    //        }
    //    }
//    static var merchantID = "" //"722c9d1037b84f039eef433574b07469"
//    static var merchantName = ""
//    static var merchantImgUrl = ""
//    static var userName = ""
//    static var fullName = ""
//    static var empPinCode = ""
//    static var roleName = ""
//    static var userImgUrl = ""
//    static var createdUser = ""
//    static var userID = ""
//    static var deviceName = UIDevice.current.name
//    static var currencySymbol = "$"
//    static var islogin:Bool = false
//    static var listFillter:[FillterDTO] = FillterDTO().listFillter()
//    static var nsUserDefaults = UserDefaults.standard
//    static var port:String  = ""
//    static var serverName: String = ""
//    /// Return Image Store
//    static var imgStore = ImageStore()
//    static var currentLocale: String {
//        return  "en"
//    }
//    static var baseScreen = BaseScreen()
//    static var fomatDate:String = "dd/MM/yyyy"
//    static var fomatTime:String = "hh:mm:ss"
//    static var fomatDateTime:String = "yyy-MM-dd HH:mm:ss"
//    // Usage>> let request: YourRequestClass = BaseService.createRequest()
//    static func createRequest<T: JsonSerializable>(id: String? = nil) -> T {
//        let request = T()
////        request.createdUser = createdUser
////        request.merchantID = merchantID
////        request.deviceName = Base.deviceName
////        request.id = id ?? "" //Base.userID // UserID
//        return request
//    }
//    
//    class func getURLApi(){
//        getDefaultPort()
//        getDefaultServer()
//        getRememberUser()
//        APIURL = "http://"+Base.serverName+":"+Base.port
//    }
//    
//    class func getDefaultPort(){
//        guard let defaultPort = Base.nsUserDefaults.string(forKey: "DefaultPort") else {
//            Base.port = "8182"
//            Base.nsUserDefaults.setValue(Base.port, forKey: "DefaultPort")
//            return
//        }
//        Base.port = defaultPort
//    }
//    
//    class func getDefaultServer(){
//        guard let defaultServerName = Base.nsUserDefaults.string(forKey: "DefaultServerName") else {
//            Base.serverName = "sbitsolutions.ddns.net" //192.168.1.104" //"iosapi.saigonberlin-it.de"//
//            Base.nsUserDefaults.setValue(Base.serverName, forKey: "DefaultServerName")
//            return
//        }
//        Base.serverName = defaultServerName
//    }
//    
//    class func getRememberUser(){
//        guard let rememberUser = Base.nsUserDefaults.string(forKey: "RememberUser") else {
//            Base.userID = ""
//            Base.setRememberUser(value: Base.userID)
//            return
//        }
//        Base.userID = rememberUser
//    }
//    
//    class func setRememberUser(value:String){
//        Base.nsUserDefaults.setValue(value, forKey: "RememberUser")
//    }
//    
//    class func getImageLogo(){
//        Base.imgLogo = UIImageView()
//        Base.imgLogo.image = UIImage(named: "logo")
//        Base.imgLogo.frame.size = CGSize(width: 192, height: 192)
//        //            Base.imgLogo.setImageFromUrl(urlString: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRayipB_kP6n2s3cZnrC8rcc0PIt1iJ_0RVEzjJohQ-uaciLhxFTA")
//    }
//    
//    class func addImgLogo(fromImg:UIImageView, toImg:inout UIImage) -> UIImage{
//        UIGraphicsBeginImageContextWithOptions(toImg.size, true, 0.0);
//        let temImg = fromImg.image?.resize(newWidth: toImg.size.width)
//        let imgLocation:CGPoint = CGPoint(x:(toImg.size.width - (temImg?.size.width ?? 60)) / 2,y:(toImg.size.height - (temImg?.size.height ?? 60)) / 2)
//        let imgSize:CGSize = temImg?.size ?? CGSize(width: toImg.size.width, height: toImg.size.height)
//        let imgRect = CGRect(origin: imgLocation, size: imgSize)
//        toImg.draw(in: CGRect(x: 0, y: 0, width: toImg.size.width, height: toImg.size.height))
//        
//        // get context
//        let context = UIGraphicsGetCurrentContext();
//        
//        // push context to make it current
//        // (need to do this manually because we are not drawing in a UIView)
//        UIGraphicsPushContext(context!);
//        
//        // drawing code comes here- look at CGContext reference
//        // for available operations
//        // this example draws the inputImage into the context
//        fromImg.image?.draw(in: imgRect,blendMode: CGBlendMode.normal, alpha: alphaLogo )
//        // pop context
//        UIGraphicsPopContext();
//        
//        // get a UIImage from the image context- enjoy!!!
//        toImg = UIGraphicsGetImageFromCurrentImageContext()!;
//        
//        // clean up drawing environment
//        UIGraphicsEndImageContext();
//        return toImg
//    }
//    
//    class func snapshopOfCell(inputView: UIView) -> UIView {
//        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
//        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
//        UIGraphicsEndImageContext()
//        let cellSnapshot : UIView = UIImageView(image: image)
//        cellSnapshot.layer.masksToBounds = false
//        cellSnapshot.layer.cornerRadius = 0.0
//        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
//        cellSnapshot.layer.shadowRadius = 5.0
//        cellSnapshot.layer.shadowOpacity = 0.4
//        return cellSnapshot
//    }
//    struct MyTempView {
//        static var cellSnapshot : UIView? = nil
//    }
//    class func animationAlpha(view:UIView,time:TimeInterval = 0.5,alpha:CGFloat = 0){
//        UIView.animate(withDuration: time) {
//            view.alpha = alpha
//        }
//    }
//    class func statusLable(status:Int,lblStatus: UILabel) -> UILabel {
//        var name = EStatusItem.Unreceive.toNameString()
//        switch status {
//        case EStatusItem.Seen.rawValue:
//            name = EStatusItem.Seen.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.green
//            lblStatus.textColor = .white
//            break
//        case EStatusItem.UnSeen.rawValue:
//            name = EStatusItem.UnSeen.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.red
//            lblStatus.textColor = .white
//            break
//        case EStatusItem.Activate.rawValue:
//            name = EStatusItem.Activate.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.brown
//            lblStatus.textColor = .white
//            break
//            
//        case EStatusItem.Finish.rawValue:
//            name = EStatusItem.Finish.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.blue
//            lblStatus.textColor = .white
//            break
//            
//        case EStatusItem.HangOver.rawValue:
//            name = EStatusItem.HangOver.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.black
//            lblStatus.textColor = .white
//            break
//        default:
//            name = EStatusItem.Unreceive.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.orange
//            lblStatus.textColor = .white
//        }
//        return lblStatus
//    }
//    
//    class func statusTask(status:Int,lblStatus: UILabel) -> UILabel {
//        var name = EStatusTask.Nomal.toNameString()
//        switch status {
//        case EStatusTask.Nomal.rawValue:
//            name = EStatusTask.Nomal.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.blue
//            lblStatus.textColor = .white
//            break
//        case EStatusTask.Important.rawValue:
//            name = EStatusTask.Important.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.orange
//            lblStatus.textColor = .white
//            break
//        case EStatusTask.Very_Important.rawValue:
//            name = EStatusTask.Very_Important.toNameString()
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.red
//            lblStatus.textColor = .white
//            break
////
////        case EStatusTask.Finish.rawValue:
////            name = EStatusTask.Finish.toNameString()
////            lblStatus.text = name
////            lblStatus.backgroundColor = UIColor.blue
////            lblStatus.textColor = .white
////            break
////
////        case EStatusTask.HangOver.rawValue:
////            name = EStatusTask.HangOver.toNameString()
////            lblStatus.text = name
////            lblStatus.backgroundColor = UIColor.black
////            lblStatus.textColor = .white
////            break
//        default:
//            name = "Unknow"
//            lblStatus.text = name
//            lblStatus.backgroundColor = UIColor.orange
//            lblStatus.textColor = .white
//        }
//        return lblStatus
//    }
}

class BaseScreen{
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
