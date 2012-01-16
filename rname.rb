#!ruby

dir = "/Users/leeheng/Dropbox/Configuration/vim scheme/"  
  
files = Dir.entries(dir)  
  
files.each do |f|  
    next if f == "." or f == ".."  
    oldFile = dir + f 
    newF = f.gsub(/\.txt/, '')
    newFile = dir + newF  
    File.rename(oldFile, newFile)  
end  
