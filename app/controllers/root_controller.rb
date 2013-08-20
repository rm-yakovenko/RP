class RootController < ApplicationController
  layout 'guest'
  require 'geocoder'

  def feed
    init

    one_km_dist=0.009 #constant, hand made
    radius=10 #km


    #@items=Announce.where(:disabled => false).limit(10)
    half_of_bounds=(one_km_dist*radius)/2
    lg1 = session[:longitude].to_f-half_of_bounds
    lg2 = session[:longitude].to_f+half_of_bounds
    lt1 = session[:latitude].to_f-half_of_bounds
    lt2 = session[:latitude].to_f+half_of_bounds
    @items=Announce.all(:conditions => {:lg => (lg1..lg2), :lt => (lt1..lt2), :disabled => false, })

    @news=News.where(:disabled => false).order('created_at DESC').limit(3)
    @random = Announce.where(:disabled => false).order("RANDOM()").limit(6)
  end


  def tag
    init
    tag = request.params[:id]
    @tag_name=tag
    announce = Announce.arel_table
    @items_with_tag = Announce.where(announce[:tag_1].eq(tag).or(announce[:tag_2].eq(tag).or(announce[:tag_3].eq(tag))))
    @news = News.active
  end

  def all_tags
    init
    @tags=Tag.active
    @news=News.active
  end

  def rand
    @stringUtil=StringUtil.new
    @news=News.where(disabled: false).order('created_at DESC').limit(3)
    @random_list=Announce.where(:disabled => false).limit(20)
  end

  def get_tag_name id
    #feetch from the base
    'fruits'
  end

  def announce
    id= params[:id]
    @announce= Announce.find id
  end

  def init
    unless session[:init] or same_ip("194.28.172.27")
      #location=Geocoder.search(request.ip)
      #session[:ip]=request.ip
      location=Geocoder.search("194.28.172.27") #For work
      session[:ip]="194.28.172.27"
      session[:country]=location[0].data['country_name']
      session[:city]=location[0].data['city']
      session[:longitude]=location[0].data['longitude']
      session[:latitude]=location[0].data['latitude']
      session[:init]=true
    end
  end

  def same_ip ip
    ip==session[:ip]
  end
end

