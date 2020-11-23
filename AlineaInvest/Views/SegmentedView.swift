//
//  SegmentedView.swift
//  AlineaInvest
//
//  Created by Mohan on 23/11/20.
//

import UIKit

protocol SegmentedViewDelegate {
    func didSelectSegment(at index: Int, view: SegmentedView)
}

class SegmentedView: UIView {

    private var viewModel: SegmentViewModel = SegmentViewModel()
    private var delegate: SegmentedViewDelegate?
    
    private var buttons: [UIButton] = []
    private var selectorView: UIView = UIView()
    private let selectedColor: UIColor = UIColor(displayP3Red: 47/255, green: 37/255, blue: 194/255, alpha: 1)
    private let selectedFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
    private let unselectedFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .medium)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    init(frame: CGRect, viewModel: SegmentViewModel, delegate: SegmentedViewDelegate? = nil) {
        super.init(frame: frame)
        
        self.viewModel = viewModel
        self.delegate = delegate
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Something went wrong")
    }
}

private extension SegmentedView {
    
    func setupUI() {
        
        createButtons()
        setUpStackView()
        setupSelectorView()
    }
    
    func createButtons() {
        
        buttons = [UIButton]()
        for buttonTitle in viewModel.segments {
            
            let button = UIButton(type: .custom)
            button.setTitle(buttonTitle, for: .normal)
            setSelectButton(button: button, isSelected: false)
            button.addTarget(self, action: #selector(segmentTapped(sender:)), for: .touchUpInside)
            
            addSubview(button)
            buttons.append(button)
        }
        setSelectButton(button: buttons[0], isSelected: true)
    }
    
    func setUpStackView() {
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupSelectorView() {
        
        let width = frame.width / CGFloat(buttons.count) - 20
        selectorView.frame = CGRect(x: 10, y: frame.height - 4, width: width, height: 4)
        selectorView.layer.cornerRadius = 2
        selectorView.layer.masksToBounds = true
        selectorView.backgroundColor = selectedColor
        
        addSubview(selectorView)
    }
    
    func setSelectButton(button: UIButton, isSelected: Bool) {
        
        button.setTitleColor(isSelected ? selectedColor : .black, for: .normal)
        button.titleLabel?.font = isSelected ? selectedFont : unselectedFont
    }
    
    @objc func segmentTapped(sender: UIButton) {
        
        for (buttonIndex, button) in buttons.enumerated() {
            
            if button == sender {
                
                let position = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex) + 10
                UIView.animate(withDuration: 0.2) { [weak self] in
                    self?.selectorView.frame.origin.x =  position
                }
                setSelectButton(button: button, isSelected: true)
                delegate?.didSelectSegment(at: buttonIndex, view: self)
            } else {
                setSelectButton(button: button, isSelected: false)
            }
        }
    }
}
