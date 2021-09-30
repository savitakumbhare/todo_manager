class TodosController < ApplicationController
  def index
    render plain: Todo.all.
  end
end
