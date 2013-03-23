class ConvertController < ApplicationController
  def show
    @abc = Rails.root
    f = File.open(File.join(Rails.root, "xml", "trades.xml"), "r")
    @doc = Nokogiri::XML(f)
    f.close
  end
end




=begin


aList = ["fred", " ", "harry"]
[x for x in aList if len(x.strip()) > 0]  =>  ["fred", "harry"]

aList = ["fred", "", "harry"].reject{ |x| x.empty? }  =>  ["fred", "harry"]



for _ in xrange(n): foo()
n.times { |i| foo }



zip(*a)[0]  =>  retrieve the first column of a bi-dimensional list
a.transpose[0]  =>  retrieve the first column of a bi-dimensional array


=end