//
//  ProductDetail.swift
//  MyShop
//
//  Created by Farendza Muda on 24/09/22.
//

import SwiftUI

struct ProductDetail: View {
    @Environment(\.presentationMode) var presentation
    @State private var quantity: Int = 1
    let product: Product
    var body: some View {
        ZStack{
            Color.backgroundColor.edgesIgnoringSafeArea(.bottom)
            VStack{
                Spacer()
                HStack{
                    Button(action: { presentation
                        .wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark")
                            .padding(8)
                            .background(Color.cellColor)
                            .clipShape(Circle())
                    }
                    Spacer()
                }.padding()
                ProductImage(urlImage: product.URLImage).padding(.top)
                ZStack{
                    Color.backgroundColor
                        .edgesIgnoringSafeArea(.bottom)
                        .cornerRadius(25)
                        .shadow(color: .accentColor.opacity(0.2), radius: 3, x: 0.0, y: 0.0)
                    VStack(spacing: 0){
                        Text(product.title)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(24)
                        Text("$\(product.price.format(f: ".02"))")
                            .font(.headline)
                        HStack(spacing: 2){
                            Text("★ \(product.rating.rate.format(f: "0.1"))")
                                .font(.title3)
                            Text("\(product.rating.countRate)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .offset(y: 3)
                        }
                        .padding(8)
                        Text(product.description)
                            .foregroundColor(.secondary)
                            .padding()
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }.edgesIgnoringSafeArea(.bottom)
                Spacer()
            }
        }.navigationBarTitleDisplayMode(.large)
    }
}

struct ProductImage: View {
    @StateObject private var loadImage = LoadImage()
    let urlImage: URL
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 260, height: 300, alignment: .center)
                .cornerRadius(18)
                .overlay(
                    ZStack{
                        ProgressView()
                        if loadImage.image != nil {
                            HStack{
                                Spacer()
                                Image(uiImage: loadImage.image!)
                                    .resizable()
                                    .compositingGroup()
                                    .clipped(antialiased: true)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(15)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                )
        }.cornerRadius(15)
            .onAppear {
                loadImage.loadImage(with: urlImage)
            }
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(product: Product.sample[5])
    }
}
