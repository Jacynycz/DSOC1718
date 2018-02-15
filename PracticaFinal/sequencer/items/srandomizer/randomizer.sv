class randomizer #(int T = 20);
 
    rand byte unsigned temp[];
 
    constraint str_len { 
    temp.size() == this.T; 
    } // Length of the string
 
    constraint temp_str_ascii { 
	    foreach(temp[i]) temp[i] inside {
	    	[32:41],[44:44],[46:90],[97:122]
	    }; 
    } 
    
    function string get_str();
        string str;
        foreach(temp[i])  
            str = {str, string'(temp[i])};
        return str;
    endfunction
endclass