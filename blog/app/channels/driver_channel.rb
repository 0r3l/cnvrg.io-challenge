class DriverChannel < ApplicationCable::Channel
  def subscribed
    stream_from "drivers"
  end
end
