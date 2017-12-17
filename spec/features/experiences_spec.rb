# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Experiences', type: :feature do
  let(:user) { create :user }
  let(:event) { create :event }
  let!(:experience) { create :experience, event: event }

  before do
    create :users_event, user: user, event: event
    log_in_user user
  end

  describe 'index' do
    before { visit event_experiences_path(event) }

    it 'lists experiences related to the event' do
      expect(page).to have_text experience.name
    end

    it 'links to experience edit page' do
      find('tr', text: experience.name).find('.fa-pencil').click
      expect(current_path)
        .to eq "/events/#{event.id}/experiences/#{experience.id}/edit"
    end
  end

  describe 'edit' do
    before { visit edit_event_experience_path(event, experience) }

    it 'displays experience' do
      expect(page).to have_text experience.name
    end
  end
end
