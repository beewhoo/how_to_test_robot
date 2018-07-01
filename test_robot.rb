require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = 'honda'

    # arrange
    actual_value = robot.station
    expected_value = 1
    # act

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = 'walle'

    # act
    actual_value = robot.station
    expected_value = 2

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    robot = Robot.new
    robot.needs_repairs = true

    # act
    actual_value = robot.station
    expected_value = 3

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
      robot = Robot.new
      robot.needs_repairs = false
    # act
      actual_value = robot.station
      expected_value = 4

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new

    # act
    actual_value = robot.prioritize_tasks
    expected_value = -1

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new
    robot.todos = [1,2,3,7,5,6,4]

    # act
    expected_value = robot.prioritize_tasks
    actual_value = 7

    # assert
    assert_equal(expected_value , actual_value)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new
    robot.day_off = 'Monday'
    # act
    expected_value = false
    actual_value = robot.workday?('Monday')

    assert_equal(expected_value, actual_value)
    # assert
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new
    robot.day_off = 'Saturday'

    # act
    expected_value = true
    actual_value = robot.workday?('Monday')

    # assert
    assert_equal(expected_value , actual_value)
  end

end
