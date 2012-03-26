require 'java'

module Jxl
  require 'jxl/jxl'
  include_package 'jxl'
  include_package 'jxl.write'

  JFile = java.io.File

  module WorkbookMixin
    def sheet(sheet_name, position = 0, &block)
      sheet = getSheet(sheet_name)
      unless sheet
        sheet = createSheet(sheet_name, position)
      end
      sheet.extend SheetMixin
      yield sheet if block_given?
      sheet
    end
  end

  module SheetMixin
    {
      :label => Jxl::Label,
      :number => Jxl::Number,
    }.each do |name, klass|
      define_method name do |*args|
        cell = klass.new(*args)
        yield cell if block_given?
        addCell cell
      end
    end
  end

  class <<self
    def create(file_name)
      file = JFile.new(file_name)
      workbook = Jxl::Workbook.createWorkbook(file)
      workbook.extend WorkbookMixin 
      yield workbook if block_given?
      workbook.write
    ensure
      workbook.close if defined?(workbook) && workbook
    end
  end
end
