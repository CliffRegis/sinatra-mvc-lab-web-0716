class PigLatinizer 

	def piglatinize(str)
    
    
    vowels = ['a', 'e', 'i', 'o', 'u', 'A','E','I','O','U']
    words = str.split(' ')
    result = []
 
words.each_with_index do |word, i|
	if word == "I"
		return "Iway"
	end
    translation = ''
    qu = false
    if vowels.include? word[0]
    translation = word + 'way'
        result.push(translation)
    else
        word = word.split('')
        count = 0
        word.each_with_index do |char, index|
            if vowels.include? char
                # handle words that start with 'qu'
                if char == 'u' and translation[-1] == 'q'
                    qu = true
                    translation = words[i][count + 1..words[i].length] + translation + 'uay'
                    result.push(translation)
                    next
                end
                break
            else
                # handle words with 'qu' in middle
                if char == 'q' and word[i+1] == 'u'
                    qu = true
                    translation = words[i][count + 2..words[i].length] + 'quay'
                    result.push(translation)
                    next
                else
                    translation += char
                end
                count += 1
            end
        end
        # translation of consonant words without qu
        if not qu
            translation = words[i][count..words[i].length] + translation + 'ay'
            result.push(translation)
        end
    end

end
result.join(' ')
end
		def to_pig_latin(str)
          box =[]
	     letters = ('a'..'z').to_a
	     vowels = %w[a e i o u A E I O U]
	     consonants = letters - vowels
	    
	     str2 = str.gsub(/\w+/) do|word|
	        if vowels.include?(word[0])
	            word + "way"
	        else
	            idx = word.index(/[aeiou]/)
	            word[idx, word.length-idx] + word[0,idx] + "ay"
	        end
         end
         box << str2
         box.join
       end
 

end
