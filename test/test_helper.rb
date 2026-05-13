class ActionDispatch::IntegrationTest
  def login_as(user)
    if respond_to? :click_on
      visit login_url
      fill_in :name, with: user.name
      fill_in :password, with: "secret"
      click_on "Login"
      find "h1", text: "Welcome", wait: 5 # add a wait for page switching
    else
      post login_url, params: { name: user.name, password: "secret" }
    end
  end

  def logout
    if respond_to? :click_on
      click_on "Logout"
    else
      post logout_url, params: { _method: "delete" }
    end
  end

  def setup
    login_as users(:one)
  end
end
