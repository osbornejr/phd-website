@def title = "Menu1"
@def tags = ["syntax", "code"]

# {{menu1_desc}} ({{menu1_name}})
\tableofcontents <!-- you can use \toc as well -->

## Run parameters
\tableinput{}{./tableinput/run_parameters.csv}

## Data preprocessing
### Data cleaning

Before cut:
![image](/assets/menu1/raw_data_histogram.svg)

After cut:
![image](/assets/menu1/clean_data_cut_histogram.svg)

## Network construction

\begin{showhtml}{}
```julia
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

```
\end{showhtml}


## Network analysis

### Network statistics
\tableinput{}{./tableinput/network_stats.csv}

### Type breakdown

\tableinput{}{./tableinput/type_representation.csv}

### Degree distribution

* __All nodes:__
![image](/assets/menu1/degree_distribution.svg)

* __Coding transcripts:__
![image](/assets/menu1/coding_degree_distribution.svg)

* __Non-coding transcripts:__
![image](/assets/menu1/noncoding_degree_distribution.svg)


### Hubs

__Nodes with degree $k>\bar{k}+2\sigma_{k}$:__
~~~
<details>
<summary> </summary>

<br>
<img src="/assets/menu1/two_std_hub_network.svg" alt="hubs"> 
</details>
~~~
__Nodes with degree $k>70$:__
~~~
<details>
<summary> </summary>

<br>
<img src="/assets/menu1/alt_hub_network.svg" alt="hubs"> 
</details>
~~~

### Community detection
Community 1:
Go annotation terms:

\tableinput{}{./tableinput/community_1_annotations.csv}

Community 2:
Go annotation terms:

\tableinput{}{./tableinput/community_2_annotations.csv}

Community 3:
Go annotation terms:

\tableinput{}{./tableinput/community_3_annotations.csv}

Community 4:
Go annotation terms:

\tableinput{}{./tableinput/community_4_annotations.csv}

Community 5:
Go annotation terms:

\tableinput{}{./tableinput/community_5_annotations.csv}

Community 6:
Go annotation terms:

\tableinput{}{./tableinput/community_6_annotations.csv}

Community 7:
Go annotation terms:

\tableinput{}{./tableinput/community_7_annotations.csv}

Community 8:
Go annotation terms:

\tableinput{}{./tableinput/community_8_annotations.csv}

Community 9:
Go annotation terms:

\tableinput{}{./tableinput/community_9_annotations.csv}

Community 10:
Go annotation terms:

\tableinput{}{./tableinput/community_10_annotations.csv}

Community 11:
Go annotation terms:

\tableinput{}{./tableinput/community_11_annotations.csv}

Community 12:
Go annotation terms:

\tableinput{}{./tableinput/community_12_annotations.csv}

Community 13:
Go annotation terms:

\tableinput{}{./tableinput/community_13_annotations.csv}

Community 14:
Go annotation terms:

\tableinput{}{./tableinput/community_14_annotations.csv}

Community 15:
Go annotation terms:

\tableinput{}{./tableinput/community_15_annotations.csv}

Community 16:
Go annotation terms:

\tableinput{}{./tableinput/community_16_annotations.csv}

Community 17:
Go annotation terms:

\tableinput{}{./tableinput/community_17_annotations.csv}

Community 18:
Go annotation terms:

\tableinput{}{./tableinput/community_18_annotations.csv}

 
[3D visualisation](/menu1_communities/)



### Graphlet counting
Comparing the typed representations of different graphlets in the real network to a set of networks with the same structure, but randomised node types.

* Tables
~~~
<div class="flex-container">


<div class="graphlet" >
<img src="/assets/graphlet-images/2-path.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</th>
    <th style = "text-align: right;">Observed</th>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_edge</td>
    <td style = "text-align: right;">1664.31</td>
    <td style = "text-align: right;">1690</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_edge</td>
    <td style = "text-align: right;">18184.0</td>
    <td style = "text-align: right;">18149</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_edge</td>
    <td style = "text-align: right;">36.72</td>
    <td style = "text-align: right;">46</td>
  </tr>
