//
//  CardView.swift
//  Hike
//
//  Created by Patrick Masterson on 6/23/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - properties
    @State private var imageNumber = 1
    @State private var randomNumber = 1
    
    // MARK: - Functions
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                        )
                        Spacer()
                        Button {
                            // action show a sheet
                            print("button pressed")
                        } label: {
                            CustomButtonView()
                        }
                    } // : HStack
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: VStack - header
                .padding(.horizontal, 30)
                
                // MARK: - Main Content
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                // MARK: - Footer
                Button(action: {
                    randomImage()
                }) {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        ) // foregroundStyle
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y:2)
                }
                .buttonStyle(GradientButton())
            }
        } //: Card
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
