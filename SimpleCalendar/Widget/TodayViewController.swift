//
//  TodayViewController.swift
//  Widget
//
//  Created by Dzhek on 04.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa
import NotificationCenter

final class TodayViewController: NSViewController, NCWidgetProviding {
    
    // MARK: - Properties
    
    private var labelDisplayedMonth: PresentedMonthLabel!
    private var buttonsControl: ButtonsSegmentedControl!
    private var symbolsView: SymbolsBlockView!
    private var calendarView: DatesBlockView!
    private var todayView: CircleView!
    private var model: CalendarViewModel!
    
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 304, height: 190))
        preferredContentSize = NSMakeSize(0, 190)
    }
    
    override func viewDidLoad() {
        model = CalendarViewModel()
        configureSubviews()
    }


    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(.newData)
    }
    
    
    // MARK: - Methods
    
    private func configureSubviews() {
        let labelOrigin = CGPoint(x: 2, y: 168)
        labelDisplayedMonth = PresentedMonthLabel(origin: labelOrigin, value: model.presentedMonth)
        view.addSubview(labelDisplayedMonth)
        
        let buttonsOrigin = CGPoint(x: 150, y: 163)
        buttonsControl = ButtonsSegmentedControl(origin: buttonsOrigin)
        buttonsControl.target = self
        buttonsControl.action = #selector(onClickSelector)
        view.addSubview(buttonsControl)
        
        let symbolsOrigin = CGPoint(x: 0, y: 134)
        symbolsView = SymbolsBlockView(origin: symbolsOrigin, model: model.weekSymbols)
        view.addSubview(symbolsView)
        
        todayView = CircleView(frame: .zero)
        view.addSubview(todayView)
        
        let calendarOrigin = CGPoint(x: 0, y: 0)
        calendarView = DatesBlockView.init(origin: calendarOrigin, model: model.presentedBlock)
        view.addSubview(calendarView)
        
        highlightToday()
    }
    
    @objc func onClickSelector() {
        let number: Int = buttonsControl.selectedSegment
        updateCalendarView(bias: number - 1)
        buttonsControl.setSelected(false, forSegment: number)
    }
    
    private func updateCalendarView(bias: Int) {
        resetTodayView()
        model.biasOfMonths = bias == 0 ? 0 : model.biasOfMonths + bias
        bindModel(bias)
    }
    
    private func bindModel(_ bias: Int) {
        labelDisplayedMonth.setNewValue(model.presentedMonth, bias: bias)
        calendarView.setNewValue(model.presentedBlock, bias: bias)
        highlightToday()
    }
    
    private func resetTodayView() {
        if todayView.frame.size != .zero {
            todayView.setFrameSize(.zero)
            todayView.alphaValue = 0
            model.today = nil
        }
    }
    
    private func highlightToday() {
        guard let today = model.today
            else { return }
        if todayView.frame.size == .zero {
            let targetCellFrame = calendarView.frameTodaysDateCell(today.0)
            let targetCircleSize = NSSize(width: targetCellFrame.height * 1.5 ,
                                          height: targetCellFrame.height * 1.5)
            let circleOrigin = CGPoint(x: targetCellFrame.midX,
                                       y: targetCellFrame.midY)
            todayView.frame.origin = circleOrigin
            
            NSView.animate(withDuration: 0.2,
                           delay: 0.25,
                           timingFunction: CAMediaTimingFunction(name: .easeIn),
                           animations: {
                                self.todayView.frame.size = targetCircleSize
                                self.todayView.frame.origin.x -= targetCircleSize.width / 2
                                self.todayView.frame.origin.y -= targetCircleSize.height / 2
                                self.todayView.alphaValue = today.1 != .extraday ? 0.9 : 0.6
            })
        }
    }
    
}
