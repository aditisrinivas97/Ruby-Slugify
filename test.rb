#!/usr/bin/env ruby

require_relative "./lib/ruby-slugify"
require "test/unit"

# newObj = RubySlugify.new("-------______私はガラスを食べら  れますBBBB------", "de")
# newObj.createSlug()

newObj = RubySlugify.new("影師")
newObj.createSlug()

newObj = RubySlugify.new("Diese & Dass", "de")
newObj.createSlug()

newObj = RubySlugify.new("This & that")
newObj.createSlug()

