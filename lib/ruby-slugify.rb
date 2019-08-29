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

    # Initializes the object with all necessary instance variables
    # Parameters : 
    #   1. inputString - The string to be slugified
    #   2. language - If any language translations are required. Available options : ["en", "es", "de", "nl", "gr", "el", "ell", "po", "fi"]. Default is 'en' or english
    #   3, customMap - If any custom mappings are required i.e custom substituions for words in the slugString
    #   4. maxLength - Limits the size of the slugified string. Default is 100 characters
    #   5. toLower - Whether the slugified string needs to be lower cased. Default is true, i.e it is lower cased. 
    def initialize(inputString, language = "en", customMap = nil,  maxLength = 100, toLower = true)
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

    # Creates the slugified string from the given input string
    # Returns : slugified string
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
        
        @slugString
    end

    # Substitutes the characters in slugString with their mapped values 
    # Parameters :
    #   1. mapping - The hashmap that contains the one to one mapping of characters to be replaced
    def substituteChars(mapping)
        len = @slugString.length - 1
        for i in 0..len
            if mapping.key?(@slugString[i])
                @slugString[i] = mapping[@slugString[i]]
            end
        end
    end

    # Truncates a string if it is longer than a given length
    # Parameters :
    #   1. longString - the string that is to be truncated
    #   2. mlen - maximum length of the string
    # Returns :
    #   1. Truncated string
    def trimString(longString, mlen)

        # Split at '-' to obtain all the words in the slug
        splitString = longString.split('-')

        # If the first word is longer than maxLength, return the slice as the trimmed string
        if splitString[0].length > mlen
            return splitString[0][0..mlen-1]
        end
        
        # Ensure the truncated version is below maxLength but has whole words in the slug
        trimmedString = ''
        for string in splitString
            if string.length + trimmedString.length + 1 <= mlen 
                trimmedString = trimmedString + '-' + string
            else
                break
            end
        end

        # Remove leading '-' due to concatenation
        trimmedString = trimmedString.delete_prefix('-')
        return trimmedString
    end
end