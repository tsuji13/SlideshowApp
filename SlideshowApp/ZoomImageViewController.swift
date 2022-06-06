//
//  ZoomImageViewController.swift
//  SlideshowApp
//
//  Created by kaihatsu on 2022/06/06.
//

import UIKit



class ZoomImageViewController: UIViewController {
        
    @IBOutlet weak var zoomImageView: UIImageView!
    
    var zoomImageFromSlideImage: UIImage?
    var zoomImageSlideNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        zoomImageView.image = zoomImageFromSlideImage!        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
