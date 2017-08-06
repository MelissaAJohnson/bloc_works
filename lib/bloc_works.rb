require "bloc_works/version"
require "bloc_works/dependencies"
require "bloc_works/controller"
require "bloc_works/router"
require "bloc_works/utility"

module BlocWorks
  class Application
    def call(env)
      #[200, {'Content-Type' => 'text/html'}, []]
      response = fav_icon(env)

      if(response)
        return response
      else
        controller, action = controller_and_action(env)[0].new(env), controller_and_action(env)[1]
        if controller.respond_to?(action)
          var = controller.send(action)
          [200, {'Content-Type' => 'text/html'}, [var]]
        else
          [404, {"Content-Type" => "text/plain"}, []]
        end
      end
    end
  end
end
