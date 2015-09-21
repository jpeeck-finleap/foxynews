class Foxynews::Clipping

  def initialize(args)
    if args.is_a? Hash
      args.each do |name, value|
        instance_variable_set("@#{name}", value)
        self.class.send(:attr_accessor, name)
      end
    else
      false
    end
  end

end
