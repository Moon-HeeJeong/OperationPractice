//
//  ContentVM.swift
//  OperationPractice
//
//  Created by LittleFoxiOSDeveloper on 12/6/23.
//

import Foundation
import Combine
import SwiftUI

struct ListData: Hashable{
    var idx: Int
    var image: Image?
    var resultStr: String
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(idx)
    }
}

class ContentVM: ObservableObject{
    
    var urlStrs: [String] = ["https://cdn.littlefox.co.kr/phonicsworks/flashcard/image/card_front_alligator.jpg",
                             "https://cdn.littlefox.co.kr/phonicsworks/flashcard/image/card_back_alligator.jpg",
                             "https://cdn.littlefox.co.kr/phonicsworks/flashcard/image/card_front_alligator.jpg",
                             "https://cdn.littlefox.co.kr/phonicsworks/flashcard/image/card_front_alligator.jg"
    ]
    
    @Published var imageDatas: [ListData] = []
    
    var cancellables = Set<AnyCancellable>()
    
    
    
    func getImageData(){
        imageDatas.removeAll()
        imageDatas = []
        
        for i in 0..<urlStrs.count {
            
            DownloadCenter.default.loadImage(urlStr: urlStrs[i])
                .sink { res in
                switch res {
                case .success(let image):
                    self.imageDatas.append(ListData(idx: i+1, image: image, resultStr: "success"))
                case .error(let err):
                    self.imageDatas.append(ListData(idx: i+1, image: nil, resultStr: err.message))
                }
            }.store(in: &self.cancellables)
        }
    }
}
