//
//  ViewController.swift
//  SwiftVideoPlayer
//
//  Created by MacMini on 15/05/19.
//  Copyright Â© 2019 MacMini. All rights reserved.
//

import UIKit
import Photos
import AVKit

class VideoViewVC: UIViewController {
    
    @IBOutlet var videoView: UIView!
    var phasset: PHAsset?
    var player : AVPlayer!
    var url:URL?
    var avPlayerLayer : AVPlayerLayer!
    @IBOutlet var videoendTime: UILabel!
    @IBOutlet var videostartTime: UILabel!
    @IBOutlet var slider: CustomSlider!
    @IBOutlet var playPause: UIButton!
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet var uiviewTrailingConsrant: NSLayoutConstraint!
    @IBOutlet var uiViewLeadingConstant: NSLayoutConstraint!

    var stringUrl:String?
    var tabBtn = true
    @IBOutlet var fullScreen: UIButton!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
     
        slider.addTarget(self, action: #selector(VideoViewVC.updateTime(sender:)), for: .allEvents)
       
       // slider.isContinuous = true
      stringUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        let url1 = URL(string: stringUrl ?? "" )
        
        if let urll = url1 {
        getThumbNailFromImage(url: urll) { (thumbImage) in
            self.thumbImg.image = thumbImage
           }
         }
       playVedio()
  
    }
   
     func playVedio()
    {
        
              player = AVPlayer(url: URL(string: stringUrl ?? "")!)
       
              avPlayerLayer = AVPlayerLayer(player: player)
              avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
              avPlayerLayer.frame = videoView.layer.frame
              videoView.layer.addSublayer(avPlayerLayer)
              avPlayerLayer.frame = view.bounds
        
       
        player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (Time) -> Void in
            
              if let duration = self.player.currentItem?.duration {
                    
                    
                    let duration = CMTimeGetSeconds(duration),
                        time = CMTimeGetSeconds(Time)
                    let progress = (time/duration)
                    
                   var totalTime = Float(duration)
             //     let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
                    self.slider.maximumValue = totalTime
                    self.slider.minimumValue = 0
                    self.slider.value = Float(time)
                    let mins = duration / 60
                    let secs = duration.truncatingRemainder(dividingBy: 60)
                    let timeformatter = NumberFormatter()
                    timeformatter.minimumIntegerDigits = 2
                    timeformatter.minimumFractionDigits = 0
                    timeformatter.roundingMode = .down
                    guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else
                    {
                   return
                   }
                   self.videostartTime.font = self.videostartTime.font.withSize(0.0375 * UIScreen.main.bounds.width)
                   self.videoendTime.font = self.videoendTime.font.withSize(0.0375 * UIScreen.main.bounds.width)
                   self.videoendTime.text = "\(minsStr):\(secsStr)"
                
                
                    self.updateVideoSlider()
             
                }
        }
  }
   
    override func viewDidLayoutSubviews()
    {
      avPlayerLayer.frame = videoView.layer.bounds

    }
    
    
    @objc func updateVideoSlider()
    {
        thumbImg.isHidden = true
        if self.player.isPlaying
        {
            
            var currentValue = Float(slider.value)
          
            
            let mins = currentValue / 60
            let secs = currentValue.truncatingRemainder(dividingBy: 60)
            let timeformatter = NumberFormatter()
            timeformatter.minimumIntegerDigits = 2
            timeformatter.minimumFractionDigits = 0
            timeformatter.roundingMode = .down
            
           
            guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else
            {
           return
           }
           
  debugPrint("currect second",secsStr)
       
            if self.videostartTime.text! == "00:05"
            {
                self.playPause.isHidden = true
                self.slider.isHidden = true
                self.videostartTime.isHidden = true
                self.videoendTime.isHidden = true
                self.fullScreen.isHidden = true
            }
        
            self.videostartTime.text = "\(minsStr):\(secsStr)"
        }
            
}
   
    
    
    @IBAction func playPauseVideo(_ sender: UIButton) {
    
          if player.isPlaying
        {
            player.pause()
            playPause.setImage(UIImage(named: "playButn"), for: .normal)
        }else{
       
            if player.currentTime() == player.currentItem?.asset.duration
            {
                player.seek(to: CMTimeMake(value: 0, timescale: 1))
            }
        
            player.play()
            playPause.setImage(UIImage(named: "pushBtn"), for: .normal)
        }
    }
    
    
    @IBAction func tapBtn(_ sender: UIButton) {
        
        if tabBtn == true {
            self.playPause.isHidden = true
            self.playPause.isHidden = true
            self.slider.isHidden = true
            self.videostartTime.isHidden = true
            self.videoendTime.isHidden = true
            self.fullScreen.isHidden = true
            tabBtn = false
        }else{
            self.playPause.isHidden = false
            self.playPause.isHidden = false
            self.slider.isHidden = false
            self.videostartTime.isHidden = false
            self.videoendTime.isHidden = false
            self.fullScreen.isHidden = false
            tabBtn = true
        }
    }
    
    func getThumbNailFromImage(url:URL, completion: @escaping ((_ image:UIImage)-> Void))
    {
        DispatchQueue.global().async {
            let asset = AVAsset(url: url)
            let avAssetImagGanerator = AVAssetImageGenerator(asset: asset)
            avAssetImagGanerator.appliesPreferredTrackTransform = true
            
            let thumbnailTime = CMTimeMake(value: 7, timescale: 1)
            do{
                let cgThumbImage = try avAssetImagGanerator.copyCGImage(at: thumbnailTime, actualTime: nil)
                let thumbImage = UIImage(cgImage: cgThumbImage)
                DispatchQueue.main.async {
                    completion(thumbImage)
                }
                }catch{
                print("Error",error.localizedDescription)
            }
        }
    }
 
 

     
    @IBAction func videoSliderChanged(_ sender: UISlider) {
           
  
        var currentValue = Float(sender.value)
        
        
        let mins = currentValue / 60
        let secs = currentValue.truncatingRemainder(dividingBy: 60)
        let timeformatter = NumberFormatter()
        timeformatter.minimumIntegerDigits = 2
        timeformatter.minimumFractionDigits = 0
        timeformatter.roundingMode = .down
        
        guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else
        {
       return
       }
        self.videostartTime.text = "\(minsStr):\(secsStr)"
        
        let myTime = CMTime(seconds: Double(currentValue), preferredTimescale: 60000)
        player.seek(to: myTime, toleranceBefore: .zero, toleranceAfter: .zero)
       

        if player!.rate == 0
        {
           playPause.setImage(UIImage(named: "playButn"), for: .normal)
            player?.play()
      }
    }
    
    @objc func updateTime(sender: UISlider!) {
       
        
        var currentValue = Float(sender.value)
        DispatchQueue.main.async {
            self.player.pause()
            let mins = currentValue / 60
            let secs = currentValue.truncatingRemainder(dividingBy: 60)
            let timeformatter = NumberFormatter()
            timeformatter.minimumIntegerDigits = 2
            timeformatter.minimumFractionDigits = 0
            timeformatter.roundingMode = .down
            
            guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else
            {
           return
           }
       self.videostartTime.text = "\(minsStr):\(secsStr)"
        }
   }
    
    @IBAction func btnFullScreen(_ sender: UIButton)
    {
   performSegue(withIdentifier: "segue_fullscreen", sender: nil)
        
    }
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_fullscreen"
        {
            if let vc = segue.destination as? FullScreenVc
            {
                vc.url = URL(string: stringUrl ?? "")
                vc.player = player
                vc.avPlayerLayer = avPlayerLayer
            }
        }
    }
}

