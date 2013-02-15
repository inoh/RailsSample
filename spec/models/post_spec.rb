# -*- coding: utf-8 -*-
require 'spec_helper'

describe Post do
  fixtures :posts, :authors, :comments

  describe "fixturesのロード確認" do
    before do
      @post = posts(:posts_01)
    end

    it "id" do
      @post.id.should == 1
    end

    it "title" do
      @post.title.should == "post title"
    end

    it "author.name" do
      @post.author.name.should == "author name"
    end

    it "comments count" do
      @post.comments.count.should == 1
    end

    it "comment.body" do
      @post.comments.first.body.should == "comment body"
    end
  end

  describe "has_oneのautosave確認" do
    before do
      @post = posts(:posts_01)
      @post.title = "update title"
      @post.author.name = "update name"
      @post.save
      @post = Post.find(@post.id)
    end

    it "title" do
      @post.title.should == "update title"
    end

    it "author name" do
      @post.author.name.should == "update name"
    end
  end

  describe "has_manyのautosave確認" do
    before do
      @post = posts(:posts_01)
      @post.title = "update title"
      @post.comments.first.body = "update body"
      @post.comments.create(:body => 'add comment')
      @post.save
      @post = Post.find(@post.id)
    end

    it "title" do
      @post.title.should == "update title"
    end

    it "comment body" do
      pending "commentsが更新されない" do
        @post.comments.first.body.should == "update body"
      end
    end

    it "post count" do
      @post.comments.count.should == 2
    end
  end

end
