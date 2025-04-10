desc "Fill the database tables with some sample data"
task({ sample_data: :environment }) do
  tasks = [
    { content: "Scout for the most dazzling party hats in town", completed: true },
    { content: "Book the unicorn DJ for an epic dance-off", completed: true },
    { content: "Order glitter confetti that doubles as edible sprinkles", completed: false },
    { content: "Plan a surprise karaoke battle with a secret twist", completed: false },
    { content: "Decorate the venue with disco balls and magical streamers", completed: false }
  ]

  tasks.each do |attrs|
    task_record = Task.create!(attrs)
    puts "Created task: '#{task_record.content}' (completed: #{task_record.completed})"
  end
end
