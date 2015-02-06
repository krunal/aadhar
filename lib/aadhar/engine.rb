module Aadhar
  class Engine < ::Rails::Engine
    isolate_namespace Aadhar

    initializer  "aadhar.load_helpers" do
        ActiveSupport.on_load(:action_controller) do
            include Aadhar::Authenticate
        end
    end
  end
end
