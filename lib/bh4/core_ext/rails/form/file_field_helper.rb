require 'bh4/core_ext/rails/form/base_helper'

module Bh4
  module Form
    module FileFieldHelper
      include BaseHelper

      def file_field(method, options={})
        base_field method, :file, options do
          super method, options
        end
      end
    end
  end
end