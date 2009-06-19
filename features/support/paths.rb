module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the homepage/
			root_path
    #  '/'

    #when /página inicial/
    #  root_path

    #when /página de novo usuário/
    #  new_user_path

    #when /página de nova sessão/
    #  new_session_path

    when /autenticação de usuário/
      new_session_path

    when /sair do sistema/
      '/logout'

    when /cadastro de pedido/
      new_pedido_path

    when /listagem de pedidos/
      pedidos_path

    when /cadastro de item/
      '/item_pedidos/new/10'

    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)

