module Helpers
  def deviation (a, b)
    a.zip(b).map! { |group|  group.inject(:-).abs < 1e-11 }.uniq == [true]
  end
end