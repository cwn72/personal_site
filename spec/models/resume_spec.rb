require 'rails_helper'

RSpec.describe Resume, :type => :model do

  before(:each) do
    @resume = Resume.new(name: 'John Doe', email: 'john@example.com', phone: '999-9999-9999', site: 'example.com')
  end

  it 'should be valid' do
    expect(@resume.valid?).to be true
  end

  it 'should have a name' do
    @resume.name = ''
    expect(@resume.valid?).to be false
  end

  it 'should have an email' do
    @resume.email = ''
    expect(@resume.valid?).to be false
  end

  it 'should have a phone number' do
    @resume.phone = ''
    expect(@resume.valid?).to be false
  end

  it 'should have a site' do
    @resume.site = ''
    expect(@resume.valid?).to be false
  end

  it 'email should be no longer than 255 characters' do
    @resume.email = 'a' * 256
    expect(@resume.valid?).to be false
  end

  it 'email should have a valid format' do
    @resume.email = 'john@example'
    expect(@resume.valid?).to be false
    @resume.email = 'john.com'
    expect(@resume.valid?).to be false
    @resume.email = '@example.com'
    expect(@resume.valid?).to be false
    @resume.email = 'john@example..com'
    expect(@resume.valid?).to be false
    @resume.email = 'john'
    expect(@resume.valid?).to be false
  end

  it 'phone should contain only valid characters' do
    @resume.phone = 'abc'
    expect(@resume.valid?).to be false
    @resume.phone = '951/123/4567'
    expect(@resume.valid?).to be false
  end

end
