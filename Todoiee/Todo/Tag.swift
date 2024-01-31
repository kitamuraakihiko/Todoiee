import Foundation

@Observable class TodoTags {
    private(set) var values: [TodoTag] = []
    
    var count: Int {
        values.count
    }
    
    init(_ todoList: TodoList) {
        todoList.values.forEach { todo in
            if !values.contains(where: { tag in
                todo.tag == tag
            }) {
                values.append(todo.tag)
            }
        }
    }
}

@Observable class TodoTag: Identifiable {
    static func == (lhs: TodoTag, rhs: TodoTag) -> Bool {
        lhs.title == rhs.title
    }
    
    init() {
        self.title = ""
        self.categorized = false
    }
    
    init(_ title: String) {
        self.title = title
        self.categorized = !title.isEmpty
    }
    
    let id: UUID = UUID()
    let title: String
    let categorized: Bool
}
