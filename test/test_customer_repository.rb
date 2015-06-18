require_relative '../lib/sales_engine'

class TestCustomerRepository < Minitest::Test
  def test_it_finds_customers_by_first_name
    repo = CustomerRepository.new([
      { id: 4, first_name: 'Cecilia' },
      { id: 2, first_name: 'Dmitry' },
      { id: 9, first_name: 'Cecilia' },
    ])

    # the Cecilias have ids of 4 and 9
    customers = repo.find_all_by_first_name('Cecilia')
    assert_equal [4, 9], customers.map { |c| c.id }

    # the Dmitrys have ids of 2
    customers = repo.find_all_by_first_name('Dmitry')
    assert_equal [2], customers.map { |c| c.id }


    # the Roberts don't exist
    customers = repo.find_all_by_first_name('Robert')
    assert_equal [], customers.map { |c| c.id }
  end
end
