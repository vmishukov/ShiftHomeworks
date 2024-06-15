//
//  CompaniesDataService.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import Foundation
import CoreData

final class CompaniesDataService {
    /*
    private let entityName = "Company"
    private lazy var controller: NSFetchedResultsController<Company> = {
        
        let sortDescriptor = NSSortDescriptor(keyPath: \Company.name, ascending: true)
        let fetchRequest = Company.fetchRequest()
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let controller = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: persistentContainer.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        return controller
    }()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Companies")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func performFetch() {
        do {
            try controller.performFetch()
        } catch {
            print(error)
        }
    }
    
    func addFetchDelegate(_ delegate: NSFetchedResultsControllerDelegate) {
        controller.delegate = delegate
    }
    
    func fetchCompanies(completion: ([CompanyModel]) -> Void) {
        let context = persistentContainer.viewContext
        let sortDescriptor = NSSortDescriptor(keyPath: \Company.name, ascending: true)
        let fetchRequest = Company.fetchRequest()
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            let companies = try context.fetch(fetchRequest)
            
            completion(companies.sorted { $0.employees.count > $1.employees.count }
                .map { company in
                    CompanyModel(
                        id: company.uid,
                        name: company.name,
                        employees: company.employees.map { .init(name: $0.name, position: $0.position, age: $0.age as? Int)}
                    )
                })
        } catch {
            let error = error as NSError
            print("Error: ", error.localizedDescription)
        }
    }

    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error occured while saving context.  \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func add(company: CompanyModel) {
        defer { self.saveContext() }
        
//        persistentContainer.performBackgroundTask { context in
        let context = persistentContainer.viewContext
            let companyEntity = Company(context: context)
            companyEntity.name = company.name
            companyEntity.uid = company.id
            
            let employees = company.employees.map { employee -> Employee in
                let employeeEntity = Employee(context: context)
                employeeEntity.name = employee.name
                employeeEntity.age = employee.age as? NSDecimalNumber
                employeeEntity.position = employee.position
                employeeEntity.uid = employee.id
                return employeeEntity
            }
            
            companyEntity.employees = Set(employees)
    
    }
    
    func removeCompany(by id: UUID) {
        defer { self.saveContext() }
        
        let context = persistentContainer.viewContext
        let fetchRequest = Company.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uid == %@" , id.uuidString)
        do {
            let companies = try context.fetch(fetchRequest)
            companies.forEach { context.delete($0) }
        } catch let error as NSError {
            fatalError("Could not delete item. \(error), \(error.userInfo)")
        }
    }
     */
}
