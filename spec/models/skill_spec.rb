require 'rails_helper'

RSpec.describe Skill, :type => :model do

  before(:each) do
    @skill = Skill.new(name: 'RoR', experience: 4, years: 4)
  end

  it 'should be valid' do
    expect(@skill.valid?).to be true
  end

  it 'should have a name' do
    @skill.name = ''
    expect(@skill.valid?).to be false
  end

  it 'should have an experience' do
    @skill.experience = nil
    expect(@skill.valid?).to be false
  end

  it 'years should be allowed to be nil' do
    @skill.years = nil
    expect(@skill.valid?).to be true
  end

  it 'experience should be no lower than zero, and no greater than 5' do
    @skill.experience = -1
    expect(@skill.valid?).to be false

    @skill.experience = 0
    expect(@skill.valid?).to be true

    @skill.experience = 5
    expect(@skill.valid?).to be true

    @skill.experience = 6
    expect(@skill.valid?).to be false
  end

  it 'years should be greater than zero, and no greater than 100' do
    @skill.years = 0
    expect(@skill.valid?).to be false

    @skill.years = 10
    expect(@skill.valid?).to be true

    @skill.years = 101
    expect(@skill.valid?).to be false
  end

  it 'experience should only be an integer' do
    @skill.experience = 1.1
    expect(@skill.valid?).to be false
  end

  it 'years should only be an integer' do
    @skill.years = 1.1
    expect(@skill.valid?).to be false
  end

end
