namespace Utils
{
	namespace IO
	{
		bool FileExists(std::string file);
		void WriteFile(std::string file, std::string data);
		std::string ReadFile(std::string file);
	}
}