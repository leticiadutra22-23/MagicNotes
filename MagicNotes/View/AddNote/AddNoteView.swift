//
//  AddNoteView.swift
//  MagicNotes
//
//  Created by Maria Letícia Dutra de Oliveira on 01/11/22.
//

import SwiftUI

struct AddNoteView: View {
    @State private var sheetIsShowing = false

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                ZStack {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                }
            }
            VStack {
                Text("Quais foram as suas experiências mágicas hoje?")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)

                Spacer().frame(height: 110)

                Button {
                    withAnimation {
                        self.sheetIsShowing.toggle()
                    }
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color(red: 39/255, green: 11/255, blue: 46/255))
                        .background(.white).cornerRadius(50)
                }
            }
        }.sheet(isPresented: $sheetIsShowing){
            WriteNoteView()
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
