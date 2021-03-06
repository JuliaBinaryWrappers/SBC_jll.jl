# Autogenerated wrapper script for SBC_jll for powerpc64le-linux-gnu
export libsbc, sbcdec, sbcenc, sbcinfo

using libsndfile_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libsbc`
const libsbc_splitpath = ["lib", "libsbc.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libsbc_path = ""

# libsbc-specific global declaration
# This will be filled out by __init__()
libsbc_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libsbc = "libsbc.so.1"


# Relative path to `sbcdec`
const sbcdec_splitpath = ["bin", "sbcdec"]

# This will be filled out by __init__() for all products, as it must be done at runtime
sbcdec_path = ""

# sbcdec-specific global declaration
function sbcdec(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(sbcdec_path)
    end
end


# Relative path to `sbcenc`
const sbcenc_splitpath = ["bin", "sbcenc"]

# This will be filled out by __init__() for all products, as it must be done at runtime
sbcenc_path = ""

# sbcenc-specific global declaration
function sbcenc(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(sbcenc_path)
    end
end


# Relative path to `sbcinfo`
const sbcinfo_splitpath = ["bin", "sbcinfo"]

# This will be filled out by __init__() for all products, as it must be done at runtime
sbcinfo_path = ""

# sbcinfo-specific global declaration
function sbcinfo(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(sbcinfo_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"SBC")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (libsndfile_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (libsndfile_jll.LIBPATH_list,))

    global libsbc_path = normpath(joinpath(artifact_dir, libsbc_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libsbc_handle = dlopen(libsbc_path)
    push!(LIBPATH_list, dirname(libsbc_path))

    global sbcdec_path = normpath(joinpath(artifact_dir, sbcdec_splitpath...))

    push!(PATH_list, dirname(sbcdec_path))
    global sbcenc_path = normpath(joinpath(artifact_dir, sbcenc_splitpath...))

    push!(PATH_list, dirname(sbcenc_path))
    global sbcinfo_path = normpath(joinpath(artifact_dir, sbcinfo_splitpath...))

    push!(PATH_list, dirname(sbcinfo_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