</table>
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/3-path.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</th>
    <th style = "text-align: right;">Observed</th>
  </tr>
 
 <tr>
    <td style = "text-align: right;">coding_coding_noncoding_3-path</td>
    <td style = "text-align: right;">21473.3</td>
    <td style = "text-align: right;">18915</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_3-path</td>
    <td style = "text-align: right;">997.68</td>
    <td style = "text-align: right;">547</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_coding_noncoding_3-path</td>
    <td style = "text-align: right;">480.34</td>
    <td style = "text-align: right;">356</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_coding_3-path</td>
    <td style = "text-align: right;">11246.4</td>
    <td style = "text-align: right;">7095</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_3-path</td>
    <td style = "text-align: right;">2.37068e5</td>
    <td style = "text-align: right;">244366</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_3-path</td>
    <td style ="text-align: right;">21.38</td>
    <td style = "text-align: right;">8</td>
  </tr>
</table>
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/3-tri.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</th>
    <th style = "text-align: right;">Observed</th>
  </tr>
 
 <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_3-tri</td>
    <td style = "text-align: right;">893.66</td>    
    <td style = "text-align: right;">2052</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_3-tri</td>
    <td style = "text-align: right;">19884.7</td>
    <td style = "text-align: right;">25026</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_3-tri</td>
    <td style = "text-align: right;">1.41849e5</td>
    <td style = "text-align: right;">135501</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_3-tri</td>
    <td style = "text-align: right;">13.0</td>
    <td style = "text-align: right;">61</td>
  </tr>
</table>

</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-path.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</th>
    <th style = "text-align: right;">Observed</th>
  </tr>
 
 <tr>
    <td style = "text-align: right;">noncoding_coding_coding_noncoding_4-path</td>
    <td style = "text-align: right;">7078.75</td>
    <td style = "text-align: right;">5911</td>
 </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_coding_4-path</td>
    <td style = "text-align: right;">3.42802e6</td>
    <td style = "text-align: right;">3561835</td>
  </tr>

  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_coding_4-path</td>
    <td style = "text-align: right;">3.21663e5</td>
    <td style = "text-align: right;">219004</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_noncoding_4-path</td>
    <td style = "text-align: right;">3.12688e5</td>
    <td style = "text-align: right;">299825</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_coding_4-path</td>
    <td style = "text-align: right;">7209.26</td>
    <td style = "text-align: right;">3529</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_coding_noncoding_noncoding_4-path</td>
    <td style = "text-align: right;">640.79</td>
    <td style = "text-align: right;">292</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_noncoding_4-path</td>
    <td style = "text-align: right;">14248.7</td>
    <td style = "text-align: right;">9301</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_noncoding_4-path</td>
    <td style = "text-align: right;">632.32</td>
    <td style = "text-align: right;">97</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_coding_noncoding_coding_4-path</td>
    <td style = "text-align: right;">14316.5</td>
    <td style = "text-align: right;">6719</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_noncoding_4-path</td>
    <td style = "text-align: right;">14.33</td>
    <td style = "text-align: right;">0</td>
  </tr>
</table>

</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-star.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</th>
    <th style = "text-align: right;">Observed</th>
  </tr>
 
 <tr>
    <td style = "text-align: right;">coding_coding_coding_noncoding_4-star</td>
    <td style = "text-align: right;">2.43116e5</td>
    <td style = "text-align: right;">206162</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_coding_4-star</td>
    <td style = "text-align: right;">88314.3</td>
    <td style = "text-align: right;">50863</td>
  </tr>

  <tr>
    <td style = "text-align: right;">coding_noncoding_coding_noncoding_4-star</td>
    <td style = "text-align: right;">10829.5</td>
    <td style = "text-align: right;">6930</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_coding_noncoding_4-star</td>
    <td style = "text-align: right;">157.66</td>
    <td style = "text-align: right;">72</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_noncoding_4-star</td>
    <td style = "text-align: right;">6.83</td>
    <td style = "text-align: right;">2</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_coding_4-star</td>
    <td style = "text-align: right;">1.80134e6</td>
    <td style = "text-align: right;">1885477</td>

  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_noncoding_4-star</td>
    <td style = "text-align: right;">511.03</td>
    <td style = "text-align: right;">200</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_noncoding_4-star</td>
    <td style = "text-align: right;">11865.7</td>
    <td style = "text-align: right;">6439</
