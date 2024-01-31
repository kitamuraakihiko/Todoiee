import SwiftUI

struct ContentView: View {
    @Environment(TodoList.self) var todoList: TodoList
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todoList.tags.values) { tag in
                    Section(tag.title) {
                        ForEach(todoList.of(tag: tag)) { todo in
                            TodoView(todo)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Button {
                                        todoList.remove(todo)
                                    } label: {
                                        Image(systemName: "trash")
                                        }
                                    .tint(.red)
                                }
                        }
                        TodoPlaceHolderView(tag)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        todoList.removeDone()
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(TodoList.sample)
}
