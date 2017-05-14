class HomeController < ApplicationController
  
  require 'will_paginate/array'
  
  ######### 소중이톡 적으려면 패스워드 쳐야함 
  http_basic_authenticate_with name: "admin", password: "1234567890", only: [:page_sojoong2talk_write, :page_announce_write]
  
##########################################################################################  
################################메인화면 관련#############################################
##########################################################################################

  def page_main
    @linetalks = Linetalk.all.order("id desc")
    @sudas = Suda.order("created_at desc").limit(4) #최근 4개
    @reviews = Review.order("created_at desc").limit(4) #최근 4개
    @announces = Announce.order("created_at desc").limit(3)
    @sojoong2talks = Sojoong2talk.order("created_at desc").limit(4)
  end
  
  def page_main_linetalk_write
    talk = Linetalk.new
    talk.linetalk_content = params[:linetalk_content_view]
    talk.save
    render :nothing => true
  end

##########################################################################################  
##################################공지사항 관련###########################################
##########################################################################################

  def page_announce
    @announces = Announce.order("id desc").paginate(:page => params[:page], :per_page => 10)
  end

  def page_announce_write
    
  end

  def page_announce_write_save
    annonunce = Announce.new
    annonunce.announce_title = params[:announce_title_view]
    annonunce.announce_content = params[:announce_content_view]
    annonunce.save
    
    redirect_to "/home/page_announce"
  end


##########################################################################################  
################################소중이톡 관련#############################################
##########################################################################################

  def page_sojoong2talk
    @temp = Sojoong2talk.all
    
  end


  def page_sojoong2talk_write
    
    
    
  end

  def page_sojoong2talk_write_save
    
    sojoong2talk = Sojoong2talk.new
    # 썸네일 저장
    thumbnail = Sojoong2talkUploader.new
    thumbnail.store!(params[:thumbnail_view])
    sojoong2talk.talk_thumbnail = thumbnail.url
    
    #컨텐츠 저장
    talk_content = Sojoong2talkUploader.new
    talk_content.store!(params[:content_view])
    sojoong2talk.talk_content = talk_content.url
    
    sojoong2talk.save
    
    redirect_to "/home/page_sojoong2talk"
  end
