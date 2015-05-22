

import UIKit

class HUDView: UIView {
  
  //var stopwatch: StopwatchView
//  var gamePoints: CounterLabelView
  
  var hintButton: UIButton!
  
  //this should never be called
  required init(coder aDecoder:NSCoder) {
    fatalError("use init(frame:")
  }
  
  override init(frame:CGRect) {
   // self.stopwatch = StopwatchView(frame:CGRectMake(ScreenWidth/2-150, 0, 300, 100))
   // self.stopwatch.setSeconds(0)
    
    //the dynamic points label
//    self.gamePoints = CounterLabelView(font: FontHUD, frame: CGRectMake(ScreenWidth-200, 30, 200, 70))
//    gamePoints.textColor = UIColor(red: 0.38, green: 0.098, blue: 0.035, alpha: 1)
//    gamePoints.value = 0
    
    super.init(frame:frame)
    
//    self.addSubview(gamePoints)
    
    //"points" label
// --------------------
//    var pointsLabel = UILabel(frame: CGRectMake(ScreenWidth-340, 30, 140, 70))
//    pointsLabel.backgroundColor = UIColor.clearColor()
//    pointsLabel.font = FontHUD
//    pointsLabel.text = " Points:"
//    self.addSubview(pointsLabel)
    
   // self.addSubview(self.stopwatch)
    
    self.userInteractionEnabled = true
    
    //load the button image
    let hintButtonImage = UIImage(named: "btn")!
    
    //the help button
    self.hintButton = UIButton.buttonWithType(.Custom) as! UIButton
    hintButton.setTitle("Hint!", forState:.Normal)
    hintButton.titleLabel?.font = FontHUD
    hintButton.setBackgroundImage(hintButtonImage, forState: .Normal)
    hintButton.frame = CGRectMake(ScreenWidth/2 - hintButtonImage.size.width/2, ScreenHeight - (hintButtonImage.size.height + 80), hintButtonImage.size.width, hintButtonImage.size.height)
    hintButton.alpha = 1.0
    self.addSubview(hintButton)
  }
  
  override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
    //1 let touches through and only catch the ones on buttons
    let hitView = super.hitTest(point, withEvent: event)
    
    //2
    if hitView is UIButton {
      return hitView
    }
    
    //3
    return nil
  }
  
}
