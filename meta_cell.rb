#-----------------------------------------------------------------------------
class MetaDefs
  @@types = {
      :string => "string", :text => "text",
      :integer => "integer", :float => "float",
      :date => "date", :time => "time", :datetime => "datetime",
      :boolean => "boolean"
  }

  def self.types
    @@types
  end
  
  def self.type_by_name(name)
    @@types[name]
  end
end
#-----------------------------------------------------------------------------
class CellMeta
  attr_accessor :id, :class_name, :alter_name, :type_name

  def initialize(id, class_name, alter_name, type_name)
    @id = id
    @class_name = class_name
    @alter_name = alter_name
    @type_name = MetaDefs.type_by_name(type_name)
  end

  def to_s
    "id = #{@id}, class = #{@class_name}, alter = '#{@alter_name}', type = #{@type_name}"
  end
end
#-----------------------------------------------------------------------------
class CellDataItem
  attr_accessor :id, :meta_id

  def initialize(id, meta_id, value, type)
    @string_value, @text_value,
    @integer_value, @float_value,
    @date_value, @time_value, @datetime_value,
    @boolean_value = nil

    @id = id
    @meta_id = meta_id
    @item_type = type

    instance_variable_set("@#{type}_value", value)
  end

  def type
    @item_type
  end

  def get_value
    instance_variable_get("@#{@item_type}_value")
  end

  def set_value(value, type)
    instance_variable_set("@#{@item_type}_value", nil)
    @item_type = type
    if value != nil
      instance_variable_set("@#{type}_value", value)
    end
  end
end
