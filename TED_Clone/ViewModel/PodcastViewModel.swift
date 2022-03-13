//
//  PodcastViewmodel.swift
//  TED_Clone
//
//  Created by 정덕호 on 2022/03/11.
//

import AVKit
import UIKit

class PodcastViewModel {
    
    static var podcastModel: PodcastModel?
    
    static var imageList: [UIImageView] = []
    
    static var nameList: [String] = []
    
    static var detailTextList: [String] = []
    
    static var mp3URLList: [String] = []
    
    static var mp3NameList: [String] = []
    
    static var mp3RunTimeList: [String] = []
    
    static var mp3TimeList: [String] = []
    
    static var mp3DetailText: [String] = []
    
    static func fetch() {
        PodcastAPI.fetch { model in
            guard let url = URL(string: model.image ?? "") else {return}
            let image = UIImageView()
            image.downloaded(from: url)
            nameList.append(model.name ?? "")
            imageList.append(image)
            detailTextList.append(model.detailText ?? "")
        }
    }
    
    static func mp3Fetch() {
        PodcastAPI.mp3Fetch { model in
            mp3URLList.append(model.mp3URL ?? "")
            mp3NameList.append(model.name ?? "")
            mp3RunTimeList.append(model.runTime ?? "")
            mp3TimeList.append(model.time ?? "")
            mp3DetailText.append(model.detailText ?? "")
        }
    }
    
    
}
            

 
