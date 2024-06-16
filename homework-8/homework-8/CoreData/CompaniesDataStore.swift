//
//  CompaniesDataStore.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 16.06.2024.
//

import Foundation
import CoreData
import UIKit

protocol CompaniesDataStroreDelegate: AnyObject {
    
    func companiesDataStore(_ : any CompaniesDataStoreProtocol, insert company: Company, at indexPath: IndexPath)
    
    func companiesDataStoreDeleteCompany(_ : any CompaniesDataStoreProtocol, at indexPath: IndexPath)
}

protocol CompaniesDataStoreProtocol {
    
    var delegate: CompaniesDataStroreDelegate? { get set }
    func addNewCompany(_ companyName: String, _ companyUuid: UUID) throws
    func deleteCompany(_ companyId: UUID) throws
    func fetchCompanies() throws -> [Company]?
}

final class CompaniesDataStore: NSObject, CompaniesDataStoreProtocol {
    
    weak var delegate: CompaniesDataStroreDelegate?
    
    private let context: NSManagedObjectContext
    private var companiesFetchResultController: NSFetchedResultsController<Company>?
    
    
    override init() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.context = context
        super.init()
        self.setupFetchResultController()
    }
    
    func fetchCompanies() throws -> [Company]? {
        let fetchRequest = Company.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "employeesCount", ascending: true)]
        let companiesFromCoreData = try context.fetch(fetchRequest)
        return companiesFromCoreData
    }
    
    func addNewCompany(_ companyName: String, _ companyUuid: UUID) throws {
        let fetchRequest = Company.fetchRequest()
        guard companyName.isEmpty == false else { return }
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "%K == %@",
                                             #keyPath(Company.name),
                                             companyName)
        do {
            let results = try context.fetch(fetchRequest)
            if results.isEmpty {
                let newCompany = Company(context: context)
                newCompany.name = companyName
                newCompany.uid = companyUuid
                try context.save()
                return
            }
            return
        } catch {
            throw error
        }
    }
    
    func deleteCompany(_ companyId: UUID) throws {
        let fetchRequest = Company.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "%K == %@",
                                             #keyPath(Company.uid),
                                             companyId.uuidString)
        let companies = try context.fetch(fetchRequest)
        companies.forEach { context.delete($0) }
        try context.save()
    }
}

private extension CompaniesDataStore {
    
    private func setupFetchResultController() {
        let fetchRequest = Company.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "employeesCount", ascending: true)]
        let context = self.context
        let fetchedResultController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchedResultController.delegate = self
        try? fetchedResultController.performFetch()
        self.companiesFetchResultController = fetchedResultController
    }
}

extension CompaniesDataStore: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<any NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            
        case .insert:
            if let indexPath = newIndexPath, let company = anObject as? Company {
                delegate?.companiesDataStore(self, insert: company, at: indexPath)
            }
            break
            
        case .delete:
            if let indexPath = indexPath {
                delegate?.companiesDataStoreDeleteCompany(self, at: indexPath)
            }
            print("kek")
            break
            
        case .move:
            break
            
        case .update:
            print("upd")
            break
            
        @unknown default:
            break
        }
    }
}
