class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]


  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find(params[:id])
  end

  # GET /sites/new
  def new
    @site = Site.new
  end


  # POST /sites
  # POST /sites.json
  def create
    require 'open-uri'
    @site = Site.find_or_initialize_by(site_params)
      if @site.save
        #render text: @site
        redirect_to site_path(@site)
      else
        redirect_to :back, :flash => {:error => @site.errors[:url]}
      end
  end

  # Define the Entry object
  class Entry
    def initialize(title, link)
      @title = title
      @link = link
    end
    attr_reader :title
    attr_reader :link
  end

  def scrape_web
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://google.com/"))

    entries = doc.css('.entry')
    @entriesArray = []
    entries.each do |entry|
      title = entry.css('p.title>a').text
      link = entry.css('p.title>a')[0]['href']
      @entriesArray << Entry.new(title, link)
    end

    render template: 'sites/scrape_web'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:url)
    end
end
