//
//  ListQuizView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 01/08/21.
//

import SwiftUI
import CoreData

struct ListQuizView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Quiz.timestamp, ascending: true)],
        animation: .default)
    private var quizes: FetchedResults<Quiz>
    @State private var optionalData = UIImage(systemName: "photo")?.jpegData(compressionQuality: 1)

    var body: some View {
            List {
                ForEach(quizes) { quiz in
                    NavigationLink(destination: CreateEditQuizView(quiz: quiz)
                                    .environment(\.managedObjectContext, viewContext)
                    ) {
                        ListQuizCardView(quiz: quiz)
                    }
                }
                .onDelete(perform: deleteQuizes)
            }
            .listStyle(InsetGroupedListStyle())
        .navigationBarTitle(Text("Lista de Quiz"))
        .toolbar {
            NavigationLink(destination: CreateEditQuizView(quiz: nil)
                            .environment(\.managedObjectContext, viewContext)
            ) {
                Label("Adicionar Quiz", systemImage: "plus")
            }
        }
    }

    private func deleteQuizes(offsets: IndexSet) {
        withAnimation {
            offsets.map { quizes[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let quizFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
    return formatter
}()

struct ListQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ListQuizView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
