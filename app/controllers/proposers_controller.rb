class ProposersController < ApplicationController

  def new
    @proposer = Proposer.new
  end

  def create
    @proposer = Proposer.create(proposer_params)
    @proposer.save
    redirect_to '/stores', notice: 'Вы успешно зарегистрировались'
  end

  private def proposer_params
    params.require(:proposer).permit(:full_name, :email, :password)
  end
end
