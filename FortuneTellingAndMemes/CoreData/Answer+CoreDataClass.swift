//
//  Answer+CoreDataClass.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 25.09.2024.
//
//

import Foundation
import CoreData

@objc(Answer)
public class Answer: NSManagedObject {

}

extension Answer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answer> {
        return NSFetchRequest<Answer>(entityName: "Answer")
    }

    @NSManaged public var memeUrl: String?
    @NSManaged public var question: String?
    @NSManaged public var id: String?
    @NSManaged public var date: Date?

}

extension Answer : Identifiable {
    func deleteAnswer() {
        managedObjectContext?.delete(self)
        
        do {
            try managedObjectContext?.save()
        } catch {
            print("Deleting error: \(error.localizedDescription)")
        }
    }
}
