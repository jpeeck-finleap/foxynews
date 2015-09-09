class Foxynews::Presskit

  def initialize(args)
    args.each do |name, value|
      value.map! {|m| OpenStruct.new(m) } if name == 'media' && value.present?

      instance_variable_set("@#{name}", value)
      self.class.send(:attr_accessor, name)
    end
  end
end
