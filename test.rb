#!/usr/bin/env ruby

require_relative "./lib/ruby-slugify"
require "test/unit"

newObj = RubySlugify.new("-------______私はガラスを食べら  れますBBBB------", "de")
newObj.createSlug()