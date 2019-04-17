def admin_add_update_projects(prompt)
  project_list = Project.all
  sel_new_project = -1
  sel_edit_project = -2
  sel_return = -3

  puts "\e[H\e[2J"
  selection = prompt.select("Choose Project to Edit, Add a Project or Return.") do |menu|
    project_list.each do |project|
      menu.choice "ID: #{project.id} Name: #{project.name}", project.id
    end
    menu.choice "Add a New Project", sel_new_project
    menu.choice "Return", sel_return
  end

  case selection
  when sel_return
  when sel_new_project
    admin_new_project(prompt)
  else
    admin_edit_project(prompt, Project.find(selection))
  end

end