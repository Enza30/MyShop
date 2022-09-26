//
//  ProductItem.swift
//  MyShop
//
//  Created by Farendza Muda on 22/09/22.
//

import SwiftUI

struct ProductItem: View {
    let product: Product
    var body: some View {
        ZStack{
            HStack{
                ZStack{
                    ImageItem(urlImage: product.URLImage)
                        .padding(.all)
                    Text("$ \(product.price.format(f: ".2"))")
                        .foregroundColor(Color.black)
                        .bold()
                        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                        
                }.background(Color.cellColor)
                VStack(alignment: .leading, spacing: 10.0){
                    Text(product.title)
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .bold()
                        .lineLimit(2)
                    Text(product.description)
                        .font(.system(size: 10))
                        .lineLimit(5)
                    Text("★ \(product.rating.rate.format(f: ".1"))")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                }
            }
//            Color.cellColor
//                .blendMode(.overlay)
        }.frame(height: 180)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.5), radius: 4, x: 1, y: 2)
    }
}

struct ImageItem: View {
    @StateObject private var loadImage = LoadImage()
    let urlImage: URL
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.clear)
                .frame(width: 120, height: 150)
            if loadImage.image != nil {
                HStack(){
                    Image(uiImage: loadImage.image!)
                        .resizable()
                        .compositingGroup()
                        .frame(width: 120.0, height: 150.0)
//                        .aspectRatio(contentMode: .fit)
                }
                
                
            }
        }
        .onAppear{
                loadImage.loadImage(with: urlImage)
            }
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: Product.sample[0])
    }
}
