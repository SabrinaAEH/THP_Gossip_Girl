require_relative 'controller.rb'

class Router

    def initialize
    @controller = Controller.new
    end

    def perform
        puts " 🗣️ Bienvenue dans THE GOSSIP PROJECT! 🗣️ "
        while true  

            puts "Tu veux faire quoi?"
            puts "1/ Je veux créer un gossip"
            puts "2/ Je veux afficher tous les potins"
            puts "3/ Je veux supprimer un potin"
            puts "4/ Je veux quitter l'app"
            params = gets.chomp.to_i

            case params
            when 1
                puts "Tu as choisi de créer un gossip"
                @controller.create_gossip

            when 2
                puts "Voici tous les gossips!"
                @controller.index_gossips

            when 3
                puts "Quel potin souhaitez-vous supprimer ? Entrez le numéro :"
                gets.chomp.to_i
                @controller.destroy_gossip

            when 4
                puts "A bientôt!"
                break

            else 
                puts "Choix invalide! Merci de rentrer un choix valide"
            end
        end

    end

end

