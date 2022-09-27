//
//  CategoryPicker.swift
//  MyShop
//
//  Created by Farendza Muda on 27/09/22.
//

import SwiftUI

struct CategoryPicker: View {
    @Binding var choosenCategory: ProductEndPoint
    var body: some View {
        HStack(spacing: 0){
            ForEach(ProductEndPoint.allCases, id: \.self){ category in
                VStack{
                    Button(action: {
                        withAnimation(.spring()){
                            choosenCategory = category
                        }
                    }) {
                        Text(category.rawValue)
                            .bold()
                            .font(.caption2)
                            .padding(8)
                            .multilineTextAlignment(.center)
                            .foregroundColor(choosenCategory == category ? .white: .accentColor)
                    }
                    .frame(height: 40)
                    .background(choosenCategory == category ? Color.accentColor: Color.secondary)
                    .cornerRadius(25)
                }
            }
        }
        .frame(height: 40)
        .background(Color.secondary)
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0.0, y: 0.0)
    }
}

struct CategoryPicker_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPicker(choosenCategory: .constant(.all))
    }
}
