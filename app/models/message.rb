class Message < ActiveRecord::Base

  before_save :send_push_notification


  def send_push_notification
    token = Device.first.token

    np = { :alert => self.text, :badge => self.badge }
    np.merge!(:sound => 'test.wav') if self.sound

    n = APNs4r::Notification.create token, { :aps => np }
    APNs4r::Sender.new.push n

  end

end
