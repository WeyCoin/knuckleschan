# view macro lets you specify the view to be displayed
#   view("site/index") #=> renders src/views/site/index.ecr with the src/views/layouts/layout.ecr
#   view("site/_form") => renders src/views/site/_form.ecr with no layout
# This can be used in a view, or in a route block
macro view(path, layout="layout")
  # if path.split("/").last.starts_with?('_')
    # render "src/views/#{{{path}}}.ecr"
  # else
    render "src/views/#{{{path}}}.ecr", "src/views/layouts/#{{{layout}}}.ecr"
  # end
end