require 'bundler'
Bundler.require
require "nokogiri"
require "open-uri"
require "cgi"
require "./lib/uri_builder"

class GoogleSearchResult
  def initialize(domain)
    @uri_builder = UriBuilder.new(domain)
  end

  def count(path="")
    doc    = get_html_document(path)
    _count = doc.css("#resultStats").first.text.scan(/\d/)
    return _count.size == 0 ? 0 : _count.reject{|i|i==""}.join.to_i
  end

  private
  def get_html_document(path)
    Nokogiri.HTML(open(@uri_builder.create_uri(path)))
  end
end
