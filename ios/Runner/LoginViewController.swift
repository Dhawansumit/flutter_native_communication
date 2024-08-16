import UIKit

class LoginViewController: UIViewController {

    var loginSuccessCallback: ((String) -> Void)?

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        if username == "user" && password == "password" { // Replace with actual authentication logic
            let userData = "User Data for \(username)"
            loginSuccessCallback?(userData)
        } else {
            let alert = UIAlertController(title: "Login Failed", message: "Invalid username or password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
