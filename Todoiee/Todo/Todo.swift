import Foundation

@Observable class TodoList {
    init(_ values: [Todo]) {
        self.values = values
    }
    
    static let sample: TodoList = .init([
        .init(title: "buy egg", tag: .init("food")),
        .init(title: "buy milk", tag: .init("food")),
        .init(title: "study math", tag: .init("study")),
        .init(title: "study science", tag: .init("study")),
        .init(title: "reply mail to Mike"),
    ])
    
    private(set) var values: [Todo]
    
    var tags: TodoTags {
        return TodoTags(self)
    }
    
    func of(tag: TodoTag, showComlepeted: Bool = true) -> [Todo] {
        values.filter { todo in
            todo.tag == tag &&
            (showComlepeted ? true : !todo.done)
        }
    }
    
    func add(_ todo: Todo) {
        if !todo.title.isEmpty {
            values.append(todo)
        }
    }
    
    func remove(_ todo: Todo) {
        values.removeAll { value in
            value.id == todo.id
        }
    }
    
    func removeDone() {
        values.removeAll { value in
            value.done
        }
    }
}

@Observable class Todo: Identifiable {
    init(title: String, tag: TodoTag = .init(), deadline: Date? = nil) {
        self.title = title
        self.tag = tag
        self.deadline = deadline
    }
    let id: UUID = UUID()
    
    var title: String
    let tag: TodoTag
    let deadline: Date?
    private(set) var done: Bool = false
    
    func toggleCheck() {
        done.toggle()
    }
}
