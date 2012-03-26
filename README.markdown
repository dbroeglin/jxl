# Jxl: a simple DSL wrapper for JExcelAPI

This is not a real project but a rather a proof of concept for a presentation
I gave at the Geneva JUG. However, the code is functionning and the proof is
valid.

## Installation

    gem install jxl

## Usage

    Jxl.create "report_#{date}.xls" do |workbook|
      workbook.sheet("Sales #{date}") do |sheet|
        sheet.label 0, 0, "City"
        sheet.label 1, 0, "Total amount"
        sheet.label 0, 1, "NY"
        sheet.number 1, 1, 123
      end
    end

