//
//  ViewController.swift
//  SlideshowApp
//
//  Created by kaihatsu on 2022/06/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var slideButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var slideImage: UIImageView!
    
    var timer: Timer!
    let slideImageArray = ["海","公園","向日葵","並木通り"]
    /*スライドショーに使用する画像の配列*/
    
    var slideNo = 0
    var numOfArray = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideImage.image = UIImage(named: slideImageArray[slideNo])
        numOfArray = slideImageArray.count
        
        // Do any additional setup after loading the view.

        slideButton.titleLabel?.adjustsFontSizeToFitWidth = true
        nextButton.titleLabel?.adjustsFontSizeToFitWidth =  true
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        slideImage.isUserInteractionEnabled = true
    }
    
    
    @objc func updateTimer(_ timer: Timer){
        
        slideNo += 1
        if(slideNo==numOfArray){slideNo = 0}
        let displaySlide = slideImageArray[slideNo]
        slideImage.image = UIImage(named: displaySlide)
    
    }
    
    @IBAction func slideShowButton(_ sender: Any){
        
        checkTimer()
    }
    
    @IBAction func nextProgressButton(_ sender: Any){
        
        slideNo += 1
        
        if(slideNo==numOfArray){slideNo = 0}
        
        let displaySlide = slideImageArray[slideNo]
        slideImage.image = UIImage(named: displaySlide)
        
    }
    
    @IBAction func previousBackButton(_ sender: Any){
        
        //self.timer_sec = 0
        //slideImageArray = displayImage.count
        //self.timerLabel.text  = String(format: "%.1f", self.timer_sec)
        
        if slideNo >= 0 {slideNo -= 1}/**/
        //slideNo -= 1
        
        if(slideNo < 0){slideNo = numOfArray - 1}
        //配列slideImageArrayの個数を取得するが配列は0から数えるため実質的には個数-1が配列の要素番号
        
        let displaySlide = slideImageArray[slideNo]
        slideImage.image = UIImage(named: displaySlide)
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let zoomImageViewController: ZoomImageViewController = segue.destination as! ZoomImageViewController

        zoomImageViewController.zoomImageFromSlideImage = UIImage(named: slideImageArray[slideNo])
        zoomImageViewController.zoomImageSlideNo = slideNo
         
        if self.timer != nil{
            self.timer.invalidate()
                self.timer = nil
                buttonStatusWhenStoppedSlideShow()
        }
        
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        let backZoomViewController: ZoomImageViewController = segue.source as! ZoomImageViewController
        
        slideImage.image = UIImage(named: slideImageArray[backZoomViewController.zoomImageSlideNo])
        
    }
    
    func checkTimer(){
        
        if self.timer == nil{
        
            self.timer = Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            buttonStatusWhenOperatingSlideShow()
            
        }
        
        else{
             self.timer.invalidate()
             self.timer = nil
             buttonStatusWhenStoppedSlideShow()
        }
    }
    
    
    func buttonStatusWhenStoppedSlideShow(){
        slideButton.isEnabled = true
        nextButton.isEnabled = true
        backButton.isEnabled = true
        //pauseButton.setTitle("stopping", for: .normal)
        slideButton.setTitle("開始", for: .normal)
        
    }
    func buttonStatusWhenOperatingSlideShow(){
        nextButton.isEnabled = false//ボタンをアクティブにする
        backButton.isEnabled = false
        //pauseButton.setTitle("stop", for: .normal)//.setTitleでボタンラベル表示を変更
        slideButton.setTitle("停止", for: .normal)
        
    }
    
    
}
