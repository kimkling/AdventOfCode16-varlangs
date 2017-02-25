import Cocoa

print("Hello World!")
if let filepath = Bundle.main.path(forResource: "input.txt", ofType: "txt") {
    do {
        let contents = try String(contentsOfFile: filepath)
        print(contents)
    } catch {
        // contents could not be loaded
        print("Content not Loaded")
    }
} else {
    // example.txt not found!
    print("File not found")
}