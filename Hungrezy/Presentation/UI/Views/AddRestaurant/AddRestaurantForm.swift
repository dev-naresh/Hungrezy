//
//  AddRestaurantForm.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Cocoa

class AddRestaurantForm: NSView {
    var presenter: AddRestaurantFormPresenterContract
    
    override func draw(_ dirtyRect: NSRect) {
        wantsLayer = true
        layer?.backgroundColor = NSColor.controlColor.cgColor
    }

    lazy var addRestaurantLabel: NSTextField = {
        var textLabel = NSTextField()
        textLabel.stringValue = "Add Restaurant"
//        textLabel.bezelStyle = .roundedBezel
        textLabel.isBordered = false
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .boldSystemFont(ofSize: 25)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var nameLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Restaurant Name"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var addressLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Restaurant Address"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var locationLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Restaurant Location"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var establishmentTypeLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Establishment Type"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var facilitiesTypeLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Facilities"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var contactNumberLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Contact Number"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var cuisinesLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Cuisines"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var operationalHoursLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Operational Hours"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var toLabel: NSTextField = {
        var textLabel = NSTextField()
        textLabel.stringValue = "to"
        textLabel.font = .systemFont(ofSize: 15)
//        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.isBordered = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var restaurantImageLabel: CustomTextField = {
        var textLabel = CustomTextField()
        textLabel.stringValue = "Display Image"
        textLabel.bezelStyle = .roundedBezel
        textLabel.isEditable = false
        textLabel.cell?.backgroundStyle = .raised
        textLabel.drawsBackground = false
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var restaurantNameField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Enter your restaurant name"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = plotNumberField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var plotNumberField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Door/Plot Number"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = address1Field
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var address1Field: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Address Line 1"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = address2Field
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var address2Field: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Address Line 2"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = cityDropDown
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var cityDropDown: NSPopUpButton = {
        var dropDown = NSPopUpButton()
        let item = NSMenuItem(title: "Chennai", action: nil, keyEquivalent: "")
        dropDown.menu?.addItem(item)
        let item2 = NSMenuItem(title: "Bangalore", action: nil, keyEquivalent: "")
        dropDown.menu?.addItem(item2)
        let item3 = NSMenuItem(title: "Coimbatore", action: nil, keyEquivalent: "")
        dropDown.menu?.addItem(item3)
        dropDown.select(NSMenuItem(title: "", action: nil, keyEquivalent: ""))
        dropDown.nextKeyView = pinCodeField
        dropDown.wantsLayer = true
        dropDown.layer?.borderColor = .clear
        dropDown.layer?.borderWidth = 1
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dropDown)
        return dropDown
    }()
    
    lazy var pinCodeField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Pin Code"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = latitudeField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var latitudeField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Latitude"
        textField.font = .systemFont(ofSize: 17)
        textField.formatter = Formatter.coordinatesNumberFormatter
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = longitudeField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var longitudeField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Longitude"
        textField.font = .systemFont(ofSize: 17)
        textField.formatter = Formatter.coordinatesNumberFormatter
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = contactNumberField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var radioButton1: NSButton = {
        let button = NSButton(radioButtonWithTitle: "Delivery", target: nil, action: nil)
        button.target = self
        button.action = #selector(doNothing)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var radioButton2: NSButton = {
        let button = NSButton(radioButtonWithTitle: "Dine out", target: nil, action: nil)
        button.target = self
        button.action = #selector(doNothing)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var radioButton3: NSButton = {
        let button = NSButton(radioButtonWithTitle: "Delivery and Dine out", target: nil, action: nil)
        button.target = self
        button.action = #selector(doNothing)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var cuisinesField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Cuisines"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = facilitiesField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var facilitiesField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Facilities"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = restaurantImageField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var contactNumberField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Contact Number"
        textField.font = .systemFont(ofSize: 17)
        textField.formatter = Formatter.mobileNumberFormatter
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = cuisinesField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var restaurantImageField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Restaurant Image URL"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = fromTime
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var fromTime: NSDatePicker = {
        var datePicker = NSDatePicker()
        datePicker.datePickerStyle = .textFieldAndStepper
        datePicker.timeZone = TimeZone(abbreviation: "IST")
        datePicker.isBezeled = true
        datePicker.datePickerElements = .hourMinute
        datePicker.focusRingType = .none
        datePicker.nextKeyView = toTime
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datePicker)
        return datePicker
    }()
    
    lazy var toTime: NSDatePicker = {
        var datePicker = NSDatePicker()
        datePicker.datePickerStyle = .textFieldAndStepper
        datePicker.timeZone = TimeZone(abbreviation: "IST")
        datePicker.isBezeled = true
        datePicker.datePickerElements = .hourMinute
        datePicker.focusRingType = .none
        datePicker.nextKeyView = submitButton
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datePicker)
        return datePicker
    }()
    
