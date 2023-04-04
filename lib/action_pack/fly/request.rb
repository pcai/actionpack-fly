module ActionPack
  module Fly
    module Request
      def remote_ip
        remote_ip_fly || super
      end

      private

      def remote_ip_fly
        @env["HTTP_FLY_CLIENT_IP"]
      end
    end
  end
end

ActionDispatch::Request.class_eval { prepend ActionPack::Fly::Request }
