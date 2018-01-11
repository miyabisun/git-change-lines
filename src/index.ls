require! {
  luxon: {DateTime}
  child_process: {exec-sync}
}
global <<< require \prelude-ls

end = DateTime.local!
days = process.argv.2 or 30
name = exec-sync "git config user.name" .to-string!.trim!
opt = suppress-milliseconds: yes

[0 til days]
|> map -> end.minus days: it
|> map (date) ->
  """
  git log --numstat --pretty="%H" --author='#name' --since='#{date.start-of \day .toISO opt}' --until='#{date.end-of \day .toISO opt}' --no-merges
  """
  |> exec-sync
  |> (.to-string!)
  |> split "\n"
  |> map split "\t"
  |> filter (.length > 2)
  |> fold(_, {date, add: 0, remove:0}) ({add, remove}:s, a) ->
    s <<< {add: add + abs(a.0), remove: remove + abs(a.1)}
|> filter -> it.add and it.remove
|> each ({date, add, remove}) ->
  console.log "#{date.to-format "yyyy-LL-dd"}:", "#{add + remove} (+#add -#remove)"
|> fold(_, {add: 0, remove:0}) (s, {add, remove}:a) ->
  s <<< add: s.add + add, remove: s.remove + remove
|> ({date, add, remove}) ->
  console.log "Summary:", "#{add + remove} (+#add -#remove)"

