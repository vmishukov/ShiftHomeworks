//
//  CompaniesDataStore.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 16.06.2024.
//

import Foundation
import CoreData
import UIKit

protocol CompaniesDataStoreProtocol {
    
    var delegate: CompaniesDataServiceDelegate? { get set }
    func addNewCompany(_ companyName: String) throws
    func deleteCompany(_ companyId: UUID) throws
    func fetchCompanies() throws -> [Company]?
}

final class CompaniesDataStore: NSObject, CompaniesDataStoreProtocol {
 
    weak var delegate: CompaniesDataServiceDelegate?
    
    private let context: NSManagedObjectContext
    private var companiesFetchResultController: NSFetchedResultsController<Company>?
    
    convenience override init() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.init(context: context)
    }
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchCompanies() throws -> [Company]? {
        let fetchRequest = Company.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let companiesFromCoreData = try context.fetch(fetchRequest)
        return companiesFromCoreData
    }
    
    func addNewCompany(_ companyName: String) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        guard companyName.isEmpty == false else { return }
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "%K == %@",
                                             #keyPath(Company.name),
                                             companyName)
        do {
            guard let results = try context.fetch(fetchRequest) as? [Company] else {
               return
            }
            if results.isEmpty {
                let newCompany = Company(context: context)
                newCompany.name = companyName
                newCompany.uid = UUID()
                try context.save()
                return
            }
            return
        } catch {
            throw error
        }
    }
    
    func deleteCompany(_ companyId: UUID) throws {

    }
}

private extension CompaniesDataStore {
    
    private func setupFetchResultController() {
        let fetchRequest = Company.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let context = self.context
        let fetchedResultController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchedResultController.delegate = self
        self.companiesFetchResultController = fetchedResultController
    }
}

extension CompaniesDataStore: NSFetchedResultsControllerDelegate {

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        
    }
    
    func controller(_ controller: NSFetchedResultsController<any NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            
        case .insert:
            break
            
        case .delete:
            break
            
        case .move:
            break
            
        case .update:
            break
            
        @unknown default:
            break
        }
    }
}