    lazy var submitButton: NSButton = {
        var button = NSButton()
        button.font = NSFont(name: "Big Caslon", size: 15)
        button.title = "Submit"
        button.contentTintColor = .white
        button.wantsLayer = true
        button.isBordered = false
        button.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        button.layer?.cornerRadius  = 15
        button.target = self
        button.action = #selector(submitButtonAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    init(presenter: AddRestaurantFormPresenterContract,frame frameRect: NSRect) {
        self.presenter = presenter
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            addRestaurantLabel.topAnchor.constraint(equalTo: topAnchor),
            addRestaurantLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: addRestaurantLabel.bottomAnchor, constant: 18),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: addressLabel.topAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            nameLabel.trailingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor, constant: -60),
            
            restaurantNameField.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantNameField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            restaurantNameField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            
            restaurantNameField.bottomAnchor.constraint(equalTo: plotNumberField.topAnchor, constant: -10),
            
            plotNumberField.heightAnchor.constraint(equalTo: restaurantNameField.heightAnchor),
            plotNumberField.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            plotNumberField.trailingAnchor.constraint(equalTo: restaurantNameField.trailingAnchor),
            
            addressLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
            
            plotNumberField.bottomAnchor.constraint(equalTo: address1Field.topAnchor, constant: -10),
            
            address1Field.heightAnchor.constraint(equalTo: restaurantNameField.heightAnchor),
            address1Field.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            address1Field.trailingAnchor.constraint(equalTo: restaurantNameField.trailingAnchor),
            
            address1Field.bottomAnchor.constraint(equalTo: address2Field.topAnchor, constant: -10),
            
            address2Field.heightAnchor.constraint(equalTo: restaurantNameField.heightAnchor),
            address2Field.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            address2Field.trailingAnchor.constraint(equalTo: restaurantNameField.trailingAnchor),
            
            address2Field.bottomAnchor.constraint(equalTo: cityDropDown.topAnchor, constant: -10),
            
            cityDropDown.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            cityDropDown.bottomAnchor.constraint(equalTo: pinCodeField.topAnchor, constant: -10),
            
            pinCodeField.heightAnchor.constraint(equalTo: restaurantNameField.heightAnchor),
            pinCodeField.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            pinCodeField.trailingAnchor.constraint(equalTo: restaurantNameField.trailingAnchor),
            
            pinCodeField.bottomAnchor.constraint(equalTo: latitudeField.topAnchor, constant: -10),
            pinCodeField.bottomAnchor.constraint(equalTo: longitudeField.topAnchor, constant: -10),
            
            latitudeField.heightAnchor.constraint(equalTo: restaurantNameField.heightAnchor),
            latitudeField.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            latitudeField.trailingAnchor.constraint(equalTo: longitudeField.leadingAnchor, constant: -5),
            latitudeField.widthAnchor.constraint(equalTo: longitudeField.widthAnchor),
            
            longitudeField.heightAnchor.constraint(equalTo: latitudeField.heightAnchor),
            longitudeField.trailingAnchor.constraint(equalTo: restaurantNameField.trailingAnchor),
            
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: latitudeField.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: latitudeField.topAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: latitudeField.bottomAnchor),
            
            locationLabel.bottomAnchor.constraint(equalTo: establishmentTypeLabel.topAnchor, constant: -10),
            
            establishmentTypeLabel.heightAnchor.constraint(equalTo: locationLabel.heightAnchor),
            
            latitudeField.bottomAnchor.constraint(equalTo: radioButton1.topAnchor, constant: -20),
            radioButton1.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            
            radioButton1.bottomAnchor.constraint(equalTo: radioButton2.topAnchor, constant: -10),
            radioButton2.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            
            radioButton2.bottomAnchor.constraint(equalTo: radioButton3.topAnchor, constant: -10),
            radioButton3.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            
            radioButton3.bottomAnchor.constraint(equalTo: contactNumberField.topAnchor, constant: -15),
            contactNumberField.leadingAnchor.constraint(equalTo: restaurantNameField.leadingAnchor),
            contactNumberField.trailingAnchor.constraint(equalTo: restaurantNameField.trailingAnchor),
            contactNumberField.heightAnchor.constraint(equalTo: restaurantNameField.heightAnchor),
            
            contactNumberField.leadingAnchor.constraint(equalTo: contactNumberLabel.trailingAnchor),
            contactNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            contactNumberLabel.topAnchor.constraint(equalTo: contactNumberField.topAnchor),
            contactNumberLabel.bottomAnchor.constraint(equalTo: contactNumberField.bottomAnchor),
            
            contactNumberField.bottomAnchor.constraint(equalTo: cuisinesField.topAnchor, constant: -10),
            cuisinesField.heightAnchor.constraint(equalTo: contactNumberField.heightAnchor),
            cuisinesField.leadingAnchor.constraint(equalTo: contactNumberField.leadingAnchor),
            cuisinesField.trailingAnchor.constraint(equalTo: contactNumberField.trailingAnchor),
            
            cuisinesField.leadingAnchor.constraint(equalTo: cuisinesLabel.trailingAnchor),
            cuisinesLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            cuisinesLabel.topAnchor.constraint(equalTo: cuisinesField.topAnchor),
            cuisinesLabel.bottomAnchor.constraint(equalTo: cuisinesField.bottomAnchor),
            
            cuisinesField.bottomAnchor.constraint(equalTo: facilitiesField.topAnchor, constant: -10),
            facilitiesField.heightAnchor.constraint(equalTo: cuisinesField.heightAnchor),
            facilitiesField.leadingAnchor.constraint(equalTo: cuisinesField.leadingAnchor),
            facilitiesField.trailingAnchor.constraint(equalTo: cuisinesField.trailingAnchor),
            
            facilitiesField.leadingAnchor.constraint(equalTo: facilitiesTypeLabel.trailingAnchor),
            facilitiesTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            facilitiesTypeLabel.topAnchor.constraint(equalTo: facilitiesField.topAnchor),
            facilitiesTypeLabel.bottomAnchor.constraint(equalTo: facilitiesField.bottomAnchor),
            
            facilitiesField.bottomAnchor.constraint(equalTo: restaurantImageField.topAnchor, constant: -10),
            restaurantImageField.heightAnchor.constraint(equalTo: cuisinesField.heightAnchor),
            restaurantImageField.leadingAnchor.constraint(equalTo: cuisinesField.leadingAnchor),
            restaurantImageField.trailingAnchor.constraint(equalTo: cuisinesField.trailingAnchor),
            
            restaurantImageField.leadingAnchor.constraint(equalTo: restaurantImageLabel.trailingAnchor),
            restaurantImageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantImageLabel.topAnchor.constraint(equalTo: restaurantImageField.topAnchor),
            restaurantImageLabel.bottomAnchor.constraint(equalTo: restaurantImageField.bottomAnchor),
            
            restaurantImageField.bottomAnchor.constraint(equalTo: fromTime.topAnchor, constant: -14),
            fromTime.leadingAnchor.constraint(equalTo: restaurantImageField.leadingAnchor),
            
            fromTime.trailingAnchor.constraint(equalTo: toLabel.leadingAnchor, constant: -9),
            toLabel.topAnchor.constraint(equalTo: fromTime.topAnchor),
            toLabel.bottomAnchor.constraint(equalTo: fromTime.bottomAnchor),
            toLabel.trailingAnchor.constraint(equalTo: toTime.leadingAnchor, constant: -7),
            
            toTime.topAnchor.constraint(equalTo: fromTime.topAnchor),
            toTime.bottomAnchor.constraint(equalTo: fromTime.bottomAnchor),
            
            fromTime.leadingAnchor.constraint(equalTo: operationalHoursLabel.trailingAnchor),
            operationalHoursLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            operationalHoursLabel.topAnchor.constraint(equalTo: restaurantImageLabel.bottomAnchor, constant: 10),
