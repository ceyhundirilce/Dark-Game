extends Node


func savePos():
	var PosFile = File.new()
	var PosData :Dictionary= {}
	PosFile.open("user://dark_game.dat",File.WRITE)
	PosFile.store_var(PosData)
	PosFile.close()

func loadPos():
	var PosFile=File.new()
	if!PosFile.file_exists("user://dark_game.dat"):return
	PosFile.open("user://dark_game.dat",File.READ)
	var PosData=PosFile.get_var()
	
	PosFile.close()
