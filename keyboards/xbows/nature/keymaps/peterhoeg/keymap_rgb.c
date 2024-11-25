bool rgb_matrix_indicators_user(void) {
  uint8_t current_layer = get_highest_layer(layer_state);
  switch (current_layer) {
  case _BASE:
    rgb_matrix_set_color_all(0xFF, 0x00, 0x00); // RGB red
    break;
  case _WINDOWS:
    rgb_matrix_set_color_all(0x00, 0xFF, 0x00); // RGB green
    break;
  case _ARROWS:
    rgb_matrix_set_color_all(0x00, 0x00, 0xFF); // RGB blue
    break;
  case _NUMBERS:
    rgb_matrix_set_color_all(0xFF, 0xFF, 0x00); // RGB yellow
    break;
  default:
    break;
  }
  return false;
}

/* Local Variables: */
/* +format-with-lsp: nil */
/* End: */
