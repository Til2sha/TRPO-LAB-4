lgi = require('lgi');
gtk = lgi.Gtk;
gdk = lgi.Gdk;
gtk.init();

bld = gtk.Builder();
pixbuf = lgi.GdkPixbuf.Pixbuf;
bld:add_from_file('Lab_04.glade');

ui = bld.objects;
ui.Main_Window.title = 'Work with Table';
ui.Main_Window.on_destroy = gtk.main_quit();
--
function ui.Button_AddItem.on_clicked()
  name = ui.TextBox_Name.text;
  value = tonumber(ui.TextBox_Value.text);
  image = pixbuf.new_from_file('img-apple.png');
  --image:scale_simple(25, 25, GdkInterpType.INTERP_NEAREST);
  
  i = ui.ListStore_Items:append();
  ui.ListStore_Items[i] = { [1] = name, [2] = value, [3] = image };
end

render_text = gtk.CellRendererText {}
render_image = gtk.CellRendererPixbuf {}

col_1 = gtk.TreeViewColumn { title = 'Name', { render_text, { text = 1 } } };
col_2 = gtk.TreeViewColumn { title = 'Value', { render_text, { text = 2 } } };
col_3 = gtk.TreeViewColumn { title = 'Name', { render_image, { pixbuf = 3 } } };

ui.TreeView:append_column(col_1);
ui.TreeView:append_column(col_2);
ui.TreeView:append_column(col_3);
--
ui.Main_Window:show_all();
gtk.main();
