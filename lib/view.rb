
class View
    def create_gossip
        puts "Quel est ton prénom?"
        print ">" 
        author = gets.chomp
        puts "Balance le doss'!"
        print ">"
        content = gets.chomp

       params = { content: content, author: author }

    end

    def index_gossips(gossips)
        puts "Liste des potins :"
        gossips.each_with_index do |gossip, index|
            puts "#{index + 1}. #{gossip.author} : #{gossip.content}"
        end
    end

    def ask_for_index_to_delete
        puts "Quel potin souhaitez-vous supprimer ? Entrez le numéro :"
        gets.chomp.to_i
    end

    def confirm_deletion
        puts "Le potin a été supprimé avec succès !"
    end

end
