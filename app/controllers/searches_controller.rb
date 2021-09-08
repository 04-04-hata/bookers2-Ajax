class SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    pp params
    @datas = search_for(@how,@model,@value)
  end

  private

  def match(model,value)

    if model == 'User'
      User.where(name:value)
    elsif model == 'Book'
      Book.where(title:value)
    end

  end

  def forward(model,value)

    if model == 'User'
      User.where("name LIKE ?", "#{value}%")
    elsif model == 'Book'
      Book.where("title LIKE ?", "#{value}%")
    end

  end

  def backward(model,value)

    if model == 'User'
      User.where("name LIKE ?", "%#{value}")
    elsif model == 'Book'
      Book.where("title LIKE ?", "%#{value}")
    end

  end

  def partical(model,value)

    if model == 'User'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'Book'
      Book.where("title LIKE ?", "%#{value}%")
    end

  end

  def search_for(how,model,value)

    case how

      when 'match'
        match(model,value)

      when 'forward'
        forward(model,value)

      when 'backward'
        backward(model,value)

      when 'partical'
        partical(model,value)

    end

  end

end
