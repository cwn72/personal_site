require 'rails_helper'

RSpec.describe Experience, :type => :model do

  before(:each) do
    @experience = Experience.new(job_title: 'A job', company: 'a company', current: true,
                                 start_date: Date.new(2010,1,1), end_date: Date.new(2011,1,1),
                                 overview: 'I did stuff for a company' )
  end

  it 'should be valid' do
    expect(@experience.valid?).to be true
  end

  it 'should have a job title' do
    @experience.job_title = ''
    expect(@experience.valid?).to be false
  end

  it 'should have a company' do
    @experience.company = ''
    expect(@experience.valid?).to be false
  end

  it 'should have a start date' do
    @experience.start_date = nil
    expect(@experience.valid?).to be false
  end

  it 'does not need to have an end date' do
    @experience.end_date = nil
    expect(@experience.valid?).to be true
  end

  it 'should have an overview' do
    @experience.overview = ''
    expect(@experience.valid?).to be false
  end

  it 'current should be allowed to be false' do
    @experience.end_date = false
    expect(@experience.valid?).to be true
  end

end
