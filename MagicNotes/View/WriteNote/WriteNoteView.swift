//
//  WriteNoteView.swift
//  MagicNotes
//
//  Created by Maria Letícia Dutra de Oliveira on 01/11/22.
//

import SwiftUI

struct WriteNoteView: View {

    @State public var placeholder = ""
    @EnvironmentObject var notes: Notes
    @Environment (\.dismiss) var dismiss

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

            VStack(alignment: .trailing) {

                Form {
                    Section {
                        ZStack {
                            TextEditor(text: $placeholder)
                                .frame(height: 500)
                        }
                    }
                }.background(.clear)
                .scrollContentBackground(.hidden)
                .position(x: 197, y: 370)

                Button {
                    notes.addNote(content: placeholder)
                    dismiss()
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.white)
                            .background(Color(red: 39/255, green: 11/255, blue: 46/255)).cornerRadius(50)
                    }.position(x: 345, y: 170)
            }
        }
    }
}

struct TextEditorComponent: View {

    @State public var placeholder = ""

    var body: some View {
        NavigationView {
            TextEditor(text: $placeholder)
                .foregroundColor(.black)
                .padding(.horizontal)
                .cornerRadius(25)
        }
    }
}


struct WriteNoteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteNoteView()
            .environmentObject(Notes())
    }
}
