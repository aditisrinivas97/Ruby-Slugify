#!/usr/bin/env ruby

require_relative "../lib/ruby-slugify.rb"
require "test/unit"

class TestRubySlugify < Test::Unit::TestCase
    def test_createSlugNonASCII()
        newObj = RubySlugify.new("私はガラスを食べられます")
        slug = newObj.createSlug()
        assert_equal("si-hagarasuwoshi-beraremasu", slug)
    end
    
    def test_createSlugLeadingTrailingDashes()
        newObj = RubySlugify.new("---Hello-World!---")
        slug = newObj.createSlug()
        assert_equal("hello-world", slug)
    end

    def test_createSlugLanguage()
        newObj = RubySlugify.new("Diese & Dass", "de")
        slug = newObj.createSlug()
        assert_equal("diese-und-dass", slug)
        newObj = RubySlugify.new("Hello & World", "en")
        slug = newObj.createSlug()
        assert_equal("hello-and-world", slug)
    end

    def test_customMapping()
        customMap = {
            "ball" => "bat",
            "ike" => "hello"
        }
        newObj = RubySlugify.new("I like my ball", "en", customMap)
        slug = newObj.createSlug()
        assert_equal("i-lhello-my-bat", slug)
    end

    def test_isSlug()
        check = RubySlugify.isSlug("sjjdj##d")
        assert_equal(false, check)
        check = RubySlugify.isSlug("this-and-that")
        assert_equal(true, check)
    end
end