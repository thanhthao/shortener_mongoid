# -*- coding: utf-8 -*-
require 'spec_helper'

describe Shortener::ShortenerHelper do
  before { @short_url = Shortener::ShortenedUrl.generate("www.doorkeeperhq.com") }

  describe "short_url" do
    it "should shorten the url" do
      helper.short_url("www.doorkeeperhq.com").should == "http://test.host/#{@short_url.unique_key}"
    end
  end

  describe "full_url" do
    it "should return the full URL if the short_url if valid" do
      helper.full_url("http://test.host/#{@short_url.unique_key}").should == @short_url.url
    end

    it "should return nil if short_url is invalid" do
      helper.full_url("http://test.host/blablablabla").should be_nil
      helper.full_url("http://test.host/").should be_nil
    end
  end
end
