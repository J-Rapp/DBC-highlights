class Person
  attr_reader :first_name, :email, :phone, :created_at
  attr_accessor :last_name

  def initialize(args)
    @first_name = args.fetch(:first_name)
    @last_name = args.fetch(:last_name)
    @email = args.fetch(:email)
    @phone = args.fetch(:phone)
    @created_at = DateTime.parse(args.fetch(:created_at))
  end
end
