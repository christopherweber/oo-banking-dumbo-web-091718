# require 'pry'

class Transfer

  attr_reader :sender, :status, :amount
  attr_accessor :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    end
  end

  # describe '#execute_transaction' do
  #   it "can execute a successful transaction between two accounts" do
  #     transfer.execute_transaction
  #     expect(amanda.balance).to eq(950)
  #     expect(avi.balance).to eq(1050)
  #     expect(transfer.status).to eq("complete")
  #   end
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
      if @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      end

  end

end
