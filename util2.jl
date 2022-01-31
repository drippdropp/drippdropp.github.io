using Dates, BibTeX

MaybeString = Union{Nothing, String}
MaybeBool = Union{Nothing, Bool}
MaybeInt = Union{Nothing, Int}

mutable struct BlogPost
    title::MaybeString
    display::MaybeBool
    date::MaybeString
    epoch::MaybeInt
    fullpath::MaybeString
    filepath::MaybeString
    filename::MaybeString
    tags::Vector{String}
    
    BlogPost() = new(
        nothing, nothing, nothing, nothing, 
        nothing, nothing, nothing, [""])
end

function listdirectories(dirpath)
    [d for d in readdir(dirpath) if isdir(d)]
end;

function parsedate(dt)
    Date(map(x -> parse(Int, x), split(dt, "-"))...)
end;

function date2datetime(dt::Date)
    DateTime(dt)
end;

function cleanstring(str)
    str = replace(str, "\"" => "")
    filter(x -> isnumeric(x) || 
        isspace(x) || ispunct(x) || 
        isletter(x), str) |> strip
end;

function parseline(line)
    rexpr = r"@def ([a-z\_]+) = (.+)"
    m = match(rexpr, line)
    isnothing(m) && return nothing
    (meta, value) = map(strip, [string(m[1]), string(m[2])])
    (meta=meta, value=value)
end

function parseposttags(filepath)
    metadata = Dict{String, Any}()
    for ln in eachline(filepath)
        ln == "" && return post
        
        content = parseline(ln)
        isnothing(content) && return post
        
        if content.meta == "tags"
            metadata[content.meta] = Meta.parse(content.value) |> eval
        else
            metadata[content.meta] = cleanstring(content.value)
        end
    end
    metadata
end

function allposts()
    const postsdir = "posts"
    
end