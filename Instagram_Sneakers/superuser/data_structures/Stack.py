

class Stack:
    def __init__(self):
        self.inner_stack = []

    def push(self, data):
        self.inner_stack.append(data)

    def pop(self):
        if self.count() > 0:
            return self.inner_stack.pop()
        else:
            return None

    def peek(self):
        if self.count() > 0:
            return self.inner_stack[-1]
        else:
            return None

    def count(self):
        return len(self.inner_stack)

    def get_stack_contents(self):
        temp = Stack()
        while self.count() > 0:
            temp.push(self.peek())
            self.pop()
        if temp.peek() is not None:
            item = temp.pop()
            stack_contents = item
            self.push(item)

            while temp.count() > 0:
                item = temp.pop()
                stack_contents += f".{item}"
                self.push(item)

            return stack_contents
        else:
            return None
