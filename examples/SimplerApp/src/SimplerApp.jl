module SimplerApp

using CImGui

include("Renderer.jl")
using .Renderer

Base.@ccallable function julia_main()::Cint
    try
        real_main()
    catch
        Base.invokelatest(Base.display_error, Base.catch_stack())
        return 1
    end
    return 0
end

function real_main()
    Renderer.render(width=600, height=300, title="Simple Window")
    return nothing
end

if abspath(PROGRAM_FILE) == @__FILE__
    real_main()
end

end # module
