# frozen_string_literal: true

class StreamConfigurationType < ActiveRecord::Type::Value
  def type
    :json
  end

  def cast_value(value)
    case value
    when String
      decoded = begin
        ActiveSupport::JSON.decode(value)
      rescue StandardError
        nil
      end
      StreamConfiguration.new(decoded) unless decoded.nil?
    when Hash
      StreamConfiguration.new(value)
    when StreamConfiguration
      value
    else
      raise(ActiveRecord::SerializationTypeMismatch,
            "Attribute was supposed to be a StreamConfiguration, but was a #{value.class}. -- #{value.inspect}")
    end
  end

  def serialize(value)
    case value
    when Hash, StreamConfiguration
      ActiveSupport::JSON.encode(value)
    else
      super
    end
  end

  def changed_in_place?(raw_old_value, new_value)
    cast_value(raw_old_value) != new_value
  end
end
