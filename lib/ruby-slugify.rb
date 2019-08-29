#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/language-support"
require 'stringex/unidecoder'

class RubySlugify
    
    @inputString = nil
    @language = nil
    @maxLength = nil
    @toLower = nil
    @customMap = nil
    @slugString = nil

    def initialize(inputString, language = "en", customMap = nil,  maxLength = 30, toLower = true)
        # Initialise all the instance variables
        @inputString = inputString
        @maxLength = maxLength
        @toLower = toLower
        @customMap = customMap

        # If the language is not supported use default as english
        if $referenceTable.key?(language)
            @language = language
        else
            @language = "en"
        end
    end

    def createSlug()
        # Strip leading and trailing spaces
        @slugString = @inputString.strip()

        # If custom mapping is given, first substitute these key, value pairs
        unless @customMap.nil?
            substituteChars(customMap)
        end

        # Substitute all the common characters present in the default map
        substituteChars($defaultMap)
        
        # Substitute all the  characters present in the given language
        substituteChars($referenceTable[@language])
        
        # Process all non ASCII characters and convert them to nearest ASCII
        @slugString = Stringex::Unidecoder.decode(@slugString)

        # If required in lowercase, convert it. Always coverts to lowercase unless specified otherwise
        unless @toLower == false
            @slugString = @slugString.downcase
        end
        
        # Any character other than a-z A-Z 0-9 _ and - will be replaced with -
        @slugString = @slugString.gsub(/[^a-zA-Z0-9\-\_]/, '-')
        
        # Replace multiple '-'s with a single '-' and multiple '_'s with a single '_'
        @slugString = @slugString.gsub(/-+/, '-')
        @slugString = @slugString.gsub(/_+/, '_')

        # Remove any leading and trailing '-'s and '_'s
        @slugString = @slugString.delete_prefix('-')
        @slugString = @slugString.delete_prefix('_')
        @slugString = @slugString.delete_suffix('-')
        @slugString = @slugString.delete_suffix('_')
        
        # If the size of slug string is greater than the maxLength, trim it
        if @slugString.length > @maxLength
            @slugString = trimString(@slugString, @maxLength)
        end
    end

    def substituteChars(mapping)
        len = @slugString.length - 1
        for i in 0..len
            if mapping.key?(@slugString[i])
                @slugString[i] = mapping[@slugString[i]]
            end
        end
    end

    # def trimString(longString, length)

    # end
end