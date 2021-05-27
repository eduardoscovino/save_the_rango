class SignaturesController < ApplicationController
  def index
    @signatures = Signature.all
  end

  def show
    @signature = Signature.find(parmas[:id])
  end
end
