### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ aea03904-e49a-41bc-bb51-9af1f45603bc
using Unitful: m, inch, NoUnits

# ╔═╡ 7f2ee8f6-9843-11ef-32d5-199fd063e40c
md"""
This is a response to the [post](https://www.reddit.com/r/VITURE/comments/1ge00tx/not_seeing_the_advertised_135_3m_or_46_fov/) on [r/VITURE](https://www.reddit.com/r/VITURE/)
"""

# ╔═╡ b9f05d10-b9e2-4193-b758-58213e79c9e7
diag = 135inch

# ╔═╡ 48b2f30a-15fa-46ae-bab5-f4942d9a44cb
distance = 3m

# ╔═╡ ac520986-3f4a-441b-8bc9-6ac3f2c5054b
md"""
The aspect ratio of the virtual TV screen is 16:9. Our next step is to find the width of the screen given the aspect ratio and the diagonal.
"""

# ╔═╡ f3c4bd8a-ee5a-4105-a84f-d8ebcf0dc098
r = sqrt(16^2 + 9^2) / 16

# ╔═╡ 7641652e-fa5c-4847-a318-72ed1292ce5c
width = diag / r

# ╔═╡ 40636a75-df43-48e3-81ce-9db1938af51d
md"""
Now we have all we need to calculate the FOV. In radians
"""

# ╔═╡ e7b8767f-d759-4cbb-a12d-49cb2fea0a2a
fov = 2 * acot(2distance / width)

# ╔═╡ 73b7c464-c454-4d67-b841-e0047429013e
md"""
In degrees it gives us
"""

# ╔═╡ 0d8f9016-711f-48db-8005-3bc424ee3cd0
fovd = rad2deg(fov)

# ╔═╡ 186a161a-b4c2-48fb-bc6f-e50791531c25
target_fovd = 46

# ╔═╡ 23cba9cd-ff0d-4420-95ea-01e43bf1a528
md"""
In this notebook I'll try to veify Viture's claims regarding the FOV of their Pro XR glasses. According to Viture the FOV of $(target_fovd)° matches that of a 35" TV as seen from the distance of 3m. So let's go on and define some variables.
"""

# ╔═╡ e8fa53bc-d183-446f-bd03-75da6e280f5e
md"""
So a 135" TV viewed from 3m corresponds to $(round(fovd))° and the Viture's claim is $(round(fovd - target_fovd))° off.
"""

# ╔═╡ 5c33e8fc-86dd-4cf9-8ed7-6754877fbf96
md"""
Let's find at what distance a 135" TV corresponds to the $(target_fovd)° FOV.
"""

# ╔═╡ 61837820-181f-42b7-b992-5f5d9aeae35b
md"""
In radians
"""

# ╔═╡ affc2c13-d7cc-46f1-bf2c-df20f3ade060
target_fov = deg2rad(target_fovd / 2)

# ╔═╡ 7c94e5f9-842c-42eb-86e8-ca52ac17195b
md"""
Now, using basic trigonometry, the target distance is
"""

# ╔═╡ 29d02a50-1891-41de-a531-f3a010c6be8e
target_distance = width / (2 * tan(target_fov))  |> m

# ╔═╡ e2f98ccb-907c-45c5-b50f-0e503b04bb19
md"""
So, in order for a 135" TV to correspond to the $(target_fovd)° FOV, the viewer must be $(round(m, target_distance, digits=1)) away form the srceen.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[compat]
Unitful = "~1.21.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.1"
manifest_format = "2.0"
project_hash = "b2ca6fc0e82e143bd129203c23f3ad1d89afc9ed"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Unitful]]
deps = ["Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "d95fe458f26209c66a187b1114df96fd70839efd"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.21.0"

    [deps.Unitful.extensions]
    ConstructionBaseUnitfulExt = "ConstructionBase"
    InverseFunctionsUnitfulExt = "InverseFunctions"

    [deps.Unitful.weakdeps]
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"
"""

# ╔═╡ Cell order:
# ╟─7f2ee8f6-9843-11ef-32d5-199fd063e40c
# ╠═aea03904-e49a-41bc-bb51-9af1f45603bc
# ╟─23cba9cd-ff0d-4420-95ea-01e43bf1a528
# ╠═b9f05d10-b9e2-4193-b758-58213e79c9e7
# ╠═48b2f30a-15fa-46ae-bab5-f4942d9a44cb
# ╟─ac520986-3f4a-441b-8bc9-6ac3f2c5054b
# ╠═f3c4bd8a-ee5a-4105-a84f-d8ebcf0dc098
# ╠═7641652e-fa5c-4847-a318-72ed1292ce5c
# ╟─40636a75-df43-48e3-81ce-9db1938af51d
# ╠═e7b8767f-d759-4cbb-a12d-49cb2fea0a2a
# ╟─73b7c464-c454-4d67-b841-e0047429013e
# ╠═0d8f9016-711f-48db-8005-3bc424ee3cd0
# ╟─e8fa53bc-d183-446f-bd03-75da6e280f5e
# ╟─5c33e8fc-86dd-4cf9-8ed7-6754877fbf96
# ╠═186a161a-b4c2-48fb-bc6f-e50791531c25
# ╟─61837820-181f-42b7-b992-5f5d9aeae35b
# ╠═affc2c13-d7cc-46f1-bf2c-df20f3ade060
# ╟─7c94e5f9-842c-42eb-86e8-ca52ac17195b
# ╠═29d02a50-1891-41de-a531-f3a010c6be8e
# ╟─e2f98ccb-907c-45c5-b50f-0e503b04bb19
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
