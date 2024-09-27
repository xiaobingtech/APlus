//
//  ContentView.swift
//  APlus
//
//  Created by 范小兵 on 2024/9/27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Query private var persons: [Person]
    @State private var selectedOption: String? = ""

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(Array(Dictionary(grouping: items, by: { $0.grade }).sorted(by: { $0.key < $1.key })) , id: \.key) { (grade, items) in
                    Section(header: Text("\(Grade(rawValue: grade))")) {
                        ForEach(items) { item in
                            NavigationLink {
                                Text("\(item.course) \(item.score)")
                            } label: {
                                Text("\(item.course) \(item.score)")
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("A+成绩")
            .toolbar {
                ToolbarItem {
                    Menu {
                        ForEach(persons, id: \.id) { person in
                            Button {
                                selectedOption = person.name
                                // 处理 Option 的操作
                            } label: {
                                Label(person.name, systemImage: selectedOption == person.name ? "checkmark" : "")
                            }
                        }
                        Button {
                            addPerson()
                        } label: {
                            Label("添加", systemImage: "plus")
                        }
                    } label: {
                        Image(systemName: "person.crop.circle.fill")
                    }
                }
                ToolbarItem() { // 添加到底部工具栏
                    Button(action: {
                        addItem() // 点击事件
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addPerson() {
        withAnimation {
            let newPerson = Person(timestamp: Date(), avatar: "",  name: "张三", age: 20)
            modelContext.insert(newPerson)
            selectedOption = newPerson.name
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), grade: 1, semester: 1, score: 90.0, course: "数学", teacher: "张三")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
