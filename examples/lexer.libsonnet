local lexer = import '../lexer.libsonnet';
local file = importstr '../lexer.libsonnet';

lexer.lex(file)
