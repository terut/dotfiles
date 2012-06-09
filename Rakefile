# codig: utf-8
#
# Explain:
#  tmux for dev. create session and windows of tmux for rails application.
#
# Usage:
#  $ rake tmux[session_name,root_dir] # no space, if you insert space, rake abort!
#  $ rake 'tmux[session_name, root_dir]' # if you insert space, write backquote.
# Example:
#  $ rake tmux[dev,~/Project/rails_sample]
#  $ rake 'tmux[dev, ~/Project/rails_sample]'
#
# Reference:
#  http://d.hatena.ne.jp/snufkon/20110104/1294157241
#  thanks a lot!!

desc 'ready tmux session for dev'
task :tmux, 'session_name', 'root_dir'
task :tmux do |t, args|
  session_name = args.session_name
  root_dir = args.root_dir
  
  windows = ['zsh', 'mysql', 'vim', 'rspec', 'console', 'server', 'git']
  
  sh "tmux new -d -s #{session_name}" unless has_session?(session_name)
  
  cmd = "cd #{root_dir}"
  windows.each_with_index do |w, i| 
    sh "tmux neww -d -k -t #{session_name}:#{i} -n #{w}"
    sh "tmux send -t #{session_name}:#{i} '#{cmd}' C-m" if i > 1
  end

  sh "tmux a -t #{session_name}"
end

def has_session?(name)
  sh "tmux has-session -t #{name}" do |ok, res|
    return ok
  end
end
