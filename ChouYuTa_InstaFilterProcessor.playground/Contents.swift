
import UIKit



//Requirement 1 & 2 : 
//「Be able to apply a filter formula to each pixel of the image. The formula should have parameters that can be modified so that the filter can have a small or large effect on the image.」

let lady = imageProcessor(file_name: "sample.png")
lady.pUIImage

//Requirement 3 :
//「Be able to apply several different filters to the image, in a specific order (e.g. a ‘pipeline of filters’).」
lady.pRGBAImage
lady.brightness(multipleBy: 1.5).applyRedFilter(scale: 1.2)
lady.pUIImage



//requirement 4 :
//「Have some method or interface to apply default filter formulas and parameters that can be accessed by name.」

let ladyRedDefault = imageProcessor(file_name: "sample.png")
ladyRedDefault.applyDefaultFilter(filterNameEnum: .Red)

let ladyGreenDefault = imageProcessor(file_name: "sample.png")
ladyGreenDefault.applyDefaultFilter(filterNameEnum: .Green)


let ladyBlueDefault = imageProcessor(file_name: "sample.png")
ladyBlueDefault.applyDefaultFilter(filterNameEnum: .Blue)


var ladyS = imageProcessorS(file_name: "sample.png")
ladyS.pUIImageS
ladyS.applySampleFilter(scale: 0.5)


