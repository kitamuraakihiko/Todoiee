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
                                    RemoveTodoView(todo)
                                }
                        }
                        TodoPlaceHolderView(tag)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    RemoveAllTodoView()
                }
            }
        }
    }
}

struct RemoveAllTodoView: View {
    @Environment(TodoList.self) var todoList: TodoList

    var body: some View {
        Button {
            withAnimation {
                todoList.removeDone()
            }
        } label: {
            Image(systemName: "trash")
        }
        .tint(.red)
    }
}


struct RemoveTodoView: View {
    @Environment(TodoList.self) var todoList: TodoList
    let todo: Todo
    
    init(_ todo: Todo) {
        self.todo = todo
    }
    
    var body: some View {
        Button {
            withAnimation {
                todoList.remove(todo)
            }
        } label: {
            Image(systemName: "trash")
            }
        .tint(.red)
    }
}

#Preview {
    ContentView()
        .environment(TodoList.sample)
}
