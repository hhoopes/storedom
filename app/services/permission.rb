class Permission
  extend Forwardable

  def_delegators :user,
                 :platform_admin?,
                 :store_admin?,
                 :registered_user?

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when platform_admin?
      platform_admin_permissions
    when store_admin?
      store_admin_permissions
    when registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

private
  def user
    @user
  end

  def platform_admin_permissions
    return true if @controller == "users" && @action.in?(%w(show edit update))
    return true if @controller == "platform_admin/stores" && @action.in?(%w(index edit update))
    return true if @controller == "platform_admin/users" && @action.in?(%w(show))
    store_admin_permissions

  end

  def store_admin_permissions
    return true if @controller == "store_admin/users" && @action.in?(%w(show index update))
    return true if @controller == "store_admin/orders" && @action.in?(%w(show index update))
    return true if @controller == "stores/items" && @action.in?(%w(create new edit update destroy))
    return true if @controller == "manage_admins" && @action.in?(%w(update destroy))
    return true if @controller == "users" && @action.in?(%w(show edit update))

    registered_user_permissions
  end

  def registered_user_permissions
    return true if @controller == "sessions" && @action.in?(%w(destroy))
    return true if @controller == "users" && @action.in?(%w(show edit update))
    return true if @controller == "stores" && @action.in?(%w(create index edit update))
    return true if @controller == "stores" && @action.in?(%w(index))

    guest_user_permissions
  end

  def guest_user_permissions
    return true if @controller == "sessions" && @action.in?(%w(new create))
    return true if @controller == "users" && @action.in?(%w(new create))
    return true if @controller == "items" && @action.in?(%w(index))
    return true if @controller == "stores" && @action.in?(%w(index show new))
    return true if @controller == "stores/items" && @action.in?(%w(index show))
  end
end
