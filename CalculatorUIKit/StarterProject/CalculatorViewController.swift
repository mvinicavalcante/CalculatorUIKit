import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet var roundButtons: [UIButton]!
    
    @IBOutlet weak var divideButton: OperatorButton!
    @IBOutlet weak var multiplyButton: OperatorButton!
    @IBOutlet weak var minusButton: OperatorButton!
    @IBOutlet weak var plusButton: OperatorButton!
    lazy var operationButtons: [OperatorButton] = [
        divideButton,
        multiplyButton,
        minusButton,
        plusButton
    ]
    
    enum Operation{
        case divide
        case multiply
        case subtract
        case add
        case none
    }
    
    var operation: Operation = .none
    
    var operationIsSelected: Bool {
        for button in operationButtons {
            if button.isSelection {
                return true
            }
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
        setupButtons()
    }
    
    func setupButtons() {
        for button in operationButtons {
            button.layer.cornerRadius =
                button.frame.height / 2
        }
        
        for button in roundButtons {
            button.layer.cornerRadius =
                button.frame.height / 2
        }
    }

    @IBAction func didTapOperationButton(_ sender: OperatorButton) {
        let title = sender.currentTitle
        
        switch title {
        case "÷":
            operation = .divide
        case "X":
            operation = .multiply
        case "-":
            operation = .subtract
        case "+":
            operation = .add
        default:
            break
        }
        highlightButton(sender)
    }
    
    func deselectButtons() {
        for button in operationButtons {
            button.backgroundColor = .systemOrange
            button.setTitleColor(.white, for: .normal)
            button.isSelection = false
        }
    }
    
    func highlightButton(_ button: OperatorButton) {
        deselectButtons()
        button.backgroundColor = .white
        button.setTitleColor(.systemOrange, for: .normal)
        button.isSelection = true
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        let number = String(sender.tag)
        
        displayLabel.text = operationIsSelected
        ? {
            deselectButtons();
            return number
        }()
        : (
            displayLabel.text == "0" ?
            number : displayLabel.text! + number
        )
    }
    
    @IBAction func didTapDecimalButton() {
    }
    
    @IBAction func didTapEqualsButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapPercentButton() {
    }
    
    @IBAction func didTapPlusMinusButton() {
    }
    
    @IBAction func didTapClearButton() {
    }
    
}
