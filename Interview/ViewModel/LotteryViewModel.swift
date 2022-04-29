//
//  LotteryViewModel.swift
//  Interview
//
//  Created by Brenda on 2022/4/25.
//

import Foundation
import UIKit

struct Lottery {
    let value: Int
    let textValue: String
    let type: LotteryType
    var isSelected: Bool
    var bgColor: UIColor//?
    var textColor: UIColor//?
}
/// logic
//red i 1,2, 7,8, 12, 13 ,18,19 ,23,24 , 29, 30 , 34 ,35, 40 ,45  x,x+1 -> +6 -> x+6,x+7 -> +5 ->x+11,x+12///
//total%2 == 0 : +5 : +6
//green 5,6,11,16,17,21,22,27,28,32,33,38,39,43,44,49/////11.49
//+6, +5+6, +5 , +5+6 + 5,+6,
//blue 3,4,9,10,14,15,20,25,26,31,36,37,41,42,47,48//20.31
   
///2    2   2                           2       2         1                    2          2        2                   2           1     2                  2        2        2               1          2           2          2          2         1
/*red blue green 6   red blue green 5   red blue green 6   red blue green 5 red blue green 6 red blue green 5 red blue green 5*/
  //red: x, x+1
//49/11 =  4 pair + 5
enum LotteryType {
    
    case red, green, blue
    
    
    static func getType(value: Int) -> LotteryType {
        switch value {
        case 1, 2, 7, 8, 12, 13 , 18, 19, 23, 24 , 29, 30 , 34 , 35, 40 , 45, 46:
            return .red
        case 5, 6, 11, 16, 17, 21, 22, 27, 28, 32, 33, 38, 39, 43, 44, 49:
            return .green
        default:// 3,4,9,10,14,15,20,25,26,31,36,37,41,42,47,48:
            return .blue
        }
    }
    var bgColor: UIColor {
        switch self {
        case .red:
            return .collection_bgRed
        case .green:
            return .collection_bgGreen
        case .blue:
            return .collection_bgBlue
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .red:
            return .collection_red
        case .green:
            return .collection_green
        case .blue:
            return .collection_blue
        }
    }
}

class LotteryViewModel {
    
    var lotteryArray = [Lottery]()
    
    init() {
        //initializer...
        var array = [Lottery]()
        for i in 0 ..< 50 {
            let lottery = Lottery(value: i, textValue: String(format: "%2d", arguments: [i]), type: LotteryType.getType(value: i), isSelected: false, bgColor: LotteryType.getType(value: i).bgColor, textColor: LotteryType.getType(value: i).textColor)
            array.append(lottery)
        }
        
        self.lotteryArray = array
    }
    
    func cellSelected(index: Int) {
        
        lotteryArray[index].isSelected.toggle()
        
        
        //if selected cell the background color set to the textColor of cell, otherwise, set to original one
        lotteryArray[index].bgColor = lotteryArray[index].isSelected == true ? lotteryArray[index].type.textColor : lotteryArray[index].type.bgColor
        lotteryArray[index].textColor = lotteryArray[index].isSelected == true ? .white : lotteryArray[index].type.textColor
        
    }
}
