function Format(str){
		for (var i = 0; i <= string_length(str); i += 1) {
			var char = string_char_at(str, i);
			try {
				int64(char)
			}
			catch (_exception) {
				if char == string_upper(char) && char != ":"{
					str = string_insert(" ", str, i)
					i++
				}
			}
			
		}
	
	str = string_upper(string_char_at(str, 1)) + string_copy(str, 2, string_length(str) - 1)
	return str
}