//            operationalHoursLabel.topAnchor.constraint(equalTo: fromTime.topAnchor),
            operationalHoursLabel.bottomAnchor.constraint(equalTo: fromTime.bottomAnchor, constant: 3),
            
            submitButton.topAnchor.constraint(equalTo: operationalHoursLabel.bottomAnchor, constant: 20),
            submitButton.heightAnchor.constraint(equalToConstant: 30),
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doNothing(sender: NSButton) {
        
    }
    
    @objc func submitButtonAction(sender: NSButton) {
        let alert = NSAlert()
        alert.alertStyle = .critical
        alert.addButton(withTitle: "Ok")
        
        
        if restaurantNameField.stringValue == "" {
            restaurantNameField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter restaurant name"
            alert.runModal()
            return
        }
        
        else if plotNumberField.stringValue == "" {
            plotNumberField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter plot number"
            alert.runModal()
            return
        }

        else if address1Field.stringValue == "" {
            address1Field.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter address"
            alert.runModal()
            return
        }

        else if cityDropDown.selectedItem == nil {
            cityDropDown.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please choose city"
            alert.runModal()
            return
        }

        else if pinCodeField.stringValue.count != 6 {
            pinCodeField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter valid pincode"
            alert.runModal()
            return
        }

        else if latitudeField.stringValue == "" {
            latitudeField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter latitude"
            alert.runModal()
            return
        }

        else if longitudeField.stringValue == "" {
            longitudeField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter longitude"
            alert.runModal()
            return
        }
        
        else if radioButton1.state == .off && radioButton2.state == .off && radioButton3.state == .off {
            alert.messageText = "Please choose establishment type"
            alert.runModal()
            return
        }

        else if contactNumberField.stringValue.count != 10 {
            contactNumberField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter valid mobile number"
            alert.runModal()
            return
        }

        else if cuisinesField.stringValue == "" {
            cuisinesField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter cuisines"
            alert.runModal()
            return
        }

        else if facilitiesField.stringValue == "" {
            facilitiesField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please enter facilities"
            alert.runModal()
            return
        }

        else if restaurantImageField.stringValue == "" {
            restaurantImageField.layer?.borderColor = NSColor.red.cgColor
            alert.messageText = "Please provide image"
            alert.runModal()
            return
        }

        else {
            var location = Location.Chennai
            switch cityDropDown.selectedItem?.title {
            case "Chennai":
                location = .Chennai
            case "Coimbatore":
                location = .Coimbatore
            case "Bangalore":
                location = .Bangalore
            default:
                location = .Chennai
            }
            
            var diningType = DiningType.DineOut
            if radioButton1.state == .on {
                diningType = .Delivery
            }
            else if radioButton2.state == .on {
                diningType = .DineOut
            }
            else if radioButton3.state == .on {
                diningType = .DeliveryAndDineOut
            }
            
            presenter.addNewRestaurant (
                restaurant: Restaurant(id: "", name: restaurantNameField.stringValue, address: address1Field.stringValue, city: location, latitude: latitudeField.doubleValue, longitude: longitudeField.doubleValue, pinCode: pinCodeField.intValue, locality: address2Field.stringValue, openTime: Int32(TimeConverter.timeToInt(fromTime.dateValue)), closeTime: Int32(TimeConverter.timeToInt(toTime.dateValue)), facilities: facilitiesField.stringValue, cuisines: cuisinesField.stringValue, averageCost: 0, ratings: 0.0, contactNumber: Int64(contactNumberField.intValue), diningType: diningType, imageURL: restaurantImageField.stringValue)
            )
        }
    }
}

extension AddRestaurantForm : NSTextFieldDelegate {
    func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField {
            textField.layer?.borderColor = .clear
        }
    }
}

