class Deactivator

  pattr_initializer :token

	def self.deactivate(token, deactivated_from_list)
    new(token).perform(deactivated_from_list)
  end

  def self.reactivate(token)
    new(token).reactivate
  end

  def perform(deactivated_from_list)
    token.transaction do 
      remove_from_list
      token.save(is_active: false)    
    end
  end

  def reactivate
    token.transaction do
      reactivate_token
      add_back_to_custom_list
      token.save
    end
  end

  private

  def remove_from_list
    token.token_number.update_column(is_active: false)
  end

  def reactivate_token
    token.token_number
    token.is_active = false
  end

  def add_back_to_custom_list
    token.where(token_number: token.token_number).update_column(is_active: false)
  end
end