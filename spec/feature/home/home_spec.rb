require 'rails_helper'

RSpec.describe 'Home', type: :feature do

  context 'cuando abrimos nuesta home view' do
    it 'encontramos el formulario creacion de usuario' do
      visit root_path
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Hola mundo')
    end
  end
end
