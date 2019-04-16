-- scaffold geniefile for glog

glog_script = path.getabsolute(path.getdirectory(_SCRIPT))
glog_root = path.join(glog_script, "glog")

glog_includedirs = {
	path.join(glog_script, "config"),
	glog_root,
}

glog_libdirs = {}
glog_links = {}
glog_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { glog_includedirs }
	end,

	_add_defines = function()
		defines { glog_defines }
	end,

	_add_libdirs = function()
		libdirs { glog_libdirs }
	end,

	_add_external_links = function()
		links { glog_links }
	end,

	_add_self_links = function()
		links { "glog" }
	end,

	_create_projects = function()

project "glog"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		glog_includedirs,
	}

	defines {}

	files {
		path.join(glog_script, "config", "**.h"),
		path.join(glog_root, "**.h"),
		path.join(glog_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
