//
//  ContentView.swift
//  OperationPractice
//
//  Created by LittleFoxiOSDeveloper on 11/1/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var viewModel = ContentVM()
    
    var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        
        VStack {
            ForEach(viewModel.urlStrs, id: \.self){ value in
                HStack(content: {
                    
                    MHImage(urlStr: value, isUseIndicator: true, defaultImage: Image(systemName: "photo"))
//                        .setOptions(isUseIndicator: true, isUseDefaultImage: true)
                })
            }
                
        }
        .padding()
    }
    
//    var body: some View {
//        
//        VStack {
//            
//            ForEach($viewModel.imageDatas, id: \.self) { value in
//                HStack(content: {
////                    Text("\(value.idx.wrappedValue)")
//                    
//                    value.image.wrappedValue?
//                        .resizable()
//                    Spacer()
//                    Text(value.resultStr.wrappedValue)
//                })
//                }
//        }
//        .padding()
//        .onAppear {
//            self.viewModel.getImageData()
//        }
//    }
}

#Preview {
    ContentView()
}
