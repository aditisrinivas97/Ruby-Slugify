#!/usr/bin/env ruby

require_relative "./lib/ruby-slugify"
require "test/unit"

newObj = RubySlugify.new("-------______私はガラスを食べら  れます------")
slug = newObj.createSlug()
puts slug 

newObj = RubySlugify.new("影師")
slug = newObj.createSlug()
puts slug

newObj = RubySlugify.new("Diese & Dass", "de")
slug = newObj.createSlug()
puts slug

newObj = RubySlugify.new("This & that", "en", nil, maxLength = 13)
slug = newObj.createSlug()
puts slug

