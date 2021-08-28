module StaticPagesHelper
  def format_string str
    str = str.slice(0, 1).capitalize + str.slice(1..-1)
    str.split("_").join(" ")
  end
end
