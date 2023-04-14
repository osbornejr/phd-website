# This file was generated, do not modify it. # hide
__result = begin # hide
    #manually copied from "/home/osbornejr/app/output/cache/GSE68559/expression_cutoff/20/normalisation/upper_quartile/sampling/0.025/similarity/pidc/sqrt_n/threshold/0.95/threshold_method/empirical_dist_zero"
# and  output/cache/GSE68559/expression_cutoff/20/normalisation/upper_quartile/sampling/0.025/
using WGLMakie,JSServe,Markdown,Graphs,GraphMakie,NetworkLayout,JLD2,DataFrames
Page(exportable=true,offline=true)
WGLMakie.activate!()
sample_file = "_assets/menu1/sample_counts.jld2"
adj_file = "_assets/menu1/adjacency_matrix.jld2"
sample_counts = JLD2.jldopen(sample_file) do file
    file["sample counts"]
    end
pre_adj_matrix = JLD2.jldopen(adj_file) do file
    file["pre-adj_matrix"]
    end
adj_matrix = JLD2.jldopen(adj_file) do file
    file["adjacency_matrix"]
    end
components = JLD2.jldopen(adj_file) do file
    file["components"]
    end
#Trim nodes with degree zero
    network_counts = sample_counts[components[1],:][vec(sum(pre_adj_matrix,dims=2).!=0),:]
#maintain list of vertices in graph
    vertexlist = copy(network_counts[!,:transcript_type])     
g = Graph(adj_matrix)
vertex_colors = replace(vertexlist,"noncoding"=>:red,"coding"=>:blue);

begin
	set_theme!(backgroundcolor=:white)
	fig,scene,p = graphplot(g;
		layout=Spring(dim=3,C=1.0),
		node_color = vertex_colors,
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