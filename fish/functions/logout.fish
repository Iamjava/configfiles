function logout --wraps='loginctl terminate-user jan' --description 'alias logout=loginctl terminate-user jan'
  loginctl terminate-user jan $argv; 
end
