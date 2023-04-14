# This file was generated, do not modify it. # hide
__result = begin # hide
    using WGLMakie,JSServe,Markdown,Graphs,GraphMakie,NetworkLayout
Page(exportable=true,offline=true)
WGLMakie.activate!()
scatter(1:4,color=1:4)
g = wheel_graph(20)
#vertex_colors = replace(vertexlist,"noncoding"=>:red,"coding"=>:blue);

begin
	set_theme!(backgroundcolor=:grey)
	fig,scene,p = graphplot(g;
		layout=Spring(dim=3,C=1.0),
		#node_color = vertex_colors,
		node_size = 5,
		edge_color = :grey,
		edge_width = 0.1,
		figure = (resolution = (1500, 800),)
	)
	scene.show_axis =false
	fig
end
end # hide
println("~~~") # hide
show(stdout, MIME"text/html"(), __result) # hide
println("~~~") # hide
nothing # hide