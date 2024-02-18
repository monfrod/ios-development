import UIKit
import PlaygroundSupport

// размеры прямоугольной области
let sizeOfArea = CGSize(width: 400, height: 400)
// создание экземпляра
var area = SquareArea(size: sizeOfArea, color: UIColor.gray)
area.setBalls(withColors: [UIColor.red], andRadius: 39)
// установка экземпляра в качестве текущего отображения
PlaygroundPage.current.liveView = area