td>
  </tr>
</table>

</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-tail.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</th>
    <th style = "text-align: right;">Observed</th>
  </tr>
 
 <tr>
    <td style = "text-align: right;">coding_coding_noncoding_coding_4-tail</td>
    <td style = "text-align: right;">1.67961e5</td>
    <td style = "text-align: right;">94217</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_noncoding_4-tail</td>
    <td style = "text-align: right;">7432.14</td>
    <td style = "text-align: right;">3735</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_noncoding_4-tail</td>
    <td style = "text-align: right;">645.87</td>
    <td style = "text-align: right;">230</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_coding_4-tail</td>
    <td style = "text-align: right;">3.54037e6</td>
    <td style = "text-align: right;">3664555</td>
  
</tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_coding_coding_4-tail</td>
    <td style = "text-align: right;">6861.39</td>
    <td style = "text-align: right;">7372</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_noncoding_4-tail</td>
    <td style = "text-align: right;">1.59608e5</td>
    <td style = "text-align: right;">141300</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_coding_noncoding_4-tail</td>
    <td style = "text-align: right;">14438.6</td>
    <td style = "text-align: right;">12601</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_coding_4-tail</td>
    <td style = "text-align: right;">327.28</td>
    <td style = "text-align: right;">220</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_coding_noncoding_4-tail</td>
    <td style = "text-align: right;">307.19</td>
    <td style = "text-align: right;">349</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_noncoding_4-tail</td>
    <td style = "text-align: right;">13.95</td>
    <td style = "text-align: right;">5</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_coding_4-tail</td>
    <td style = "text-align: right;">14946.7</td>
    <td style = "text-align: right;">7308</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_coding_coding_4-tail</td>
    <td style = "text-align: right;">3.21477e5</td>
    <td style = "text-align: right;">302500</td>
  </tr>
</table>

</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-cycle.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</th>
    <th style = "text-align: right;">Observed</th>
  </tr>
 
 <tr>
    <td style = "text-align: right;">coding_coding_coding_noncoding_4-cycle</td>
    <td style = "text-align: right;">2980.68</td>
    <td style = "text-align: right;">1613</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_noncoding_4-cycle</td>
    <td style = "text-align: right;">200.78</td>
    <td style = "text-align: right;">50</td>
  </tr>
 
 <tr>
    <td style = "text-align: right;">coding_coding_coding_coding_4-cycle</td>
    <td style = "text-align: right;">15564.5</td>
    <td style = "text-align: right;">17089</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_noncoding_4-cycle</td>
    <td style = "text-align: right;">5.98</td>
    <td style = "text-align: right;">0</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_noncoding_4-cycle</td>
    <td style = "text-align: right;">0.08</td>
    <td style = "text-align: right;">0</td>
  </tr>
</table>

</div>

<div class="graphlet">
<img src="/assets/graphlet-images/4-chord.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</th>
    <th style = "text-align: right;">Observed</th>
  </tr>
 
 <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_noncoding_4-chord</td>
    <td style = "text-align: right;">
