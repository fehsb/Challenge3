//

import Foundation
import UIKit

//UI Constants
let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height



//Random number generator
func randomNumber(#minX:UInt32, #maxX:UInt32) -> Int {
    let result = (arc4random() % (maxX - minX + 1)) + minX
    return Int(result)
}

let TileMargin: CGFloat = 20.0

var auxFontHUD = UIFont(name:"Comic Andy", size: 62.0)
var auxFontHUDBig = UIFont(name:"Comic Andy", size:120.0)

let FontHUD = auxFontHUD!
let FontHUDBig = auxFontHUDBig!
// Sound effects
let SoundDing = "ding.mp3"
let SoundWrong = "wrong.m4a"
let SoundWin = "win.mp3"
let AudioEffectFiles = [SoundDing, SoundWrong, SoundWin]
