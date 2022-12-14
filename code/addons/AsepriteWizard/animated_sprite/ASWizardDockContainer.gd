tool
extends TabContainer

signal close_requested

const WizardWindow = preload("./ASWizardWindow.tscn")

var _config
var _file_system: EditorFileSystem

func _ready():
	$Import.init(_config, _file_system)
	$Import.connect("close_requested", self, "emit_signal", ["close_requested"])
	$Import.connect("import_success", $History, "add_entry")
	$History.init(_config)
	$History.connect("request_edit", self, "_on_edit_request")
	$History.connect("request_import", self, "_on_import_request")


func init(config, editor_file_system: EditorFileSystem):
	_config = config
	_file_system = editor_file_system


func _on_AsWizardDockContainer_tab_changed(tab: int):
	if tab == 1:
		$History.reload()


func _on_edit_request(import_cfg: Dictionary):
	$Import.load_import_config(import_cfg)
	self.current_tab = 0


func _on_import_request(import_cfg: Dictionary):
	$Import.load_import_config(import_cfg)
	$Import.trigger_import()
