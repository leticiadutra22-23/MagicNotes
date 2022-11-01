//
//  AddNoteView.swift
//  MagicNotes
//
//  Created by Maria Letícia Dutra de Oliveira on 31/10/22.
//

import SwiftUI

struct TabBar: View {
    @State var selectedtab = "add"
    @StateObject var notes = Notes()

    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var xAxis: CGFloat = 0
    @Namespace var animation

    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedtab){
                AddNoteView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("write")
                AllNotesView()
                    .environmentObject(notes)
                    .tag("notes")
                Color.white
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("favs")
            }

            HStack(spacing: 0){
                ForEach(icons, id: \.self){ image in

                    GeometryReader {proxy in
                        Button(action: {
                            withAnimation(.spring()){
                                selectedtab = image
                                xAxis = proxy.frame(in: .global).minX
                            }
                        }, label: {
                            Image(image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .foregroundColor(selectedtab == image ? getColor(image: image) : Color(red: 67/255, green: 45/255, blue: 85/255))
                                .padding(selectedtab == image  ? 12 : 0)
                                .background(Color(red: 67/255, green: 45/255, blue: 85/255).opacity(selectedtab == image  ? 1 : 0)).clipShape(Circle())
                                .matchedGeometryEffect(id: image, in: animation)
                                .offset(x: selectedtab == image ? (proxy.frame(in: .global).minX - proxy.frame(in: .global).midX) : 0,y: selectedtab == image  ? -55 : 0)
                    })
                        .onAppear(perform: {
                            if image == icons.first {
                                xAxis = proxy.frame(in: .global).minX
                            }
                        })
                    }.frame(width: 30, height: 35)

                    if image != icons.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(Color(red: 217/255, green: 217/255, blue: 217).clipShape(CustomShape(xAxis: xAxis)).cornerRadius(25))
            .padding(.horizontal)

            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }

    func getColor(image: String) -> Color{
        switch image {
        case "write":
            return Color.white
        case "notes":
            return Color.white
        case "favs":
            return Color.white
        default:
            return Color(red: 67/255, green: 45/255, blue: 85/255)
        }
    }
}

var icons = ["write", "notes", "favs"]

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
