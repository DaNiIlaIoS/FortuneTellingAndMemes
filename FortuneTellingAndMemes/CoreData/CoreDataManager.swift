//
//  CoreDataManager.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 25.09.2024.
//

import CoreData

final class CoreDataManager: ObservableObject {
    
    static let shared = CoreDataManager()
    private init() {}
    
    private let persistentContainer = PersistenceController.shared.container
    
    private var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    @Published var answers: [Answer] = []

    // MARK: - Core Data Saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createAnswer(memeUrl: String, question: String?) {
        let answer = Answer(context: viewContext)
        answer.id = UUID().uuidString
        answer.memeUrl = memeUrl
        answer.question = question
        answer.date = Date()
        
        saveContext()
        fetchAnswers()
    }
    
    func fetchAnswers() {
        let request = Answer.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            answers = try viewContext.fetch(request)
        } catch {
            print("Ошибка при получении данных: \(error.localizedDescription)")
        }
    }
}
