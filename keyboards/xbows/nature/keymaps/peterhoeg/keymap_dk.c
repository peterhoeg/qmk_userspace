enum unicode_names {
    AE_LOWER,
    AE_UPPER,
};

const uint32_t PROGMEM unicode_map[] = {
    /* [AE_LOWER] = 0x203D,  // æøå  */
    /* [AE_UPPER] = 0x2E2E,  //  */
    [AE_LOWER] = 0x00E6, // æ
    [AE_UPPER] = 0x00C6, // Æ
};