##########################################################################################  
##############################알뜰게시판 관련#############################################
##########################################################################################
  
  def page_price
    
      # 타이틀 정보만 있는 경우
      if (params[:lowest_price].present? == false) && (params[:categories].present? == false) && (params[:search_product_name].present? == true)
        search_arr = params[:search_product_name].to_s.split(" ")
        if search_arr.length==1
          @search_product_name = Product.where("product_title LIKE '%#{params[:search_product_name]}%'").order("product_price asc").group_by {|t| t.product_title}  
        else
          i = 0
          @search_product_name = Product.where("product_title LIKE '%#{search_arr[0]}%'")
          while i<search_arr.length
            i = i + 1
            @search_product_name = @search_product_name.where("product_title LIKE '%#{search_arr[i]}%'").order("product_price asc").group_by {|t| t.product_title}
          end
        end
        @search_product_name_keys = @search_product_name.keys
        @search_product_name_keys_paginate = @search_product_name_keys.paginate(:page => params[:page], :per_page => 20)
      
      # 가격정보만 있는 경우
      elsif (params[:lowest_price].present? == true) && (params[:categories].present? == false) && (params[:search_product_name].present? == false)
      
        @search_product_name = Product.where("product_price >= ? AND product_price <= ?", params[:lowest_price], params[:highest_price]).order("product_price asc").group_by {|t| t.product_title}
        @search_product_name_keys = @search_product_name.keys
        @search_product_name_keys_paginate = @search_product_name_keys.paginate(:page => params[:page], :per_page => 20)
        
      
      # 가격정보, 카테고리 있고 타이틀 없는경우 
      elsif (params[:lowest_price].present? == true) && (params[:categories].present? == true) &&  (params[:search_product_name].present? == false) 
      
        product_sub_category = Product.pluck(:product_sub_category).uniq
      
        category_arr = params[:categories].split(",")
        sub_category_arr = category_arr & product_sub_category
        main_category_arr = category_arr - sub_category_arr
        
        result_a = Product.where(product_category: main_category_arr).pluck(:id).uniq
        result_b = Product.where(product_sub_category: sub_category_arr).pluck(:id).uniq
        ids = result_a + result_b
        
        # sub카테고리 그냥 카테고리 인것들 고르기.
        prducts = Product.where(id: ids)
        
      #   # # 타이틀로 거르기
      #   # result_d = result_c.where(product_title: params[:search_product_name])
        
        # 가격정보까지 거르기.
        @search_product_name = prducts.where("product_price >= ? AND product_price <= ?", params[:lowest_price].to_i, params[:highest_price].to_i).order("product_price asc").group_by {|t| t.product_title}
        
        @search_product_name_keys = @search_product_name.keys
        @search_product_name_keys_paginate = @search_product_name_keys.paginate(:page => params[:page], :per_page => 20)
          
      
      # 가격정보, 타이틀만 있을때
      elsif (params[:lowest_price].present? == true) && (params[:categories].present? == false) &&  (params[:search_product_name].present? == true) 
        
        
        search_arr = params[:search_product_name].to_s.split(" ")
        if search_arr.length==1
          products_title_filter = Product.where("product_title LIKE '%#{params[:search_product_name]}%'")  
        else
          i = 0
          products_title_filter = Product.where("product_title LIKE '%#{search_arr[0]}%'")
          while i<search_arr.length
            i = i + 1
            products_title_filter = products_title_filter.where("product_title LIKE '%#{search_arr[i]}%'")
          end
        end
        products_price_filter = products_title_filter.where("product_price >= ? AND product_price <= ?", params[:lowest_price].to_i, params[:highest_price].to_i)
        @search_product_name = products_price_filter.order("product_price asc").group_by {|t| t.product_title}
        @search_product_name_keys = @search_product_name.keys
        @search_product_name_keys_paginate = @search_product_name_keys.paginate(:page => params[:page], :per_page => 20)
      
      # 다 있을 때
      elsif (params[:lowest_price].present? == true) && (params[:categories].present? == true) &&  (params[:search_product_name].present? == true)     
      
        product_sub_category = Product.pluck(:product_sub_category).uniq
      
        category_arr = params[:categories].split(",")
        sub_category_arr = category_arr & product_sub_category
        main_category_arr = category_arr - sub_category_arr
        
        result_a = Product.where(product_category: main_category_arr).pluck(:id).uniq
        result_b = Product.where(product_sub_category: sub_category_arr).pluck(:id).uniq
        ids = result_a + result_b
        
        # sub카테고리 그냥 카테고리 인것들 고르기.
        products = Product.where(id: ids)
        
        # 타이틀로 거르기
        search_arr = params[:search_product_name].to_s.split(" ")
        if search_arr.length==1
          products_title_filter = products.where("product_title LIKE '%#{params[:search_product_name]}%'")  
        else
          i = 0
          products_title_filter = products.where("product_title LIKE '%#{search_arr[0]}%'")
          while i<search_arr.length
            i = i + 1
            products_title_filter = products_title_filter.where("product_title LIKE '%#{search_arr[i]}%'")
          end
        end
        
        # 가격정보까지 거르기.
        @search_product_name = products_title_filter.where("product_price >= ? AND product_price <= ?", params[:lowest_price].to_i, params[:highest_price].to_i).order("product_price asc").group_by {|t| t.product_title}
        
        @search_product_name_keys = @search_product_name.keys
        @search_product_name_keys_paginate = @search_product_name_keys.paginate(:page => params[:page], :per_page => 20)
        
        else
          ran = (1..Product.all.size).to_a.sample(20)
          @search_product_name = Product.find(ran).group_by {|t| t.product_title}
          @search_product_name_keys = @search_product_name.keys
          @search_product_name_keys_paginate = @search_product_name_keys.paginate(:page => params[:page], :per_page => 20)
      end
    
  end
    
##########################################################################################  
##############################자유게시판 관련#############################################
##########################################################################################
  def page_board_free
    @sudas = Suda.order("id desc")
    
    if params[:post_id]
        @id_value = params[:post_id]
    end
  
  end
  
  def page_board_free_detail
    @board_free_detail = Suda.find(params[:post_id])
    
  end
  
  def page_board_free_viewcount
    
    @board_free_viewcount = Suda.find(params[:post_id])
    @board_free_viewcount.suda_viewcount += 1
    @board_free_viewcount.save
    
    render :nothing => true
  end
  
  def page_board_free_write
    
  end
  
  def page_board_free_write_save
    suda = Suda.new
    suda.suda_title = params[:suda_title_view]
    if params[:suda_writer_view].present?
      suda.suda_writer = params[:suda_writer_view]
    else
      suda.suda_writer = "롱메"
    end
    suda.suda_content = params[:suda_content_view]
    suda.suda_passwd = params[:suda_passwd_view]
    suda.save
    
    redirect_to "/home/page_board_free?num=#{suda.id}"
    
  end
  
  def page_board_free_delete
    board_free_delete = Suda.find(params[:post_id])
  
      if board_free_delete.suda_passwd == params[:checksudapw_view]
          board_free_delete.delete
          
          redirect_to '/home/page_board_free'
          
        else
          flash[:notice] = '비밀번호가 틀렸습니다.'
          redirect_to '/home/page_board_free'
      end
    rescue ActiveRecord::RecordNotFound
    # redirect_to '/home/page_board_free'
    
  end
  
  def page_board_free_update
    @page_board_free_update = Suda.find(params[:post_id])
    
      if @page_board_free_update.suda_passwd == params[:checksudapw_view]
            @page_board_free_update = Suda.find(params[:post_id])  
            
            
            
        else
          flash[:notice] = '비밀번호가 틀렸습니다.'
          redirect_to '/home/page_board_free'
      end
      
  
  end
  
  def page_board_free_update_save
    board_free_update = Suda.find(params[:post_id])
    
    board_free_update.suda_title = params[:suda_title_view]
    if params[:suda_writer_view].present?
      board_free_update.suda_writer = params[:suda_writer_view]
    else
      board_free_update.suda_writer = "롱메"
    end
    board_free_update.suda_content = params[:suda_content_view]
    board_free_update.suda_passwd = params[:suda_passwd_view]
    board_free_update.save
    
    redirect_to "/home/page_board_free_detail/#{params[:post_id]}"
    
  end
  
  def page_board_free_request
    @contents = Suda.find(params[:post_id])
    render json: @contents
  end
  