extension AVPlayer {
    
    var isPlaying: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }
    
}




class CustomSlider: UISlider {

    @IBInspectable var trackHeight: CGFloat = 3

    @IBInspectable var thumbRadius: CGFloat = 20
    

    // Custom thumb view which will be converted to UIImage
    // and set as thumb. You can customize it's colors, border, etc.
    private lazy var thumbView: UIView = {
        let thumb = UIView()
        thumb.backgroundColor = .yellow//thumbTintColor
        thumb.layer.borderWidth = 0.4
        thumb.layer.borderColor = UIColor.darkGray.cgColor
        return thumb
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
     //   let thumb = thumbImage(radius: thumbRadius)
        
        setThumbImage(UIImage.init(named: ""), for: .normal)
    }

    private func thumbImage(radius: CGFloat) -> UIImage {
        // Set proper frame
        // y: radius / 2 will correctly offset the thumb

        thumbView.frame = CGRect(x: 0, y: radius / 2, width: radius, height: radius)
        thumbView.layer.cornerRadius = radius / 2

        // Convert thumbView to UIImage
        // See this: https://stackoverflow.com/a/41288197/7235585

        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        return renderer.image { rendererContext in
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        // Set custom track height
        // As seen here: https://stackoverflow.com/a/49428606/7235585
        var newRect = super.trackRect(forBounds: bounds)
        newRect.size.height = trackHeight
        return newRect
    }

}



extension CGAffineTransform {

    static let ninetyDegreeRotation = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2))
}

extension AVPlayerLayer {

    var fullScreenAnimationDuration: TimeInterval {
        return 0.15
    }

    func minimizeToFrame(_ frame: CGRect) {
        UIView.animate(withDuration: fullScreenAnimationDuration) {
            self.setAffineTransform(.identity)
            self.frame = frame
        }
    }

    func goFullscreen() {
        UIView.animate(withDuration: fullScreenAnimationDuration) {
            self.setAffineTransform(.ninetyDegreeRotation)
            self.frame = UIScreen.main.bounds
        }
    }
}
