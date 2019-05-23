class PersonagensController < ApplicationController
  def index
    if params[:agilidade].present?
      @personagens = Personagem.where(agilidade: params[:agilidade])
    else
      @personagens = Personagem.all
    end
  end

  def new
    @personagem = Personagem.new
  end

  def show
    @personagem = Personagem.find(params[:id])
  end


  def create
    @personagem = Personagem.new(personagem_params)
    if @personagem.save
      redirect_to @personagem, :notice => 'Personagem criado com sucesso.'
    else
      render :new
    end
  end

  def personagem_params
    params.
        require(:personagem).
        permit(:nome, :forca, :resistencia, :agilidade, :destreza)
  end

  def edit
    @personagem = Personagem.find(params[:id])
  end

  def update
    @personagem = Personagem.find(params[:id])
    if @personagem.update(poder_params)
      redirect_to @personagem,
                  notice:'Dados do personagem atualizados.'
    else
      render action: :edit
    end
  end

  def destroy
    @personagem = Personagem.find(params[:id])
    @personagem.destroy
    redirect_to personagens_url
  end

end
