class NewsController < ApplicationController
  layout 'superuser'

  def p_all
    @active_news = News.where(:disabled => false)
    @disabled_news =News.where(:disabled => true)
  end

  def p_add
    @tags= Tag.where(:disabled =>false)
  end

  def c_save
    news = params[:news]
    item = News.new

    item.title=news[:title]
    item.short_info=news['short_description']
    item.content=news['full_description']
    unless news[:image].nil?
      item.image=news[:image]
    end
    item.user_id=session[:id]

    unless news[:tag_1].nil?
      item.tag_1 =news[:tag_1]
    end
    unless news[:tag_2].nil?
      item.tag_2 =news[:tag_2]
    end
    unless news[:tag_3].nil?
      item.tag_3 =news[:tag_3]
    end


    item.save
    redirect_to :manage_news

  end

  def c_disable
    if is_core_admin
      id=params[:id]
      news = News.find id
      unless news.nil?
        news.disabled=true
        news.save
      end
      redirect_to :back
    else
      redirect_to :fail_permissions
    end
  end

  def c_delete
    if is_core_admin
      id=params[:id]
      news = News.find id
      unless news.nil?
        news.delete
      end
      redirect_to :back
    else
      redirect_to :fail_permissions
    end
  end

  def p_edit
  end

  def c_update

  end

  def c_activate
    if is_core_admin
      id=params[:id]
      news = News.find id
      unless news.nil?
        news.disabled=false
        news.save
      end
      redirect_to :back
    else
      redirect_to :fail_permissions
    end
  end
end
