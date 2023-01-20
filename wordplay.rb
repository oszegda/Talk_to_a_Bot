# frozen_string_literal: true

# top-level documentation
class WordPlay
  def self.best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - desired_words).length
    end
    ranked_sentences.last
  end

  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|
      case pronoun.downcase
      when 'i'
        'you'
      when 'you'
      'me'
      when 'me'
        'you'
      when 'i am'
      'you are'
      when 'you are'
        'i am'
      when 'your'
        'my'
      when 'my'
        'your'
      end
    end.sub(/^me\b/i, 'i')
  end
end

# top-level documentation
class String
  def sentences
    gsub(/\n|\r/, ' ').split(/\.\s*/)
  end

  def words
    scan(/\w[\w\'\-]*/)
  end
end

hot_words = %w{test ruby great}
my_string = 'This is a test. Dull sentence here. Ruby is great. So is cake'
t = my_string.sentences.find_all do |s|
  s.downcase.words.any? { |word| hot_words.include?(word)}
end

puts WordPlay.switch_pronouns('Your cat is fighting with my cat')
puts WordPlay.switch_pronouns('You are my robot')
puts WordPlay.switch_pronouns('My cat is fighting with you')
puts WordPlay.switch_pronouns('I gave you hope')
puts WordPlay.switch_pronouns('You gave me hope')

while input = gets
  puts '>> ' + WordPlay.switch_pronouns(input).chomp + '?'
end
