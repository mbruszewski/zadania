require 'spec_helper'

describe 'Zad2 page' do
  
  subject { page }

  describe 'testing text similarity' do

    it 'test 1' do
      visit zad2_path
      fill_in 'Text 1', with: 'abc'
      fill_in 'Text 2', with: 'def'
      click_button 'Submit'
      expect(page).to have_content 'Wynik: 3'
    end

    it 'test 2' do
      visit zad2_path
      fill_in 'Text 1', with: 'abc'
      fill_in 'Text 2', with: 'abc'
      click_button 'Submit'
      expect(page).to have_content 'Wynik: 0'
    end

    it 'test 3' do
      visit zad2_path
      fill_in 'Text 1', with: 'abcaaa'
      fill_in 'Text 2', with: 'def'
      click_button 'Submit'
      expect(page).to have_content 'Wynik: 6'
    end

    it 'test 4' do
      visit zad2_path
      fill_in 'Text 1', with: 'abc'
      fill_in 'Text 2', with: 'defddd'
      click_button 'Submit'
      expect(page).to_not have_content 'Wynik: 3'
    end

    it 'test 5' do
      visit zad2_path
      fill_in 'Text 1', with: 'abc'
      fill_in 'Text 2', with: 'defddd'
      click_button 'Submit'
      expect(page).to have_content 'Wynik: 6'
    end

    it 'test 6' do
      visit zad2_path
      fill_in 'Text 1', with: 'ala ma kota'
      fill_in 'Text 2', with: 'kot ma ale'
      click_button 'Submit'
      expect(page).to have_content 'Wynik: 7'
    end

    it 'test 7' do
      visit zad2_path
      fill_in 'Text 1', with: 'ala ma psa'
      fill_in 'Text 2', with: 'pies ma ale'
      click_button 'Submit'
      expect(page).to have_content 'Wynik: 7'
    end

  end
end
