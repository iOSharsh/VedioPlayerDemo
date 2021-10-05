//
//  FullScreenVc.swift
//  VedioPlayerDemo
//
//  Created by mac HD on 23/03/21.
//

import UIKit
import Photos
import AVKit

class FullScreenVc: UIViewController {
    
    @IBOutlet var videoView: UIView!
    var phasset: PHAsset?
    var player : AVPlayer!
    var url:URL?
    var avPlayerLayer : AVPlayerLayer!
    @IBOutlet var videoendTime: UILabel!
    @IBOutlet var videostartTime: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var playPause: UIButton!
    @IBOutlet weak var thumbImg: UIImageView!
    var avplayer:AVPlayerViewController!
    var videoTimer : Timer?
    
   
    
    
 

    override func viewDidLoad()
    {
        super.viewDidLoad()
    if let urll = url {
        getThumbNailFromImage(url: urll) { (thumbImage) in
            self.thumbImg.image = thumbImage
           }
         }
        DispatchQueue.main.async {
            self.playVedio()
        }
   }
    override func viewDidDisappear(_ animated: Bool) {
      
   
    }
    func playVedio()
    {
        
              
       // player = AVPlayer(url: url!)
              avPlayerLayer = AVPlayerLayer(player: player)
              avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
           //   view.addSubview(videoView)
              avPlayerLayer.frame = videoView.layer.frame
         
              videoView.layer.addSublayer(avPlayerLayer)
              avPlayerLayer.frame = view.bounds
        

              videoTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateVideoSlider), userInfo: nil, repeats: true)
              let currentTimeInSeconds = CMTimeGetSeconds((self.player.currentItem?.asset.duration)!)
              slider.maximumValue = Float(currentTimeInSeconds)
              slider.minimumValue = 0
              slider.value = 0
              
              let mins = currentTimeInSeconds / 60
              let secs = currentTimeInSeconds.truncatingRemainder(dividingBy: 60)
              let timeformatter = NumberFormatter()
              timeformatter.minimumIntegerDigits = 2
              timeformatter.minimumFractionDigits = 0
              timeformatter.roundingMode = .down
              guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else
              {
                  return
              }
      
     
              videostartTime.font = videostartTime.font.withSize(0.0375 * UIScreen.main.bounds.width)
              videoendTime.font = videoendTime.font.withSize(0.0375 * UIScreen.main.bounds.width)
              videoendTime.text = "\(minsStr):\(secsStr)"
              // Do any additional setup after loading the view, typically from a nib.
    }
   
    override func viewDidLayoutSubviews()
    {
      avPlayerLayer.frame = videoView.layer.bounds
        
        if UIDevice.current.orientation.isLandscape && !(UIDevice.current.orientation.isFlat) {
              let screenSize = UIScreen.main.bounds
              let screenWidth = screenSize.width
              let screenHeight = screenSize.height
              videoView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
              avPlayerLayer.frame = videoView.bounds
          }
        

    }
    
    
    @objc func updateVideoSlider()
    {
        thumbImg.isHidden = true
        if self.player.isPlaying
        {
            
            let currentTimeInSeconds = CMTimeGetSeconds(self.player.currentTime())
            slider.value = Float(currentTimeInSeconds)
            let mins = currentTimeInSeconds / 60
            let secs = currentTimeInSeconds.truncatingRemainder(dividingBy: 60)
            let timeformatter = NumberFormatter()
            timeformatter.minimumIntegerDigits = 2
            timeformatter.minimumFractionDigits = 0
            timeformatter.roundingMode = .down
            guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
                return
            }
            videostartTime.text = "\(minsStr):\(secsStr)"
        }
        if self.player.currentTime() >= (self.player.currentItem?.duration)! {
            slider.value = 0
            videostartTime.text = "00:00"
            playPause.setImage(UIImage(named: "playButn"), for: .normal)
            videoTimer?.invalidate()
        }
        
    }
    
    @IBAction func playPauseVideo(_ sender: UIButton) {
    
          if player.isPlaying
        {
            player.pause()
            playPause.setImage(UIImage(named: "playButn"), for: .normal)
        }else{
            videoTimer?.invalidate()
            if player.currentTime() == player.currentItem?.asset.duration
            {
                player.seek(to: CMTimeMake(value: 0, timescale: 1))
            }
            videoTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateVideoSlider), userInfo: nil, repeats: true)
            player.play();
            
            playPause.setImage(UIImage(named: "pushBtn"), for: .normal)
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
        videoTimer?.invalidate()
        videoTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateVideoSlider), userInfo: nil, repeats: true)
        let seconds : Int64 = Int64(sender.value)
        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
        
        player!.seek(to: targetTime)
        
        if player!.rate == 0
        {
            playPause.setImage(UIImage(named: "pushBtn"), for: .normal)
            player?.play()
        }
    }
    
    
    @IBAction func btnMinimizeScreen(_ sender: Any)
    {
        
        self.dismiss(animated: true, completion: nil)
    }
    
  
    
    @IBAction func Btnforwerd10Sec(_ sender: Any) {
        forwardVideo(by: 10)
    }
    
    
    @IBAction func btnBack10Sec(_ sender: Any) {
        rewindVideo(by: 10)
        
    }
    func rewindVideo(by seconds: Float64) {
       if let currentTime = player?.currentTime() {
           var newTime = CMTimeGetSeconds(currentTime) - seconds
           if newTime <= 0 {
               newTime = 0
           }
           player?.seek(to: CMTime(value: CMTimeValue(newTime * 1000), timescale: 1000))
       }
   }
  

   func forwardVideo(by seconds: Float64) {
       if let currentTime = player?.currentTime(), let duration = player?.currentItem?.duration {
           var newTime = CMTimeGetSeconds(currentTime) + seconds
           if newTime >= CMTimeGetSeconds(duration) {
               newTime = CMTimeGetSeconds(duration)
           }
           player?.seek(to: CMTime(value: CMTimeValue(newTime * 1000), timescale: 1000))
       }
    
}
}
extension AVPlayer {
    
    var isPlaying1: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }
    
}





