import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in secondView {
            print(i.frame.origin)
        }
    }
    
}


public class UIViewIterator: IteratorProtocol {
    
    private let superview: UIView
    private var arrayView = [UIView]()
    private var current = 0
    
    init(superview: UIView) {
        self.superview = superview
        iterate(view: superview)
    }
    
    public func next() -> UIView? {

        defer { current += 1 }
        return arrayView.count > current ? arrayView[current] : nil
    }
    
    
    private func iterate(view: UIView) {
        
        let array = view.subviews
        
        guard !array.isEmpty else { return }
        
        for i in array {
            arrayView.append(i)
            iterate(view: i)
        }
        
    }
}


extension UIView: Sequence {
    
    public func makeIterator() -> UIViewIterator {
        
        let superview = self.superview
        
        return UIViewIterator(superview: superview!)
    }

}

