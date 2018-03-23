module PublicMarket
  # UID Generator module. Use it by adding:
  # include PublicMarket::UIDGenerator.new(prefix: 'PM', letters: true, length: 13)
  class UIDGenerator < Module
    BASE           = 10
    DEFAULT_LENGTH = 9

    attr_accessor :prefix, :length

    def initialize(options)
      @prefix     = options.fetch(:prefix)
      @length     = options.fetch(:length, DEFAULT_LENGTH)
      @letters    = options[:letters]
    end

    def included(host)
      generator_method   = method(:generate_permalink)
      generator_instance = self

      host.class_eval do
        validates(:uid, presence: true, uniqueness: { allow_blank: true })

        before_validation do |instance|
          instance.uid ||= generator_method.call(host)
        end

        define_singleton_method(:uid_generator) { generator_instance }
      end
    end

    private

    def generate_permalink(host)
      length = @length

      loop do
        candidate = new_candidate(length)
        return candidate unless host.exists?(uid: candidate)

        # If over half of all possible options are taken add another digit.
        length += 1 if host.count > Rational(BASE**length, 2)
      end
    end

    def new_candidate(length)
      characters = @letters ? 36 : 10
      @prefix + SecureRandom.random_number(characters**length).to_s(characters).rjust(length, '0').upcase
    end
  end
end
