class Foxynews::PressRelease

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

  def short_summary
    summary.split(' ')[0..99].join(' ') + '...'
  end

  def parsed_content
    json = JSON.parse(content_as_json)
    return json['data']
  end
end
