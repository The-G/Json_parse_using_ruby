class LottoController < ApplicationController
  def index
    
  end

  def show
    # @lotto = 7.times.map{ 1 + Random.rand(16) }
    @lotto = (0..45).to_a.sample(6)

    require 'json'
    
    url = 'http://nlotto.co.kr/common.do?method=getLottoNumber&drwNo='
    json_num= JSON.parse(HTTParty.get(url).body)
    to_crawl = ['drwtNo1','drwtNo2','drwtNo3','drwtNo4','drwtNo5','drwtNo6','bnusNo']

    @real_num = Array.new
    to_crawl.each do |w|
      @real_num.push(json_num[w])
    end

    # @same_norm = (@lotto & @real_num[0,6])
    @same_norm = (@real_num[0,6] & [19,12,6,41,34,26])
    # @same_bonus = (@lotto & [@real_num.last])
    @same_bonus = ([@real_num.last] & [4])

    if @same_norm.count == 6
      @result = "1등(15억)"
    elsif @same_norm.count == 5 && @same_bonus
      @result = "2등(4000만원)"
    elsif @same_norm.count == 4 
      @result = "3등(120만원)"
    elsif @same_norm.count == 3 
      @result = "4등(5만원)"
    elsif @same_norm.count == 2 
      @result = "5등(5천원)"
    elsif @same_norm.count == 1 
      @result = "꽝"
    else
      @result = "꽝"
    end
    
  end


end
