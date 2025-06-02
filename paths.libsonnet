local exec = 'scripts/../script.sh';
local exec1 = '../script.sh';
local exec2 = './script.sh';
local pwd = '/home/user/pwd';

{
  dirname(path):
    if std.length(std.findSubstr('/', path)) == 0
    then ''
    else std.splitLimitR(path, '/', 1)[0],

  resolveParentDirs(path):
    std.join(
      '/',
      std.foldl(
        function(acc, p)
          // remove root anchor if parent goes beyond root
          if p == '..' && acc[0] == '' && std.length(acc) == 2
          then acc[1:std.length(acc) - 1]
          else if p == '..'
          then acc[:std.length(acc) - 1]
          else acc + [p],
        std.split(path, '/'),
        []
      )
    ),

  abspath(path, pwd):
    local normalized =
      if std.startsWith(path, './')
      then path[2:]
      else path;
    local root =
      if std.startsWith(path, '/')
      then path
      else
        if pwd == ''
        then normalized
        else pwd + '/' + normalized;
    self.resolveParentDirs(root),


}
