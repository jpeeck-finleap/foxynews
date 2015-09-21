class Foxynews::PressRelease

  def initialize(args)
    args.each do |name, value|
      instance_variable_set("@#{name}", value)
      self.class.send(:attr_accessor, name)
    end
  end

  def parsed_content
    json = JSON.parse(content_as_json)
    return json['data']
  end
end
