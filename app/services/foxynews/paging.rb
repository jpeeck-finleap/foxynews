class Foxynews::Paging

  def initialize(args)
    args.each do |name, value|
      instance_variable_set("@#{name}", value)
      self.class.send(:attr_accessor, name)
    end
  end
end
