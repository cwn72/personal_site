require 'rails_helper'

RSpec.describe Project, :type => :model do

  before(:each) do
    @project = Project.new(name: 'A project', link: 'a link')
  end

  it 'should be valid' do
    expect(@project.valid?).to be true
  end

  it 'should have a name' do
    @project.name = ''
    expect(@project.valid?).to be false
  end

  it 'should have a link' do
    @project.link = ''
    expect(@project.valid?).to be false
  end

end
