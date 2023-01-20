# frozen_string_literal: true

# top-level documentation
class WordPlay
end

# top-level documentation
class String
  def sentences
    gsub(/\n|\r/, ' ').split(/\.\s*/)
  end
end

p %q{Hello. This is a test of basic sentence splitting.
It even works over multiple lines.}.sentences