module MicroFactory
  def factory(klass, attributes)
    name        = klass.to_s
    underscored = name.gsub(/([a-z])(::)?([A-Z])/, '\1_\3').downcase

    class_eval(<<-END, __FILE__, __LINE__ + 1)
      def build_#{underscored}(attributes = {})
        attributes = valid_#{underscored}_attributes.merge(attributes)
        #{name}.new(attributes)
      end

      def create_#{underscored}(attributes = {})
        build_#{underscored}(attributes).tap {|x| x.save!}
      end

      def valid_#{underscored}_attributes
        #{attributes.inspect}
      end
    END
  end
end