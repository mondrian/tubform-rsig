class JJWorksFormBuilder < ActionView::Helpers::FormBuilder

  attr_accessor :object_class

  helpers = field_helpers +
            %w{date_select datetime_select time_select} +
            %w{collection_select select country_select time_zone_select} -
            %w{hidden_field label fields_for submit ext_lookup_field ext_date_picker} # Don't decorate these

  helpers.each do |name|
    methods = %Q!
    def #{name}(field, *args)
      options = args.extract_options\!
      return super if options.delete(:disable_builder)
      if options[:class] == 'date'
        options[:value] = eval("object.\#{field}.strftime(\'\%d\/\%m\/\%Y\') if object.\#{field}")
      end
      args << options
      field_label(field, options) << super
    end
    !
    class_eval methods
  end

  def submit(value = nil, options = {})
    if self.object && value.nil?
      value = self.object.new_record? ? I18n.t( 'txt.shared.create' ) : I18n.t( 'txt.shared.update' )
    end
    @template.content_tag( :p, super( value, options ) )
  end

  def field_label( field, options )
    top = /top:(\d*)/.match(options[:style])[1]
    left = /left:(\d*)/.match(options[:style])[1]
    options[:label_style] ||= "top:#{top.to_i-15}px;left:#{left.to_i+2}px;"
    self.label( field, options.delete( :label ) || self.object_class.human_attribute_name( field.to_s ),
      :class => options[:label_class],
      :style => options[:label_style])
  end

  def initialize(object_name, object, template, options, proc)
    super
    self.object_class = self.object.nil? ? self.object_name.to_s.camelize.constantize : self.object.class
  end

end

