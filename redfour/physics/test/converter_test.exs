defmodule ConverterTest do
	use ExUnit.Case
	
	test "converts miles to light seconds returns true something " do
		convereted = Converter.to_light_seconds({:miles, 1000}, precision: 5) 
		assert convereted == 0.00587
	end

	test "converts meters to light seconds returns true something " do
		convereted = Converter.to_light_seconds({:meters, 20000}, precision: 5) 
		assert convereted == 7.0e-5
	end 

	test "converts :feet to light seconds returns true something " do
		convereted = Converter.to_light_seconds({:feet, 10000000}, precision: 5) 
		assert convereted == 0.01017
	end 

	test "converts inches to light seconds returns true something " do
		convereted = Converter.to_light_seconds({:inches, 10000000}, precision: 5) 
		assert convereted == 8.5e-4
	end  


end