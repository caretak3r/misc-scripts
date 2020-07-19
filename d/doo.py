s='.,?*&$@!%.  ##'
for i in input().split('\n'):print(i,'  ',''.join(s[s.find(y)+1]for y in i))
