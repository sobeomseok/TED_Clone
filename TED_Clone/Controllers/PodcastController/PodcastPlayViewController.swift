//
//  PodcastPlayViewController.swift
//  TED_Clone
//
//  Created by 정덕호 on 2022/03/03.
//

import UIKit
import AVKit

class PodcastPlayViewController: UIViewController {
    var player: AVPlayer!
    var playerItem: AVPlayerItem!
    var playerItemContext = 0
    var playBool = true
    
    static var selectedNum = 0
    
    static var mp3SelectedNum = 0
    
    //MARK: - Properties
    
    private let detailImage: UIImageView = {
        let image = UIImageView()
        image.image = PodcastViewModel.imageList[selectedNum].image
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = PodcastViewModel.mp3NameList[mp3SelectedNum]
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private let sliderBar: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .red
        slider.maximumValue = 255
        slider.minimumValue = 0
        let image = UIImage(systemName: "circlebadge.fill")
        let imageColor = image?.imageWithColor(color: UIColor.red)
        slider.setThumbImage(imageColor, for: .normal)
        return slider
    }()
    
    private let TimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private let andTimeLabel: UILabel = {
        let label = UILabel()
        label.text = PodcastViewModel.mp3RunTimeList[mp3SelectedNum]
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    
    private let detailText: UITextView = {
       let textview = UITextView()
        textview.text = PodcastViewModel.mp3DetailText[mp3SelectedNum]
        textview.textColor = .white
        textview.backgroundColor = .clear
        textview.font = UIFont.systemFont(ofSize: 17)
        textview.isEditable = false
        textview.isSelectable = false
        return textview
    }()
    
    private lazy var timeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [TimeLabel,sliderBar,andTimeLabel])
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.axis = .horizontal
       return stack
    }()
    
    private let timeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowtriangle.forward.circle"), for: .normal)
        button.tintColor = .white
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50), forImageIn: .normal)
        button.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        return button
    }()
    
    private let goBackwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gobackward.15"), for: .normal)
        button.tintColor = .white
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 32), forImageIn: .normal)
        return button
    }()
    
    private let goForwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "goforward.15"), for: .normal)
        button.tintColor = .white
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 32), forImageIn: .normal)
        return button
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [goBackwardButton,timeButton,goForwardButton])
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.axis = .horizontal
        return stack
    }()
    
    private let indicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .large
        ai.color = .white
        ai.startAnimating()
        ai.backgroundColor = .backgroundColor
        return ai
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        tabBarController?.tabBar.isHidden = true
        
        navigationController?.navigationBar.topItem?.title = ""
        makeLayout()
        playMP3()
    }
    
    
    

    
    //MARK: - Helper Function
    
    func makeLayout() {
        view.addSubview(detailImage)
        detailImage.anchor(top:view.safeAreaLayoutGuide.topAnchor,left:view.leadingAnchor,paddingTop: 30,paddingLeft: 10,width: 150,height: 150)
        
        
        view.addSubview(nameLabel)
        nameLabel.anchor(top: detailImage.bottomAnchor,left: view.leadingAnchor,right:view.trailingAnchor,paddingTop: 20,paddingLeft: 10,paddingRight: 10)
        
        view.addSubview(detailText)
        detailText.anchor(top:nameLabel.bottomAnchor,left: view.leadingAnchor,right: view.trailingAnchor,paddingTop: 10,paddingLeft: 6,paddingRight: 10)
        
        sliderBar.anchor(width:view.frame.width - 150)
        view.addSubview(timeStack)
        timeStack.anchor(top: detailText.bottomAnchor,left: view.leadingAnchor,right: view.trailingAnchor,paddingTop: 60,paddingLeft: 10,paddingRight: 10)
    
        view.addSubview(buttonStack)
        buttonStack.anchor(top: timeStack.bottomAnchor,bottom: view.bottomAnchor,paddingTop: 100,paddingBottom: 50)
        buttonStack.centerX(inView: view)
        
        view.addSubview(indicatorView)
        indicatorView.anchor(width: view.frame.width, height: view.frame.height)
    }

    
    func playMP3() {
        let url = URL(string: PodcastViewModel.mp3URLList[PodcastPlayViewController.mp3SelectedNum])
        playerItem = AVPlayerItem(url: url!)
        playerItem.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.status), options: [.old, .new], context: &playerItemContext)
        player = AVPlayer(playerItem: playerItem)
        player.play()
        timeButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
    }
    
    @objc func playSound() {
        if playBool {
            player.pause()
            playBool = false
            timeButton.setImage(UIImage(systemName: "arrowtriangle.forward.circle"), for: .normal)
        } else {
            player.play()
            playBool = true
            timeButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        }
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &playerItemContext else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        if keyPath == #keyPath(AVPlayerItem.status) {
            let status: AVPlayerItem.Status
            if let statusNumber = change?[.newKey] as? NSNumber {
                status = AVPlayerItem.Status(rawValue: statusNumber.intValue)!
            } else {
                status = .unknown
            }
            
            switch status {
            case .readyToPlay:
                print("qwqweq")
                indicatorView.stopAnimating()
                indicatorView.isHidden = true
            case .failed:
                print("재생에 실패하얐습니다.")
            case .unknown:
                print("재생할 아이템이없습니다.")
            @unknown default:
                break
            }

        }
    }
    
    
    
    
}









//MARK: - UI이미지 색 조정 확장
extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()

        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
