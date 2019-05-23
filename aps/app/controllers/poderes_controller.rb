class PoderesController < ApplicationController
  def index
    if params[:tipo].present?
      @poderes = Poder.where(tipo: params[:tipo])
    else
      @poderes = Poder.all
    end
  end

  def new
    @poder = Poder.new
  end

  def show
    @personagem = Personagem.find(params[:id])
    @poder = Poder.find(params[:id])
  end


  def create
    @poder = Poder.new(poder_params)
    if @poder.save
      redirect_to @poder, :notice => 'Poder criado com sucesso.'
    else
      render :new
    end
  end

  def poder_params
    params.
        require(:poder ).
        permit(:nome, :tipo)
  end

  def edit
    @poder = Poder.find(params[:id])
  end

  def update
    @poder = Poder.find(params[:id])
    if @poder.update(poder_params)
      redirect_to @poder,
                  notice:'Poder atualizado.'
    else
      render action: :edit
    end
  end

  def destroy
    @poder = Poder.find(params[:id])
    @poder.destroy
    redirect_to poderes_url
  end

end