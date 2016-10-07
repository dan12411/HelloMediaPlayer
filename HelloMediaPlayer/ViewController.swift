//
//  ViewController.swift
//  HelloMediaPlayer
//
//  Created by 洪德晟 on 2016/10/6.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

/// 1. 匯入函式庫
import MediaPlayer

/// 2. 服從MPMediaPickerControllerDelegate
class ViewController: UIViewController, MPMediaPickerControllerDelegate {

    /// 8. or 7-1. 產生 musicPlayer
    var musicPlayer: MPMusicPlayerController?
    
    /////////////////////
    //// Stop Button ////
    /////////////////////
    /// 9. 停止播放音樂
    @IBAction func stopMusic(_ sender: UIButton) {
        musicPlayer?.stop()
    }
    
    /////////////////////
    //// Play Button ////
    /////////////////////
    @IBAction func myPlay(_ sender: UIButton) {
        
        /// 3. 產生讓使用者選音樂的MediaPlayer
        let mediaPicker = MPMediaPickerController(mediaTypes: .anyAudio)
        
        /// 4. 連結代理人為自己
        mediaPicker.delegate = self
        
        /// 5. 推出MediaPicker
        present(mediaPicker, animated: true, completion: nil)
    }
    
    /// 6. 使用者按下Cancel，把MediaPicker收起來
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    /// 7. 使用者選到某首歌，就開始播放音樂
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        /// 7-1. 生出播放音樂的 music player
        musicPlayer = MPMusicPlayerController.applicationMusicPlayer()
        /// 7-2. 設定播放曲目，是使用者選到的音樂
        musicPlayer?.setQueue(with: mediaItemCollection)
        /// 7-3. 播放音樂
        musicPlayer?.play()
        /// 7-4. 把選音樂的 media picker收起來
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

