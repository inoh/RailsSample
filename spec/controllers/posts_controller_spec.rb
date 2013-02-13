# -*- coding: utf-8 -*-
require 'spec_helper'

describe PostsController do

  it "PostsControllerを使っていること" do
    controller.should be_an_instance_of(PostsController)
  end

  describe "新規登録" do

    describe "新規画面取得" do

      before do
        get 'new'
      end

      it "リクエストが成功すること" do
        response.should be_success
      end

      it "空のメモが作成されていること" do
        assigns[:post].should be_instance_of(Post)
      end

      it "memos/newを描画すること" do
        response.should render_template("posts/new")
      end

    end

    describe "メモが新規登録できること" do

      before do
        post 'create', {post: {title: "add title"}}
      end

      it "リクエストが成功すること" do
        response.should be_success
      end

    end

  end

end
