//
//  DetailViewController.swift
//  LootLogger-Abduaziz_hussun
//
//  Created by azooz alhwiti on 25/11/2021.
//

import UIKit
class DetailViewController: UIViewController {
  
 
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
  return true }
  
  

  @IBOutlet weak var nameField: UITextField!
  
  @IBOutlet weak var serialNumberField: UITextField!
  
  
  @IBOutlet weak var valueField: UITextField!
  
  @IBOutlet weak var dateLabel: UILabel!
  
  
  
  

  var item: Item! { didSet {
    navigationItem.title = item.name
}
}
  
  let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
  }()
  
  let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
  }()
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    nameField.text = item.name
    serialNumberField.text = item.serialNumber
    valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
    dateLabel.text = dateFormatter.string(from: item.dateCreated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      // "Save" changes to item
      item.name = nameField.text ?? ""
      item.serialNumber = serialNumberField.text
      if let valueText = valueField.text,
          let value = numberFormatter.number(from: valueText) {
          item.valueInDollars = value.intValue
  } else {
          item.valueInDollars = 0
      }
  }
  
  
  
  @IBAction func backgroundTappe(_ sender: UITapGestureRecognizer) {
    // Clear first responder
    view.endEditing(true)
    // "Save" changes to item
       item.name = nameField.text ?? ""
       item.serialNumber = serialNumberField.text
       if let valueText = valueField.text,
           let value = numberFormatter.number(from: valueText) {
           item.valueInDollars = value.intValue
   } else {
           item.valueInDollars = 0
       }
  }
}