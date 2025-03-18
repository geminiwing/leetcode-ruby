# 208. Implement Trie (Prefix Tree) - Medium

class Trie
  def initialize()
    @tri = {}
  end

  def insert(word)
    p = @tri

    word.each_char do |c|
      p[c] = {} if p[c].nil?
      p = p[c]
    end

    p['exist'] = true
  end

  def search(word)
    p = @tri

    word.each_char do |c|
      return false if p[c].nil?
      p = p[c]
    end

    p['exist'] == true
  end

  def starts_with(prefix)
    p = @tri

    prefix.each_char do |c|
      return false if p[c].nil?
      p = p[c]
    end

    true
  end
end

# Test

trie = Trie.new()
trie.insert('apple')
puts trie.search('apple')    # true
puts trie.search('app')      # false
puts trie.starts_with('app') # true
trie.insert('app')
puts trie.search('app')      # true
