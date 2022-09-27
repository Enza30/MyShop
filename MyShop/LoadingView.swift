//
//  LoadingView.swift
//  MyShop
//
//  Created by Farendza Muda on 27/09/22.
//

import SwiftUI

struct LoadingView: View {
    let isLoading: Bool
    let error: NSError?
    let retryAction: (() -> ())?
    var body: some View {
        Group {
            if isLoading {
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        ProgressView()
                            .progressViewStyle((CircularProgressViewStyle(tint: .blue)))
                            .frame(width: 90, height: 90, alignment: .center)
                        Spacer()
                    }
                    Spacer()
                }
            } else if error != nil {
                Text("Can't load the products")
                if retryAction != nil {
                    Button(action: retryAction!) {
                        Text("Retry")
                    }
                }
            } else {
                EmptyView()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true, error: nil, retryAction: nil)
    }
}
