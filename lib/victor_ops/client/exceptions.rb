module VictorOps
  class Client

    class Error < StandardError; end

    class MissingSettings < Error; end

    class PostFailure < Error; end

    class NotYetImplemented < Error; end

  end
end
