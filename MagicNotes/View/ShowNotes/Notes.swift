//
//  Notes.swift
//  MagicNotes
//
//  Created by Maria Letícia Dutra de Oliveira on 01/11/22.
//

import SwiftUI
import Foundation


struct Note: Codable, Identifiable {
    var id = UUID.self()
    var dateStamp: String
    var content: String
}

@MainActor class Notes: ObservableObject {
    private let NOTES_KEY = "keytonotes"
    let date = Date()

    var notes: [Note] {
        didSet {
            saveData()
            objectWillChange.send()
        }
    }

    init() {
        if let data = UserDefaults.standard.data(forKey: NOTES_KEY){
            if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data){
                notes = decodedNotes
                return
            }
        }
        notes = [Note(dateStamp: date.getFormattedDate(format: "dd/MM"), content: "Escreva sobre suas experiências mágicas, principalmente se for um bruxo iniciante!")]
    }

    func addNote(content: String){
        let tempNote = Note(dateStamp: date.getFormattedDate(format: "dd/MM"), content: content)
        notes.insert(tempNote, at: 0)
        saveData()
    }
    
    private func saveData(){
        if let encodedNotes = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encodedNotes, forKey: NOTES_KEY)
        }
    }
}

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
