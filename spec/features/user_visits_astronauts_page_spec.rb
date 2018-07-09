require 'rails_helper'

describe 'user visits /astronauts page' do
  before do
    @astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @astronaut_2 = Astronaut.create(name: 'Jim Lovell', age: 39, job: 'something')

    @mission_1 = @astronaut_1.space_missions.create(title: "Apollo 14", trip_length: 100)
    @mission_2 = @astronaut_1.space_missions.create(title: "Capollo 7", trip_length: 100)
    @mission_3 = @astronaut_1.space_missions.create(title: "Bapollo 5", trip_length: 100)
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

  it 'shows a list of space missions for each astronaut in alphabetical order' do
    visit '/astronauts'

    expect(page).to have_content("Space Missions:\n#{@mission_1.title}\n#{@mission_2.title}\n#{@mission_3.title}")
  end

  it 'shows the total time in space for each astronaut' do
    visit '/astronauts'

    expected = @mission_1.trip_length + @mission_2.trip_length + @mission_3.trip_length

    expect(page).to have_content("Total time in space: #{expected} hours")
  end

end