#####################댓글 달기#####################################  
  def page_board_free_reply_save
    sudareply = Sudareply.new
    sudareply.sudareplyname = params[:reply_writer_name]
    sudareply.sudareplycontent = params[:reply_content]
    sudareply.suda_id = params[:id_of_post]
    sudareply.save
    
    render :nothing => true
  end
    
  
  
##########################################################################################
##########################################################################################
##########################################################################################


##########################################################################################  
################################리뷰게시판 관련###########################################
##########################################################################################

  def page_board_review
    @reviews = Review.order("id desc")
  end
  
  def page_board_review_detail
    @board_review_detail = Review.find(params[:post_id])
    
  end
  
  def page_board_review_viewcount
    
    @board_review_viewcount = Review.find(params[:post_id])
    @board_review_viewcount.review_viewcount += 1
    @board_review_viewcount.save
    
    render :nothing => true
  end
  
  def page_board_review_write
    # I will explain this part in a moment.
    websites_filter = Product.pluck(:product_website).uniq
    
      if params[:term]
        @websites = websites_filter.grep(/#{params[:term]}/)
      else
        @websites = websites_filter
      end
    
    
      respond_to do |format|  
        format.html # index.html.erb  
    # Here is where you can specify how to handle the request for "/people.json"
        format.json { render :json => @websites.to_json }
        end
  end
  
  def page_board_review_write_save
    review = Review.new
    review.review_title = params[:review_title_view]
    if params[:review_writer_view].present?
      review.review_writer = params[:review_writer_view]
    else
      review.review_writer = "롱메"
    end
    review.review_content = params[:review_content_view]
    review.review_passwd = params[:review_passwd_view]
    review.review_website = params[:review_website_view]
    review.review_prod_name = params[:review_prod_name_view]
    # review.review_image_url =
    
    review.save
    
    redirect_to "/home/page_board_review?num=#{review.id}"
  end
  
  def page_board_review_delete
    board_review_delete = Review.find(params[:post_id])
    if board_review_delete.review_passwd == params[:checksudapw_view]
        board_review_delete.delete
        
        redirect_to "/home/page_board_review"
        
      else
        flash[:notice] = '비밀번호가 틀렸습니다.'
        redirect_to "/home/page_board_review_detail/#{board_review_delete.id}"
    end
    rescue ActiveRecord::RecordNotFound
  # redirect_to "/home/page_board_review"
    
  end
  
  def page_board_review_update
    @board_review_update = Review.find(params[:post_id])
    
    websites_filter = Product.pluck(:product_website).uniq
    
    if params[:term]
      @websites = websites_filter.grep(/#{params[:term]}/)
    else
      @websites = websites_filter
    end
    
    
    if @board_review_update.review_passwd == params[:checkreviewpw_view]
        
      respond_to do |format|  
        format.html # index.html.erb  
      # Here is where you can specify how to handle the request for "/people.json"
        format.json { render :json => @websites.to_json }
      end  
        
        
      else
        flash[:notice] = '비밀번호가 틀렸습니다.'
        redirect_to "/home/page_board_review_detail/#{@board_review_update.id}"
    end
    
  end
  
  def page_board_review_update_save
    board_review_update = Review.find(params[:post_id])
    
    board_review_update.review_title = params[:review_title_view]
    if params[:review_writer_view].present?
      board_review_update.review_writer = params[:review_writer_view]
    else
      board_review_update.review_writer = "롱메"
    end
    board_review_update.review_content = params[:review_content_view]
    board_review_update.review_passwd = params[:review_passwd_view]
    board_review_update.review_website = params[:review_website_view]
    board_review_update.review_prod_name = params[:review_prod_name_view]
    # review.review_image_url =
    
    board_review_update.save
    redirect_to "/home/page_board_review_detail/#{params[:post_id]}"
    
  end
  
#####################댓글 달기#####################################  
  def page_board_review_reply_save
    reviewreply = Reviewreply.new
    reviewreply.reviewreplyname = params[:reply_writer_name]
    reviewreply.reviewreplycontent = params[:reply_content]
    reviewreply.review_id = params[:id_of_post]
    reviewreply.save
    
    render :nothing => true
  end
    
  


##########################################################################################
##########################################################################################
##########################################################################################
  

end
