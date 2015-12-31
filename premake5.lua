-- Option to allow copying the DLL file to a custom folder after build
newoption {
	trigger = "copy-to",
	description = "Optional, copy the DLL to a custom folder after build, define the path here if wanted.",
	value = "PATH"
}

solution "iw4x"
	location ("./build")
	configurations { "Normal" }

	project "iw4x"
		kind "SharedLib"
		language "C++"
		files { "./src/**.hpp", "./src/**.cpp" }
		toolset "msc" -- only support Microsoft's compiler

		configuration "Normal"
			defines { "NDEBUG" }
			flags { "Optimize", "MultiProcessorCompile", "Symbols" }

		if _OPTIONS["copy-to"] then
			saneCopyToPath = string.gsub(_OPTIONS["copy-to"] .. "\\", "\\\\", "\\")
			postbuildcommands {
				"copy /y \"$(TargetPath)\" \"" .. saneCopyToPath .. "\""
			}
		end