50.53</td>
    <td style = "text-align: right;">24</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_noncoding_4-chord </td>
    <td style = "text-align: right;">24504.8</td>
    <td style = "text-align: right;">14353</td>
  </tr>

  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_coding_4-chord</td>
    <td style = "text-align: right;">24458.5</td>
    <td style = "text-align: right;">25984</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_coding_4-chord</td>
    <td style = "text-align: right;">516.48</td>
    <td style = "text-align: right;">1392</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_coding_noncoding_noncoding_4-chord</td>
    <td style = "text-align: right;">43.11</td>
    <td style = "text-align: right;">1</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_coding_coding_noncoding_4-chord</td>
    <td style = "text-align: right;">536.98</td>
    <td style = "text-align: right;">76</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_coding_4-chord</td>
    <td style = "text-align: right;">256059.0</td>
    <td style = "text-align: right;">265812</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_noncoding_noncoding_4-chord</td>
    <td style = "text-align: right;">2262.62</td>
    <td style = "text-align: right;">791</td>
 
 </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_noncoding_4-chord</td>
    <td style = "text-align: right;">0.96</td>
    <td style = "text-align: right;">0</td>
  </tr>
</table>
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-clique.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<table>
  <tr class = "header">
    <th style = "text-align: right;">Graphlet</th>
    <th style = "text-align: right;">Expected</t
h>
    <th style = "text-align: right;">Observed</th>
  </tr>
 
 <tr>
    <td style = "text-align: right;">coding_coding_noncoding_noncoding_4-clique</td>
    <td style = "text-align: right;">15039.5</td>
    <td style = "text-align: right;">54411</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_coding_4-clique</td>
    <td style = "text-align: right;">1.12363e6</td>
    <td style = "text-align: right;">956621</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_coding_coding_noncoding_4-clique</td>
    <td style = "text-align: right;">2.16407e5</td>
    <td style = "text-align: right;">340872</td>
  </tr>
  <tr>
    <td style = "text-align: right;">noncoding_noncoding_noncoding_noncoding_4-clique</td>
    <td style = "text-align: right;">4.83</td>
    <td style = "text-align: right;">71
</td>
  </tr>
  <tr>
    <td style = "text-align: right;">coding_noncoding_noncoding_noncoding_4-clique</td>
    <td style = "text-align: right;">446.83</td>
    <td style = "text-align: right;">3553</td>
  </tr>
</table>

</div>

</div>
~~~

* Boxplots

~~~
<div class="flex-container">


<div class="graphlet" >
<img src="/assets/graphlet-images/2-path.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/3-path.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<img src="/assets/menu1/plots/3-path_boxplot.svg" height=400 width=200 alt="hubs" class="rotateimg90"> 
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/3-tri.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">

<img src="/assets/menu1/plots/3-tri_boxplot.svg" height=400 width=200 alt="hubs" class="rotateimg90"> 
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-path.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<img src="/assets/menu1/plots/4-path_boxplot.svg" height=400 width=200 alt="hubs" class="rotateimg90"> 
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-star.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">

<img src="/assets/menu1/plots/4-star_boxplot.svg" height=400 width=200 alt="hubs" class="rotateimg90"> 
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-tail.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">

<img src="/assets/menu1/plots/4-tail_boxplot.svg" height=400 width=200 alt="hubs" class="rotateimg90"> 
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-cycle.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">

<img src="/assets/menu1/plots/4-cycle_boxplot.svg" height=400 width=200 alt="hubs" class="rotateimg90"> 
</div>

<div class="graphlet">
<img src="/assets/graphlet-images/4-chord.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">
<img src="/assets/menu1/plots/4-chord_boxplot.svg" height=400 width=200 alt="hubs" class="rotateimg90"> 
</div>

<div class="graphlet" >
<img src="/assets/graphlet-images/4-clique.svg" height=100 width=200 alt="hubs"> 
</div>
<div class="hide">

<img src="/assets/menu1/plots/4-clique_boxplot.svg" height=400 width=200 alt="hubs" class="rotateimg90"> 
</div>

</div>
<div>
</div>
~~~

### Significantly overrepresented type representations

~~~

{{insert "../_assets/menu1/sig_type_representations.html"}}

~~~

~~~
 
&nbsp;
<br>
<br>
<br>
<br>
&nbsp;

~~~

### Significantly underrepresented type representations

~~~

{{insert "../_assets/menu1/insig_type_representations.html"}}

~~~


~~~
 
&nbsp;
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
&nbsp;

~~~
