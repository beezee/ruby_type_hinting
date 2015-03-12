require "type_hinting/version"

module TypeHinting

  def self.included(base)
    base.extend ClassMethods
  end

  def skipped_optional_param(param_type, value)
    param_type != :req && value.nil?
  end
  
  module ClassMethods

    def return_type(name, type)
      method = instance_method(name)
      define_method(name) do |*args|
        r = method.bind(self).call(*args)
        unless r.kind_of?(type)
          raise TypeError, "Invalid return type of #{r.class}, expecting #{type}"
        end
        r
      end
    end

    def param_types(name, *arg_types)
      method = instance_method(name)
      sig_args = method.parameters
      define_method(name) do |*args|
        arg_types.zip(sig_args, args).each do |(type, (required, name), arg)|
          if !arg.kind_of?(type) && !skipped_optional_param(required, arg)
            raise TypeError, "Invalid type #{arg.class} for " <<
              "parameter #{name}, expecting #{type}"
          end
        end
        method.bind(self).call(*args)
      end
    end
  end
end
