//
//  ViewController.swift
//  VedioPlayerDemo
//
//  Created by mac on 22/03/21.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

   @IBOutlet weak var uiViewForPlayVedio: UIView!
   @IBOutlet weak var playBtn: UIButton!
   @IBOutlet weak var thumbImg: UIImageView!
  
    var player:AVPlayer!
   var playerViewController = AVPlayerViewController()
    var url:String?
          
       
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
        url = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        let url1 = URL(string: url ?? "" )
        
        if let urll = url1 {
        getThumbNailFromImage(url: urll) { (thumbImage) in
            self.thumbImg.image = thumbImage
           }
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
    func demoVedioPlay()
    {
        let videoURL = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    func playVedio()
    {
       let url1 = URL(string: url ?? "" )
        if let urll = url1 {
          let player = AVPlayer(url: urll)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.uiViewForPlayVedio.bounds
            playerLayer.videoGravity = .resizeAspectFill
            self.uiViewForPlayVedio.layer.addSublayer(playerLayer)
            player.play()
   
            
         }
       

    }

    @IBAction func btnPlayAction(_ sender: UIButton)
    {
    //  playVedio()
        self.csdd()
    }
   
    func csdd(){
        let videoURL = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
            // Create an AVAsset
            let videoAsset = AVAsset(url: videoURL!)
            // Create an AVPlayerItem with asset
            let videoPlayerItem = AVPlayerItem(asset: videoAsset)
            // Initialize player with the AVPlayerItem instance.
            let player = AVPlayer(playerItem: videoPlayerItem)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.uiViewForPlayVedio.bounds
            self.uiViewForPlayVedio.layer.addSublayer(playerLayer)
            player.play()
    }
    
    
}

