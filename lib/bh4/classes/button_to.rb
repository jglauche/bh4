require 'bh4/classes/button'

module Bh4
  module Classes
    class ButtonTo < Button
      def initialize(app = nil, *args, &block)
        @url = extract_url_from(*args, &block)
        super
      end

      def append_button_class!(klass)
        case Bh4.framework
          when :rails then append_class! klass
          when :padrino, :middleman then append_class_to! :submit_options, klass
        end
      end

      def append_form_class!(klass)
        case Bh4.framework
          when :rails then append_class! klass, html_attributes, :form_class
          when :padrino, :middleman then append_class! klass
        end
      end

      def accepts_block?
        case Bh4.framework
          when :rails then defined?(ActionView::VERSION) # only Rails >= 4
          when :padrino, :middleman then true
        end
      end
    end
  end
end
