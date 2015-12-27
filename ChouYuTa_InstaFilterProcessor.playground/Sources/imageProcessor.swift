//
//  imageProcessor.swift
//  
//
//  Created by Lawrence Chou on 12/3/15.
//

import Foundation
import UIKit




/**
 * class description
 *
 * p
 */
public class imageProcessor {
    
    /**
     * Note: because it's not allowed to declare like:
     
     * *public let UIImage: UIImage*
     
     * so I named this property "pUIImage" (p for property),
     * please let me know if there is a more reasonable way
     * to name it.
     */
    public var pUIImage: UIImage
    public let pRGBAImage: RGBAImage
    public enum colors:String{
        case Red = "Red"
        case Green = "Green"
        case Blue = "Blue"
    }
    public enum filters:String{
        case brightness = "brightness"
    }

    public init(file_name name: String) {
        pUIImage = UIImage(imageLiteral: name)
        pRGBAImage = RGBAImage(image: pUIImage)!
    }


    public func brightness(multipleBy scale: Double)->imageProcessor{
        
        for y in 0..<pRGBAImage.height {
            for x in 0..<pRGBAImage.width {
                let index = y * pRGBAImage.width + x
                var pixel: Pixel = (pRGBAImage.pixels[index])
                
                pixel.red = UInt8(max(min(255, Double(pixel.red) * scale), 0))
                pixel.green = UInt8(max(min(255, Double(pixel.green) * scale), 0))
                pixel.blue = UInt8(max(min(255, Double(pixel.blue) * scale), 0))
                
                pRGBAImage.pixels[index] = pixel
            }
        }
        if let image = pRGBAImage.toUIImage(){pUIImage = image}
        return self
    }

    
    public func applyRedFilter(scale scale: Double)->imageProcessor{
        
        for y in 0..<pRGBAImage.height {
            for x in 0..<pRGBAImage.width {
                let index = y * pRGBAImage.width + x
                var pixel: Pixel = (pRGBAImage.pixels[index])
                
                pixel.red = UInt8(max(min(255, Double(pixel.red) * scale), 0))
                pixel.green = UInt8(max(min(255, Double(pixel.green) * 0.8), 0))
                pixel.blue = UInt8(max(min(255, Double(pixel.blue) * 0.8), 0))
                
                pRGBAImage.pixels[index] = pixel
            }
        }
        if let image = pRGBAImage.toUIImage(){pUIImage = image}
        return self
    }

    public func applyGreenFilter(scale scale: Double)->imageProcessor{
        
        for y in 0..<pRGBAImage.height {
            for x in 0..<pRGBAImage.width {
                let index = y * pRGBAImage.width + x
                var pixel: Pixel = (pRGBAImage.pixels[index])
                
                pixel.red = UInt8(max(min(255, Double(pixel.red) * 0.8), 0))
                pixel.green = UInt8(max(min(255, Double(pixel.green) * scale), 0))
                pixel.blue = UInt8(max(min(255, Double(pixel.blue) * 0.8), 0))
                
                pRGBAImage.pixels[index] = pixel
            }
        }
        if let image = pRGBAImage.toUIImage(){pUIImage = image}
        return self
    }

    public func applyBlueFilter(scale scale: Double)->imageProcessor{
        
        for y in 0..<pRGBAImage.height {
            for x in 0..<pRGBAImage.width {
                let index = y * pRGBAImage.width + x
                var pixel: Pixel = (pRGBAImage.pixels[index])
                
                pixel.red = UInt8(max(min(255, Double(pixel.red) * 0.8), 0))
                pixel.green = UInt8(max(min(255, Double(pixel.green) * 0.8), 0))
                pixel.blue = UInt8(max(min(255, Double(pixel.blue) * scale), 0))
                
                pRGBAImage.pixels[index] = pixel
            }
        }
        if let image = pRGBAImage.toUIImage(){pUIImage = image}
        return self
    }

    
    public func applyDefaultFilter(filterNameEnum filterName: colors)-> imageProcessor{
        switch filterName{
        case .Red:
            self.applyRedFilter(scale: 2.0)
            return self
        case .Green:
            self.applyGreenFilter(scale: 2.0)
            return self
        case .Blue:
            self.applyBlueFilter(scale: 2.0)
            return self
        }
    }
    
    public func applyDefaultFilter(filterNameString filterName: String){
    
    }

}





/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
public struct imageProcessorS {
    
    public var pUIImageS: UIImage
    public let pRGBAImageS: RGBAImage
    
    public init(file_name name: String) {
        pUIImageS = UIImage(imageLiteral: name)
        pRGBAImageS = RGBAImage(image: pUIImageS)!
    }
    
    
    public mutating func applySampleFilter(scale scale: Double){
        for y in 0..<pRGBAImageS.height {
            for x in 0..<pRGBAImageS.width {
                let index = y * pRGBAImageS.width + x
                var pixel: Pixel = (pRGBAImageS.pixels[index])
                
                pixel.red = UInt8(max(min(255, Double(pixel.red) * scale), 0))
                pixel.green = UInt8(max(min(255, Double(pixel.green) * scale), 0))
                pixel.blue = UInt8(max(min(255, Double(pixel.blue) * scale), 0))
                
                pRGBAImageS.pixels[index] = pixel
            }
        }
        if let image = pRGBAImageS.toUIImage(){
            pUIImageS = image
        }
    }
}

