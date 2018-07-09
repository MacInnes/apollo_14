require 'rails_helper'

describe 'user visits /astronauts page' do
  before do
    @astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @astronaut_2 = Astronaut.create(name: 'Jim Lovell', age: 39, job: 'something')
  end

  it 'sees a list of all astonauts with name, age, and job' do
    visit '/astronauts'

    expect(page).to have_content("Name: #{@astronaut_1.name}")
    expect(page).to have_content("Age: #{@astronaut_1.age}")
    expect(page).to have_content("Job: #{@astronaut_1.job}")
  end

  it 'shows the average age of each astronaut' do
    visit '/astronauts'

    expect(page).to have_content("Average age: 38")
  end

end
