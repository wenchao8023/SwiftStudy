
import UIKit

extension NSString {
    func printSelf() -> Void {
        print(self)
    }
}

extension UIView {
    func movetoXwithDuration(toX:CGFloat, duration:Double) -> Void {
        UIView.animate(withDuration: duration) { 
            self.frame.origin.x = toX
        }
    }
}

extension Int {
    var FloatValue:CGFloat{return CGFloat(self)}
    var DoubleValue:Double{return Double(self)}
}

extension UIImage {
    var height: CGFloat{return self.size.height}
    var width : CGFloat{return self.size.width}
    
    /**
     *  压缩图片 并返回压缩后的图片
     */
    func imageCompress(targetWidth:CGFloat) -> UIImage {
        let targetHeight = (targetWidth / width) * height
        UIGraphicsBeginImageContext(CGSize(width: targetWidth, height: targetHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: targetWidth, height: targetHeight))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    /// 返回一张模糊图片
    ///
    /// - Parameter value: 模糊程度
    /// - Returns: 返回处理后的图片
    func blurImage(value:NSNumber) -> UIImage {
        let context = CIContext(options: [kCIContextUseSoftwareRenderer: true])
        let ciImage = CIImage(image: self)
        /// 滤镜
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(value, forKey: "inputRadius")
        let imageRef = context.createCGImage((blurFilter?.outputImage)!, from: (ciImage?.extent)!)
        let newImage = UIImage(cgImage: imageRef!)
        return newImage
    }
}

