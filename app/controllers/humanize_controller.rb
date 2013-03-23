require "CSV"

class HumanizeController < ApplicationController
  def index
    @l = CSV.read(File.join(Rails.root, "files", "RDJinterface.csv"), :col_sep => ";")
    Dir.glob(File.join(Rails.root, "files", "WRDKBIFP*[^c][^s][^v]")).each do |f|
        csv << @l.transpose[0]
        CSV.read(f).each do |r|
          row = Array.new
          (@l.count).times do |i|
            s = @l[i][4].to_i + 2
            e = s + @l[i][3].to_i - 1
            row[i] = r.to_s[s..e].strip
          end
          csv << row
        end
      end
    end
  end
end
