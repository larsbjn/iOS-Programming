import UIKit

class StackElement: CustomStringConvertible{
    var description: String{
        return value
    }
    
    var value: String
    init(value: String) {
        self.value = value
    }
    
}

struct Stack {
    private var elements = [StackElement]()
    private var stackCounter: Int = 0
    
    mutating func pushElement(element: StackElement) {
        elements.append(element)
        stackCounter += 1
    }
    
    mutating func popElement() -> StackElement? {
        if (stackCounter == 0) {
            return nil;
        }
        let element = elements[stackCounter - 1];
        stackCounter -= 1
        return element
    }
    
    mutating func updateTopElement(newValue: String) {
        if (stackCounter > 0) {
            elements[stackCounter - 1].value = newValue
        }
    }
    
    func peekTopElement() -> StackElement? {
        if (elements.count == 0) {
            return nil;
        }
        return elements[stackCounter - 1];
    }
    
    func printStackElements() {
        if(stackCounter == 0){
            print("Stack is empty")
        }else{
            for i in 0..<stackCounter{
                print("\(i) element of stack is: \(elements[i])")
            }
        }
    }
    
}

// Program
var stack = Stack()
stack.pushElement(element: StackElement(value: "First"))
stack.pushElement(element: StackElement(value: "Second"))
stack.pushElement(element: StackElement(value: "Third"))
stack.pushElement(element: StackElement(value: "Fourth"))
stack.pushElement(element: StackElement(value: "Fifth"))

stack.printStackElements()

let popedElement = stack.popElement()

print("Poped element: \(popedElement!)")

stack.printStackElements()

if var topElement = stack.peekTopElement(){
    topElement.value = topElement.value + " edited"
    print("Edited element: \(topElement)")
}

stack.printStackElements()

stack.updateTopElement(newValue: "edited element")

stack.printStackElements()
