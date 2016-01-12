#include "STDInclude.hpp"

namespace Utils
{
	void* Memory::Allocate(size_t length)
	{
		void* data = new char[length];

		if (data)
		{
			ZeroMemory(data, length);
		}

		return data;
	}

	char* Memory::DuplicateString(std::string string)
	{
		char* newString = Memory::AllocateArray<char>(string.size() + 1);
		memcpy(newString, string.data(), string.size());
		return newString;
	}

	void Memory::Free(void* data)
	{
		delete[] data;
	}

	void Memory::Free(const void* data)
	{
		Memory::Free((void*)data);
	}
}