module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def validate!
      self.class.validate_hash.each do |key, value|
        variable = eval(key.to_s)
        if variable.class == Array
          variable.each { |element| validate_error(element, key, value) }
        else
          validate_error(variable, key, value)
        end
      end
    end

    def validate_error(variable, key, value)
      case value.first
      when :presence
        raise NameError, "NameError #{key}" if variable.to_s.strip.empty?
      when :format
        raise NameError, "NameError #{key}" if variable !~ Regexp.new(value[1])
      when :type
        raise NameError, "NameError #{key}" if value[1..value.size].none? { |a| a == variable.class }
      end
    end

    def valid?
      validate!
      true
    rescue NameError
      false
    end
  end

  module ClassMethods
    attr_accessor :validate_hash
    def validate(name, *param)
      return unless %i[presence format type].include?(param.first)

      self.validate_hash ||= {}
      self.validate_hash.merge!(name => param)
    end
  end
end
