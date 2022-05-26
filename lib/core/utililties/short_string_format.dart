String customShortStringFormat(String string, {int maxCharacters = 24, replacement = '...'}){
  /// This function is used to format a string add add '...' to it if it is too long
  return (string.length>maxCharacters)?'${string.substring(0,maxCharacters)}$replacement':string; 
}