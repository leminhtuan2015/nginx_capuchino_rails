server '133.242.183.87',
  roles: %w{web app},
  ssh_options: {
    user: 'framgia',
    keys: %w(/home/hnc/.ssh/temona),
    forward_agent: true,
    password: 'Y7nANt/zagUB/7LiqodMmMhhqoXtkx6AWw=='
  }
