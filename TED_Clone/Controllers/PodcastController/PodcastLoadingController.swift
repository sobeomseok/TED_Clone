//
//  ViewController.swift
//  TED_Clone
//
//  Created by 정덕호 on 2022/03/13.
//

import UIKit

class PodcastLoadingController: UIViewController {

    //MARK: - 속성
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "loadingimage")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.anchor(width: view.frame.width, height: view.frame.height)
    }
    


}
