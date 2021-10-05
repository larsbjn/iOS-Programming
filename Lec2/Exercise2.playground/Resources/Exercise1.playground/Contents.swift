import UIKit

class StackElement: CustomStringConvertible{
    var description: String{
        return value
    }
    
    var value: String
    init(value value: String) {
        self.value = value
    }
    
}

class Stack {
    var elements = [StackElement]()
    var stackCounter: Int = 0
    
    func pushElement(element e: StackElement) {
        elements.append(e)
        stackCounter += 1
    }
    
    func popElement() -> StackElement? {
        if (stackCounter == 0) {
            return nil;
        }
        let element = elements[stackCounter - 1];
        stackCounter -= 1
        return element
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

let poppedElement = stack.popElement()

print("Popped element: \(poppedElement!)")

stack.printStackElements()

if let topElement = stack.peekTopElement(){
    topElement.value = topElement.value + " edited"
    print("Edited element: \(topElement)")
}

stack.printStackElements()
