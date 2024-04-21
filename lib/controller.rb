require_relative 'gossip.rb'
require_relative 'view.rb'

class Controller

    def initialize
        @view = View.new
    end

    def create_gossip
        params = @view.create_gossip
        gossip = Gossip.new(params[:author], params[:content])
        gossip.save('gossips.csv')
    end

    def index_gossips
        gossips = Gossip.all('gossips.csv') # Cette méthode hypothétique doit retourner tous les potins du fichier CSV
        @view.index_gossips(gossips) # Appeler la méthode index_gossips de la vue pour afficher les potins
    end

    def destroy_gossip
        gossips = Gossip.all('gossips.csv')
        @view.index_gossips(gossips)

        # Supprimer le potin du fichier CSV
        delete_gossip_from_csv(index_to_delete)
    end

    private

    def delete_gossip_from_csv(index)
        lines = File.readlines('gossips.csv')
        
        # Supprimer la ligne correspondant au potin à supprimer
        lines.delete_at(index - 1)

        # Écrire les lignes restantes dans le fichier CSV
        File.open('gossips.csv', 'w') do |file|
            file.puts lines
        end

        @view.confirm_deletion
    end


end


