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
    private var calendarView: CalendarView!
    private var todayView: CircleView!
    private var biasOfMonths = 0
    private var model = [[SCDate]]()
    
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 304, height: 190))
        preferredContentSize = NSMakeSize(0, 190)
    }
    
    override func viewDidLoad() {
        model = DatesController.currentBlock(withBiasOfMonths: biasOfMonths)
        configureSubviews()
    }


    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        bindModel()
        completionHandler(.newData)
    }
    
    
    // MARK: - Methods
    
    private func configureSubviews() {
        let labelValue = DatesController.presentedMonth(withBiasOfMonths: biasOfMonths)
        let labelOrigin = CGPoint(x: 2, y: 168)
        labelDisplayedMonth = PresentedMonthLabel(origin: labelOrigin, value: labelValue)
        view.addSubview(labelDisplayedMonth)
        
        let buttonsOrigin = CGPoint(x: 150, y: 163)
        buttonsControl = ButtonsSegmentedControl(origin: buttonsOrigin)
        buttonsControl.target = self
        buttonsControl.action = #selector(onClickSelector)
        view.addSubview(buttonsControl)
        
        let calendarOrigin = CGPoint(x: 0, y: 0)
        calendarView = CalendarView.init(origin: calendarOrigin)
        view.addSubview(calendarView)
    }
    
    @objc func onClickSelector() {
        let number: Int = buttonsControl.selectedSegment
        switch number {
            case 0: updateCalendarView(bias: -1)
            case 1: updateCalendarView(bias: 0)
            case 2: updateCalendarView(bias: 1)
            default: break
        }
        buttonsControl.setSelected(false, forSegment: number)

    }
    
    private func updateCalendarView(bias: Int) {
        if todayView != nil {
            todayView.removeFromSuperview()
            todayView = nil
        }
        biasOfMonths = bias == 0 ? 0 : biasOfMonths + bias
        model = DatesController.currentBlock(withBiasOfMonths: biasOfMonths)
        labelDisplayedMonth.string = DatesController.presentedMonth(withBiasOfMonths: biasOfMonths)
        bindModel()
    }
    
    private func bindModel() {
        for row in 0 ..< model.count {
            for column in 0 ..< model[row].count {
                let index = (8 * row + column) + 8
                let cell = calendarView.cells[index]
                let value: String
                switch model[row][column].type {
                    case .weekNumber: value = "#\(model[row][column].value)"
                    case .weekday, .weekend, .irrelevant: value = "\(model[row][column].value)"
                }
                
                let kind: CellView.Kind
                switch model[row][column].type {
                    case .weekNumber: kind = .numberWeek
                    case .weekday: kind = .weekday
                    case .weekend: kind = .weekend
                    case .irrelevant: kind = .extraday
                }
                
                cell.bindModel(kind: kind, value: value)
                
                highlightToday(row, column, cell)
            }
        }
    }
    
    private func highlightToday(_ row: Int, _ column: Int, _ cell: CellView) {
        if model[row][column].isToday && todayView == nil {
            let circleSize = NSSize(width: 22,
                                    height: 22)
            let circleOrigin = CGPoint(x: cell.frame.origin.x + 8,
                                       y: cell.frame.origin.y - 4)
            todayView = CircleView(frame: NSRect(origin: circleOrigin, size: circleSize))
            todayView.alphaValue = model[row][column].type != .irrelevant ? 0.9 : 0.6
            view.addSubview(todayView, positioned: .below, relativeTo: cell)
        }
    }
    
}

