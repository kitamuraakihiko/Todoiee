import SwiftUI

struct TodoPlaceHolderView: View {
    @Environment(TodoList.self) var todoList: TodoList
    var todo: Todo
    
    init(_ tag: TodoTag) {
        self.todo = .init(title: "", tag: tag)
    }
    
    var body: some View {
        TodoView(todo)
            .onSubmit {
                todoList.add(todo)
            }
    }
}

struct TodoView: View {
    let todo: Todo
    
    init(_ todo: Todo) {
        self.todo = todo
    }
    
    var body: some View {
        HStack {
            TodoCheckView(todo)
            TodoTitleView(todo)
        }
    }
}

struct TodoCheckView: View {
    let todo: Todo
    
    init(_ todo: Todo) {
        self.todo = todo
    }
    
    var body: some View {
        Image(systemName: todo.done ? "checkmark.square.fill" : "square")
            .font(.title2)
            .onTapGesture {
                if !todo.title.isEmpty {
                    todo.toggleCheck()
                }
            }
    }
}

struct TodoTitleView: View {
    @Bindable var todo: Todo

    init(_ todo: Todo) {
        self.todo = todo
    }
    
    var body: some View {
        if todo.done {
            Text(todo.title)
                .strikethrough()
        } else {
            TextField("", text: $todo.title)
        }
    }
}
