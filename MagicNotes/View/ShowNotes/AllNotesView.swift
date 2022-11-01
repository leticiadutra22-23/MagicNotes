//
//  AllNotesView.swift
//  MagicNotes
//
//  Created by Maria Letícia Dutra de Oliveira on 01/11/22.
//

import SwiftUI

struct AllNotesView: View {

    @EnvironmentObject var notes: Notes

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
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 80)
                        .cornerRadius(50)
                        .foregroundColor(.white)
                        .position(x: 100, y: 85)

                    Text("Notas")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 39/255, green: 11/255, blue: 46/255))
                        .position(x: 100, y: 85)
                }

                List {
                    ForEach(notes.notes) { note in
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.white)
                                .frame(width: 360)

                            VStack(alignment: .leading) {
                                Text (note.dateStamp)
                                    .foregroundColor(Color(red: 39/255, green: 11/255, blue: 46/255))
                                //                            .background(Color(red: 39/255, green: 11/255, blue: 46/255))
                                    .font(.headline)
                                Text(note.content)
                                    .font(.body)
                                    .padding(.vertical)
                            }
                        }
                    }.listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .position(x: 195)
            }
        }
    }
}

struct AllNotesView_Previews: PreviewProvider {
    static var previews: some View {
        AllNotesView()
            .environmentObject(Notes())
    }
}
