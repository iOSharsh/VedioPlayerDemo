// StylishUIView.Swift
//  PetPanion
//
//  Created by Manish on 02/04/20.
//  Copyright © 2020 Hand In Paw Ltd. All rights reserved.
//


import UIKit
//This is IbDesignable class used for different view to add the function from storyboard
@IBDesignable
class StylishUIView: UIView {

  @IBInspectable var  cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var circleView: Bool = false {
        didSet {
            if circleView{
            layer.cornerRadius = self.frame.width / 2
                cornerRadius = layer.cornerRadius
            } else {
                layer.cornerRadius = 0.0
                cornerRadius = layer.cornerRadius
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
   
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //layer.masksToBounds = false
    }

}
//MARK:- for Button
@IBDesignable
class StylishUIButton: UIButton{
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var circleView: Bool = false {
        didSet {
            if circleView{
                layer.cornerRadius = self.frame.width / 2
                cornerRadius = layer.cornerRadius
            } else {
                layer.cornerRadius = 0.0
                cornerRadius = layer.cornerRadius
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //layer.masksToBounds = false
    }
    
}
//MARK:- for Image
@IBDesignable
class StylishUIImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var circleView: Bool = false {
        didSet {
            if circleView{
                layer.cornerRadius = self.frame.width / 2
                cornerRadius = layer.cornerRadius
            } else {
                layer.cornerRadius = 0.0
                cornerRadius = layer.cornerRadius
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
  //      layer.masksToBounds = true
    }
    
}


//MARK:- for Label
@IBDesignable
class StylishUILabel: UILabel {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColorLabel: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColorLabel.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffsetLabel: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffsetLabel
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
 //       layer.masksToBounds = true
    }
    
}
//MARK:- for tableView
@IBDesignable
class StylishUITableView: UITableView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
      //  layer.masksToBounds = true
    }
    
}

//MARK:- for collectionView
@IBDesignable
class StylishUICollectionView: UICollectionView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     //   layer.masksToBounds = true
    }
    
}
//MARK:- for textfield
@IBDesignable
class StylishUITextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    //    layer.masksToBounds = true
    }
    
}
//MARK:- for TextView
@IBDesignable
class StylishUITextView: UITextView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     //   layer.masksToBounds = true
    }
    
}
//MARK:- for PickerView
@IBDesignable
class StylishUIPickerView: UIPickerView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     //   layer.masksToBounds = true
    }
    
}
//MARK:- for DatePicker
@IBDesignable
class StylishUIDatePicker: UIDatePicker {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            
            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //   layer.masksToBounds = true
    }
    
}

//MARK:- gradient
@IBDesignable
class StylishUIGradientView: UIView {
    
    // the gradient start colour
    @IBInspectable var startColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient end colour
    @IBInspectable var endColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient angle, in degrees anticlockwise from 0 (east/right)
    @IBInspectable var angle: CGFloat = 270 {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient layer
    private var gradient: CAGradientLayer?
    
    // initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        installGradient()
    }
    
    // Create a gradient and install it on the layer
    private func installGradient() {
        // if there's already a gradient installed on the layer, remove it
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        let gradient = createGradient()
        self.layer.addSublayer(gradient)
        self.gradient = gradient
    }
    
    // Update an existing gradient
    private func updateGradient() {
        if let gradient = self.gradient {
            let startColor = self.startColor ?? UIColor.clear
            let endColor = self.endColor ?? UIColor.clear
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            let (start, end) = gradientPointsForAngle(self.angle)
            gradient.startPoint = start
            gradient.endPoint = end
        }
    }
    
    // create gradient layer
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    // create vector pointing in direction of angle
    private func gradientPointsForAngle(_ angle: CGFloat) -> (CGPoint, CGPoint) {
        // get vector start and end points
        let end = pointForAngle(angle)
        //let start = pointForAngle(angle+180.0)
        let start = oppositePoint(end)
        // convert to gradient space
        let p0 = transformToGradientSpace(start)
        let p1 = transformToGradientSpace(end)
        return (p0, p1)
    }
    
    // get a point corresponding to the angle
    private func pointForAngle(_ angle: CGFloat) -> CGPoint {
        // convert degrees to radians
        let radians = angle * .pi / 180.0
        var x = cos(radians)
        var y = sin(radians)
        // (x,y) is in terms unit circle. Extrapolate to unit square to get full vector length
        if (fabs(x) > fabs(y)) {
            // extrapolate x to unit length
            x = x > 0 ? 1 : -1
            y = x * tan(radians)
        } else {
            // extrapolate y to unit length
            y = y > 0 ? 1 : -1
            x = y / tan(radians)
        }
        return CGPoint(x: x, y: y)
    }
    
    // transform point in unit space to gradient space
    private func transformToGradientSpace(_ point: CGPoint) -> CGPoint {
        // input point is in signed unit space: (-1,-1) to (1,1)
        // convert to gradient space: (0,0) to (1,1), with flipped Y axis
        return CGPoint(x: (point.x + 1) * 0.5, y: 1.0 - (point.y + 1) * 0.5)
    }
    
    // return the opposite point in the signed unit square
    private func oppositePoint(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: -point.x, y: -point.y)
    }
    
    // ensure the gradient gets initialized when the view is created in IB
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        installGradient()
        updateGradient()
    }
}
