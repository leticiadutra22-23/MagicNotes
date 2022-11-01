//
//  WriteNoteView.swift
//  MagicNotes
//
//  Created by Maria Letícia Dutra de Oliveira on 01/11/22.
//

import SwiftUI

struct WriteNoteView: View {

    @EnvironmentObject var notes: Notes
    @State public var placeholder = ""

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
                                .frame(height: 400)
                        }
                    }
                }.background(.clear)

                Button {
                    notes.addNote(content: placeholder)
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.white)
                            .background(Color(red: 39/255, green: 11/255, blue: 46/255)).cornerRadius(50)
                }
            }
        }
    }
}

struct WriteNoteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteNoteView()
            .environmentObject(Notes())
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
