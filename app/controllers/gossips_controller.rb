class GossipsController < ApplicationController

    def index
      @gossip = Gossip.all
    end
  
    def show
      @gossip = Gossip.find(params[:id])
     ##1231## @gossip = Gossip.find(params[:id])
     ##1231## user = User.find(@gossip.user_id)
    end
  
    def new
      # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
      @gossip = Gossip.new
    end
  
    def create
      # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
      # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
      #@new_gossip = Gossip.create(params["gossip_text"])
      #@gossip_new = Gossip.create(content: params["gossip_text"], title: "blalgdfjkgjhfds", user: User.last)
      @gossip = Gossip.create(gossip_params)
      redirect_to gossips_path(gossip.id)
    end
  
    def edit
      # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
      @gossip = Gossip.find(params[:id])
    end
  
    def update
      # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
      @gossip = Gossip.find(params[:id])
      @gossip.update(post_params)
      redirect_to gossips_path
    end

    private

    def post_params
      post_params = params.require(:gossip).permit(:title, :content)
    end
  
    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to gossips_path
    end

  end

