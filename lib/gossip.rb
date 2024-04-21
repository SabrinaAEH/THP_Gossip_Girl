require 'csv'

class Gossip
attr_reader :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    def fetch_data
        [{"author" => author, "content" => content}]
    end

    def save(file_name)
        data = fetch_data

        CSV.open(file_name, 'wb') do |csv|
            csv << ['author', 'content'] # ce seront mes titres de tableau
            data.each do |gossip|
              csv << [gossip["author"], gossip["content"]]
            end
        end

    end

    def self.all(filename)
        all_gossips = []
        CSV.foreach(filename) do |row|
            author = row[0]
            content = row[1]
            all_gossips << Gossip.new(author, content)
        end
        all_gossips
    end

end
