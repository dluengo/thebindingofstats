-- This file is pretty much a copy of the CollectibleType and TrinketType.
-- The game's API looks clunky to me (maybe I don't fully understand it) so I
-- implemented some functionality regarding items here.

-- Table with all the items: id, name
local __ID = 1
local __NAME = 2

-- In the future, if new items are added, this will need to be updated
-- accordingly.
Items = {
    {0, "NULL"},
    {1, "SAD_ONION"},
    {2, "INNER_EYE"},
    {3, "SPOON_BENDER"},
    {4, "CRICKETS_HEAD"},
    {5, "MY_REFLECTION"},
    {6, "NUMBER_ONE"},
    {7, "BLOOD_OF_THE_MARTYR"},
    {8, "BROTHER_BOBBY"},
    {9, "SKATOLE"},
    {10, "HALO_OF_FLIES"},
    {11, "1UP"},
    {12, "MAGIC_MUSHROOM"},
    {13, "VIRUS"},
    {14, "ROID_RAGE"},
    {15, "HEART"},
    {16, "RAW_LIVER"},
    {17, "SKELETON_KEY"},
    {18, "DOLLAR"},
    {19, "BOOM"},
    {20, "TRANSCENDENCE"},
    {21, "COMPASS"},
    {22, "LUNCH"},
    {23, "DINNER"},
    {24, "DESSERT"},
    {25, "BREAKFAST"},
    {26, "ROTTEN_MEAT"},
    {27, "WOODEN_SPOON"},
    {28, "BELT"},
    {29, "MOMS_UNDERWEAR"},
    {30, "MOMS_HEELS"},
    {31, "MOMS_LIPSTICK"},
    {32, "WIRE_COAT_HANGER"},
    {33, "BIBLE"},
    {34, "BOOK_OF_BELIAL"},
    {35, "NECRONOMICON"},
    {36, "POOP"},
    {37, "MR_BOOM"},
    {38, "TAMMYS_HEAD"},
    {39, "MOMS_BRA"},
    {40, "KAMIKAZE"},
    {41, "MOMS_PAD"},
    {42, "BOBS_ROTTEN_HEAD"},
    {43, "NULL"},
    {44, "TELEPORT"},
    {45, "YUM_HEART"},
    {46, "LUCKY_FOOT"},
    {47, "DOCTORS_REMOTE"},
    {48, "CUPIDS_ARROW"},
    {49, "SHOOP_DA_WHOOP"},
    {50, "STEVEN"},
    {51, "PENTAGRAM"},
    {52, "DR_FETUS"},
    {53, "MAGNETO"},
    {54, "TREASURE_MAP"},
    {55, "MOMS_EYE"},
    {56, "LEMON_MISHAP"},
    {57, "DISTANT_ADMIRATION"},
    {58, "BOOK_OF_SHADOWS"},
    {59, "BOOK_OF_BELIAL_PASSIVE"},
    {60, "LADDER"},
    {61, "NULL"},
    {62, "CHARM_VAMPIRE"},
    {63, "BATTERY"},
    {64, "STEAM_SALE"},
    {65, "ANARCHIST_COOKBOOK"},
    {66, "HOURGLASS"},
    {67, "SISTER_MAGGY"},
    {68, "TECHNOLOGY"},
    {69, "CHOCOLATE_MILK"},
    {70, "GROWTH_HORMONES"},
    {71, "MINI_MUSH"},
    {72, "ROSARY"},
    {73, "CUBE_OF_MEAT"},
    {74, "QUARTER"},
    {75, "PHD"},
    {76, "XRAY_VISION"},
    {77, "MY_LITTLE_UNICORN"},
    {78, "BOOK_OF_REVELATIONS"},
    {79, "MARK"},
    {80, "PACT"},
    {81, "DEAD_CAT"},
    {82, "LORD_OF_THE_PIT"},
    {83, "THE_NAIL"},
    {84, "WE_NEED_TO_GO_DEEPER"},
    {85, "DECK_OF_CARDS"},
    {86, "MONSTROS_TOOTH"},
    {87, "LOKIS_HORNS"},
    {88, "LITTLE_CHUBBY"},
    {89, "SPIDER_BITE"},
    {90, "SMALL_ROCK"},
    {91, "SPELUNKER_HAT"},
    {92, "SUPER_BANDAGE"},
    {93, "GAMEKID"},
    {94, "SACK_OF_PENNIES"},
    {95, "ROBO_BABY"},
    {96, "LITTLE_CHAD"},
    {97, "BOOK_OF_SIN"},
    {98, "RELIC"},
    {99, "LITTLE_GISH"},
    {100, "LITTLE_STEVEN"},
    {101, "HALO"},
    {102, "MOMS_BOTTLE_OF_PILLS"},
    {103, "COMMON_COLD"},
    {104, "PARASITE"},
    {105, "D6"},
    {106, "MR_MEGA"},
    {107, "PINKING_SHEARS"},
    {108, "WAFER"},
    {109, "MONEY_EQUALS_POWER"},
    {110, "MOMS_CONTACTS"},
    {111, "BEAN"},
    {112, "GUARDIAN_ANGEL"},
    {113, "DEMON_BABY"},
    {114, "MOMS_KNIFE"},
    {115, "OUIJA_BOARD"},
    {116, "9_VOLT"},
    {117, "DEAD_BIRD"},
    {118, "BRIMSTONE"},
    {119, "BLOOD_BAG"},
    {120, "ODD_MUSHROOM_THIN"},
    {121, "ODD_MUSHROOM_LARGE"},
    {122, "WHORE_OF_BABYLON"},
    {123, "MONSTER_MANUAL"},
    {124, "DEAD_SEA_SCROLLS"},
    {125, "BOBBY_BOMB"},
    {126, "RAZOR_BLADE"},
    {127, "FORGET_ME_NOW"},
    {128, "FOREVER_ALONE"},
    {129, "BUCKET_OF_LARD"},
    {130, "PONY"},
    {131, "BOMB_BAG"},
    {132, "LUMP_OF_COAL"},
    {133, "GUPPYS_PAW"},
    {134, "GUPPYS_TAIL"},
    {135, "IV_BAG"},
    {136, "BEST_FRIEND"},
    {137, "REMOTE_DETONATOR"},
    {138, "STIGMATA"},
    {139, "MOMS_PURSE"},
    {140, "BOBS_CURSE"},
    {141, "PAGEANT_BOY"},
    {142, "SCAPULAR"},
    {143, "SPEED_BALL"},
    {144, "BUM_FRIEND"},
    {145, "GUPPYS_HEAD"},
    {146, "PRAYER_CARD"},
    {147, "NOTCHED_AXE"},
    {148, "INFESTATION"},
    {149, "IPECAC"},
    {150, "TOUGH_LOVE"},
    {151, "MULLIGAN"},
    {152, "TECHNOLOGY_2"},
    {153, "MUTANT_SPIDER"},
    {154, "CHEMICAL_PEEL"},
    {155, "PEEPER"},
    {156, "HABIT"},
    {157, "BLOODY_LUST"},
    {158, "CRYSTAL_BALL"},
    {159, "SPIRIT_OF_THE_NIGHT"},
    {160, "CRACK_THE_SKY"},
    {161, "ANKH"},
    {162, "CELTIC_CROSS"},
    {163, "GHOST_BABY"},
    {164, "CANDLE"},
    {165, "CAT_O_NINE_TAILS"},
    {166, "D20"},
    {167, "HARLEQUIN_BABY"},
    {168, "EPIC_FETUS"},
    {169, "POLYPHEMUS"},
    {170, "DADDY_LONGLEGS"},
    {171, "SPIDER_BUTT"},
    {172, "SACRIFICIAL_DAGGER"},
    {173, "MITRE"},
    {174, "RAINBOW_BABY"},
    {175, "DADS_KEY"},
    {176, "STEM_CELLS"},
    {177, "PORTABLE_SLOT"},
    {178, "HOLY_WATER"},
    {179, "FATE"},
    {180, "BLACK_BEAN"},
    {181, "WHITE_PONY"},
    {182, "SACRED_HEART"},
    {183, "TOOTH_PICKS"},
    {184, "HOLY_GRAIL"},
    {185, "DEAD_DOVE"},
    {186, "BLOOD_RIGHTS"},
    {187, "GUPPYS_HAIRBALL"},
    {188, "ABEL"},
    {189, "SMB_SUPER_FAN"},
    {190, "PYRO"},
    {191, "3_DOLLAR_BILL"},
    {192, "TELEPATHY_BOOK"},
    {193, "MEAT"},
    {194, "MAGIC_8_BALL"},
    {195, "MOMS_COIN_PURSE"},
    {196, "SQUEEZY"},
    {197, "JESUS_JUICE"},
    {198, "BOX"},
    {199, "MOMS_KEY"},
    {200, "MOMS_EYESHADOW"},
    {201, "IRON_BAR"},
    {202, "MIDAS_TOUCH"},
    {203, "HUMBLEING_BUNDLE"},
    {204, "FANNY_PACK"},
    {205, "SHARP_PLUG"},
    {206, "GUILLOTINE"},
    {207, "BALL_OF_BANDAGES"},
    {208, "CHAMPION_BELT"},
    {209, "BUTT_BOMBS"},
    {210, "GNAWED_LEAF"},
    {211, "SPIDERBABY"},
    {212, "GUPPYS_COLLAR"},
    {213, "LOST_CONTACT"},
    {214, "ANEMIC"},
    {215, "GOAT_HEAD"},
    {216, "CEREMONIAL_ROBES"},
    {217, "MOMS_WIG"},
    {218, "PLACENTA"},
    {219, "OLD_BANDAGE"},
    {220, "SAD_BOMBS"},
    {221, "RUBBER_CEMENT"},
    {222, "ANTI_GRAVITY"},
    {223, "PYROMANIAC"},
    {224, "CRICKETS_BODY"},
    {225, "GIMPY"},
    {226, "BLACK_LOTUS"},
    {227, "PIGGY_BANK"},
    {228, "MOMS_PERFUME"},
    {229, "MONSTROS_LUNG"},
    {230, "ABADDON"},
    {231, "BALL_OF_TAR"},
    {232, "STOP_WATCH"},
    {233, "TINY_PLANET"},
    {234, "INFESTATION_2"},
    {235, "NULL"},
    {236, "E_COLI"},
    {237, "DEATHS_TOUCH"},
    {238, "KEY_PIECE_1"},
    {239, "KEY_PIECE_2"},
    {240, "EXPERIMENTAL_TREATMENT"},
    {241, "CONTRACT_FROM_BELOW"},
    {242, "INFAMY"},
    {243, "TRINITY_SHIELD"},
    {244, "TECH_5"},
    {245, "20_20"},
    {246, "BLUE_MAP"},
    {247, "BFFS"},
    {248, "HIVE_MIND"},
    {249, "THERES_OPTIONS"},
    {250, "BOGO_BOMBS"},
    {251, "STARTER_DECK"},
    {252, "LITTLE_BAGGY"},
    {253, "MAGIC_SCAB"},
    {254, "BLOOD_CLOT"},
    {255, "SCREW"},
    {256, "HOT_BOMBS"},
    {257, "FIRE_MIND"},
    {258, "MISSING_NO"},
    {259, "DARK_MATTER"},
    {260, "BLACK_CANDLE"},
    {261, "PROPTOSIS"},
    {262, "MISSING_PAGE_2"},
    {263, "CLEAR_RUNE"},
    {264, "SMART_FLY"},
    {265, "DRY_BABY"},
    {266, "JUICY_SACK"},
    {267, "ROBO_BABY_2"},
    {268, "ROTTEN_BABY"},
    {269, "HEADLESS_BABY"},
    {270, "LEECH"},
    {271, "MYSTERY_SACK"},
    {272, "BBF"},
    {273, "BOBS_BRAIN"},
    {274, "BEST_BUD"},
    {275, "LIL_BRIMSTONE"},
    {276, "ISAACS_HEART"},
    {277, "LIL_HAUNT"},
    {278, "DARK_BUM"},
    {279, "BIG_FAN"},
    {280, "SISSY_LONGLEGS"},
    {281, "PUNCHING_BAG"},
    {282, "HOW_TO_JUMP"},
    {283, "D100"},
    {284, "D4"},
    {285, "D10"},
    {286, "BLANK_CARD"},
    {287, "BOOK_OF_SECRETS"},
    {288, "BOX_OF_SPIDERS"},
    {289, "RED_CANDLE"},
    {290, "THE_JAR"},
    {291, "FLUSH"},
    {292, "SATANIC_BIBLE"},
    {293, "HEAD_OF_KRAMPUS"},
    {294, "BUTTER_BEAN"},
    {295, "MAGIC_FINGERS"},
    {296, "CONVERTER"},
    {297, "BLUE_BOX"},
    {298, "UNICORN_STUMP"},
    {299, "TAURUS"},
    {300, "ARIES"},
    {301, "CANCER"},
    {302, "LEO"},
    {303, "VIRGO"},
    {304, "LIBRA"},
    {305, "SCORPIO"},
    {306, "SAGITTARIUS"},
    {307, "CAPRICORN"},
    {308, "AQUARIUS"},
    {309, "PISCES"},
    {310, "EVES_MASCARA"},
    {311, "JUDAS_SHADOW"},
    {312, "MAGGYS_BOW"},
    {313, "HOLY_MANTLE"},
    {314, "THUNDER_THIGHS"},
    {315, "STRANGE_ATTRACTOR"},
    {316, "CURSED_EYE"},
    {317, "MYSTERIOUS_LIQUID"},
    {318, "GEMINI"},
    {319, "CAINS_OTHER_EYE"},
    {320, "BLUE_BABYS_ONLY_FRIEND"},
    {321, "SAMSONS_CHAINS"},
    {322, "MONGO_BABY"},
    {323, "ISAACS_TEARS"},
    {324, "UNDEFINED"},
    {325, "SCISSORS"},
    {326, "BREATH_OF_LIFE"},
    {327, "POLAROID"},
    {328, "NEGATIVE"},
    {329, "LUDOVICO_TECHNIQUE"},
    {330, "SOY_MILK"},
    {331, "GODHEAD"},
    {332, "LAZARUS_RAGS"},
    {333, "MIND"},
    {334, "BODY"},
    {335, "SOUL"},
    {336, "DEAD_ONION"},
    {337, "BROKEN_WATCH"},
    {338, "BOOMERANG"},
    {339, "SAFETY_PIN"},
    {340, "CAFFEINE_PILL"},
    {341, "TORN_PHOTO"},
    {342, "BLUE_CAP"},
    {343, "LATCH_KEY"},
    {344, "MATCH_BOOK"},
    {345, "SYNTHOIL"},
    {346, "SNACK"},
    {347, "DIPLOPIA"},
    {348, "PLACEBO"},
    {349, "WOODEN_NICKEL"},
    {350, "TOXIC_SHOCK"},
    {351, "MEGA_BEAN"},
    {352, "GLASS_CANNON"},
    {353, "BOMBER_BOY"},
    {354, "CRACK_JACKS"},
    {355, "MOMS_PEARLS"},
    {356, "CAR_BATTERY"},
    {357, "BOX_OF_FRIENDS"},
    {358, "THE_WIZ"},
    {359, "8_INCH_NAILS"},
    {360, "INCUBUS"},
    {361, "FATES_REWARD"},
    {362, "LIL_CHEST"},
    {363, "SWORN_PROTECTOR"},
    {364, "FRIEND_ZONE"},
    {365, "LOST_FLY"},
    {366, "SCATTER_BOMBS"},
    {367, "STICKY_BOMBS"},
    {368, "EPIPHORA"},
    {369, "CONTINUUM"},
    {370, "MR_DOLLY"},
    {371, "CURSE_OF_THE_TOWER"},
    {372, "CHARGED_BABY"},
    {373, "DEAD_EYE"},
    {374, "HOLY_LIGHT"},
    {375, "HOST_HAT"},
    {376, "RESTOCK"},
    {377, "BURSTING_SACK"},
    {378, "NUMBER_TWO"},
    {379, "PUPULA_DUPLEX"},
    {380, "PAY_TO_PLAY"},
    {381, "EDENS_BLESSING"},
    {382, "FRIEND_BALL"},
    {383, "TEAR_DETONATOR"},
    {384, "LIL_GURDY"},
    {385, "BUMBO"},
    {386, "D12"},
    {387, "CENSER"},
    {388, "KEY_BUM"},
    {389, "RUNE_BAG"},
    {390, "SERAPHIM"},
    {391, "BETRAYAL"},
    {392, "ZODIAC"},
    {393, "SERPENTS_KISS"},
    {394, "MARKED"},
    {395, "TECH_X"},
    {396, "VENTRICLE_RAZOR"},
    {397, "TRACTOR_BEAM"},
    {398, "GODS_FLESH"},
    {399, "MAW_OF_THE_VOID"},
    {400, "SPEAR_OF_DESTINY"},
    {401, "EXPLOSIVO"},
    {402, "CHAOS"},
    {403, "SPIDER_MOD"},
    {404, "FARTING_BABY"},
    {405, "GB_BUG"},
    {406, "D8"},
    {407, "PURITY"},
    {408, "ATHAME"},
    {409, "EMPTY_VESSEL"},
    {410, "EVIL_EYE"},
    {411, "LUSTY_BLOOD"},
    {412, "CAMBION_CONCEPTION"},
    {413, "IMMACULATE_CONCEPTION"},
    {414, "MORE_OPTIONS"},
    {415, "CROWN_OF_LIGHT"},
    {416, "DEEP_POCKETS"},
    {417, "SUCCUBUS"},
    {418, "FRUIT_CAKE"},
    {419, "TELEPORT_2"},
    {420, "BLACK_POWDER"},
    {421, "KIDNEY_BEAN"},
    {422, "GLOWING_HOUR_GLASS"},
    {423, "CIRCLE_OF_PROTECTION"},
    {424, "SACK_HEAD"},
    {425, "NIGHT_LIGHT"},
    {426, "OBSESSED_FAN"},
    {427, "MINE_CRAFTER"},
    {428, "PJS"},
    {429, "HEAD_OF_THE_KEEPER"},
    {430, "PAPA_FLY"},
    {431, "MULTIDIMENSIONAL_BABY"},
    {432, "GLITTER_BOMBS"},
    {433, "MY_SHADOW"},
    {434, "JAR_OF_FLIES"},
    {435, "LIL_LOKI"},
    {436, "MILK"},
    {437, "D7"},
    {438, "BINKY"},
    {439, "MOMS_BOX"},
    {440, "KIDNEY_STONE"},
    {441, "MEGA_BLAST"},
    {442, "DARK_PRINCES_CROWN"},
    {443, "APPLE"},
    {444, "LEAD_PENCIL"},
    {445, "DOG_TOOTH"},
    {446, "DEAD_TOOTH"},
    {447, "LINGER_BEAN"},
    {448, "SHARD_OF_GLASS"},
    {449, "METAL_PLATE"},
    {450, "EYE_OF_GREED"},
    {451, "TAROT_CLOTH"},
    {452, "VARICOSE_VEINS"},
    {453, "COMPOUND_FRACTURE"},
    {454, "POLYDACTYLY"},
    {455, "DADS_LOST_COIN"},
    {456, "MIDNIGHT_SNACK"},
    {457, "CONE_HEAD"},
    {458, "BELLY_BUTTON"},
    {459, "SINUS_INFECTION"},
    {460, "GLAUCOMA"},
    {461, "PARASITOID"},
    {462, "EYE_OF_BELIAL"},
    {463, "SULFURIC_ACID"},
    {464, "GLYPH_OF_BALANCE"},
    {465, "ANALOG_STICK"},
    {466, "CONTAGION"},
    {467, "FINGER"},
    {468, "SHADE"},
    {469, "DEPRESSION"},
    {470, "HUSHY"},
    {471, "LIL_MONSTRO"},
    {472, "KING_BABY"},
    {473, "BIG_CHUBBY"},
    {474, "BROKEN_GLASS_CANNON"},
    {475, "PLAN_C"},
    {476, "D1"},
    {477, "VOID"},
    {478, "PAUSE"},
    {479, "SMELTER"},
    {480, "COMPOST"},
    {481, "DATAMINER"},
    {482, "CLICKER"},
    {483, "MAMA_MEGA"},
    {484, "WAIT_WHAT"},
    {485, "CROOKED_PENNY"},
    {486, "DULL_RAZOR"},
    {487, "POTATO_PEELER"},
    {488, "METRONOME"},
    {489, "D_INFINITY"},
    {490, "EDENS_SOUL"},
    {491, "ACID_BABY"},
    {492, "YO_LISTEN"},
    {493, "ADRENALINE"},
    {494, "JACOBS_LADDER"},
    {495, "GHOST_PEPPER"},
    {496, "EUTHANASIA"},
    {497, "CAMO_UNDIES"},
    {498, "DUALITY"},
    {499, "EUCHARIST"},
    {500, "SACK_OF_SACKS"},
    {501, "GREEDS_GULLET"},
    {502, "LARGE_ZIT"},
    {503, "LITTLE_HORN"},
    {504, "BROWN_NUGGET"},
    {505, "POKE_GO"},
    {506, "BACKSTABBER"},
    {507, "SHARP_STRAW"},
    {508, "MOMS_RAZOR"},
    {509, "BLOODSHOT_EYE"},
    {510, "DELIRIOUS"},
    {511, "ANGRY_FLY"},
    {512, "BLACK_HOLE"},
    {513, "BOZO"},
    {514, "BROKEN_MODEM"},
    {515, "MYSTERY_GIFT"},
    {516, "SPRINKLER"},
    {517, "FAST_BOMBS"},
    {518, "BUDDY_IN_A_BOX"},
    {519, "LIL_DELIRIUM"},
    {520, "JUMPER_CABLES"},
    {521, "COUPON"},
    {522, "TELEKINESIS"},
    {523, "MOVING_BOX"},
    {524, "TECHNOLOGY_ZERO"},
    {525, "LEPROSY"},
    {526, "7_SEALS"},
    {527, "MR_ME"},
    {528, "ANGELIC_PRISM"},
    {529, "POP"},
    {530, "DEATHS_LIST"},
    {531, "HAEMOLACRIA"},
    {532, "LACHRYPHAGY"},
    {533, "TRISAGION"},
    {534, "SCHOOLBAG"},
    {535, "BLANKET"},
    {536, "SACRIFICIAL_ALTAR"},
    {537, "LIL_SPEWER"},
    {538, "MARBLES"},
    {539, "MYSTERY_EGG"},
    {540, "FLAT_STONE"},
    {541, "MARROW"},
    {542, "SLIPPED_RIB"},
    {543, "HALLOWED_GROUND"},
    {544, "POINTY_RIB"},
    {545, "BOOK_OF_THE_DEAD"},
    {546, "DADS_RING"},
    {547, "DIVORCE_PAPERS"},
    {548, "JAW_BONE"},
    {549, "BRITTLE_BONES"},
    {550, "BROKEN_SHOVEL_1"},
    {551, "BROKEN_SHOVEL_2"},
    {552, "MOMS_SHOVEL"},
    {553, "MUCORMYCOSIS"},
    {554, "2SPOOKY"},
    {555, "GOLDEN_RAZOR"},
    {556, "SULFUR"},
    {557, "FORTUNE_COOKIE"},
    {558, "EYE_SORE"},
    {559, "120_VOLT"},
    {560, "IT_HURTS"},
    {561, "ALMOND_MILK"},
    {562, "ROCK_BOTTOM"},
    {563, "NANCY_BOMBS"},
    {564, "BAR_OF_SOAP"},
    {565, "BLOOD_PUPPY"},
    {566, "DREAM_CATCHER"},
    {567, "PASCHAL_CANDLE"},
    {568, "DIVINE_INTERVENTION"},
    {569, "BLOOD_OATH"},
    {570, "PLAYDOUGH_COOKIE"},
    {571, "SOCKS"},
    {572, "EYE_OF_THE_OCCULT"},
    {573, "IMMACULATE_HEART"},
    {574, "MONSTRANCE"},
    {575, "INTRUDER"},
    {576, "DIRTY_MIND"},
    {577, "DAMOCLES"},
    {578, "FREE_LEMONADE"},
    {579, "SPIRIT_SWORD"},
    {580, "RED_KEY"},
    {581, "PSY_FLY"},
    {582, "WAVY_CAP"},
    {583, "ROCKET_IN_A_JAR"},
    {584, "BOOK_OF_VIRTUES"},
    {585, "ALABASTER_BOX"},
    {586, "STAIRWAY"},
    {588, "SOL"},
    {589, "LUNA"},
    {590, "MERCURIUS"},
    {591, "VENUS"},
    {592, "TERRA"},
    {593, "MARS"},
    {594, "JUPITER"},
    {595, "SATURNUS"},
    {596, "URANUS"},
    {597, "NEPTUNUS"},
    {598, "PLUTO"},
    {599, "VOODOO_HEAD"},
    {600, "EYE_DROPS"},
    {601, "ACT_OF_CONTRITION"},
    {602, "MEMBER_CARD"},
    {603, "BATTERY_PACK"},
    {604, "MOMS_BRACELET"},
    {605, "SCOOPER"},
    {606, "OCULAR_RIFT"},
    {607, "BOILED_BABY"},
    {608, "FREEZER_BABY"},
    {609, "ETERNAL_D6"},
    {610, "BIRD_CAGE"},
    {611, "LARYNX"},
    {612, "LOST_SOUL"},
    {614, "BLOOD_BOMBS"},
    {615, "LIL_DUMPY"},
    {616, "BIRDS_EYE"},
    {617, "LODESTONE"},
    {618, "ROTTEN_TOMATO"},
    {619, "BIRTHRIGHT"},
    {621, "RED_STEW"},
    {622, "GENESIS"},
    {623, "SHARP_KEY"},
    {624, "BOOSTER_PACK"},
    {625, "MEGA_MUSH"},
    {626, "KNIFE_PIECE_1"},
    {627, "KNIFE_PIECE_2"},
    {628, "DEATH_CERTIFICATE"},
    {629, "BOT_FLY"},
    {631, "MEAT_CLEAVER"},
    {632, "EVIL_CHARM"},
    {633, "DOGMA"},
    {634, "PURGATORY"},
    {635, "STITCHES"},
    {636, "R_KEY"},
    {637, "KNOCKOUT_DROPS"},
    {638, "ERASER"},
    {639, "YUCK_HEART"},
    {640, "URN_OF_SOULS"},
    {641, "AKELDAMA"},
    {641, "AKELDAMA"},
    {642, "MAGIC_SKIN"},
    {643, "REVELATION"},
    {644, "CONSOLATION_PRIZE"},
    {645, "TINYTOMA"},
    {646, "BRIMSTONE_BOMBS"},
    {647, "4_5_VOLT"},
    {649, "FRUITY_PLUM"},
    {650, "PLUM_FLUTE"},
    {651, "STAR_OF_BETHLEHEM"},
    {652, "CUBE_BABY"},
    {653, "VADE_RETRO"},
    {654, "FALSE_PHD"},
    {655, "SPIN_TO_WIN"},
    {656, "DAMOCLES_PASSIVE"},
    {657, "VASCULITIS"},
    {658, "GIANT_CELL"},
    {659, "TROPICAMIDE"},
    {660, "CARD_READING"},
    {661, "QUINTS"},
    {663, "TOOTH_AND_NAIL"},
    {664, "BINGE_EATER"},
    {665, "GUPPYS_EYE"},
    {667, "STRAW_MAN"},
    {668, "DADS_NOTE"},
    {669, "SAUSAGE"},
    {670, "OPTIONS"},
    {671, "CANDY_HEART"},
    {672, "POUND_OF_FLESH"},
    {673, "REDEMPTION"},
    {674, "SPIRIT_SHACKLES"},
    {675, "CRACKED_ORB"},
    {676, "EMPTY_HEART"},
    {677, "ASTRAL_PROJECTION"},
    {678, "C_SECTION"},
    {679, "LIL_ABADDON"},
    {680, "MONTEZUMAS_REVENGE"},
    {681, "LIL_PORTAL"},
    {682, "WORM_FRIEND"},
    {683, "BONE_SPURS"},
    {684, "HUNGRY_SOUL"},
    {685, "JAR_OF_WISPS"},
    {686, "SOUL_LOCKET"},
    {687, "FRIEND_FINDER"},
    {688, "INNER_CHILD"},
    {689, "GLITCHED_CROWN"},
    {690, "JELLY_BELLY"},
    {691, "SACRED_ORB"},
    {692, "SANGUINE_BOND"},
    {693, "SWARM"},
    {694, "HEARTBREAK"},
    {695, "BLOODY_GUST"},
    {696, "SALVATION"},
    {697, "VANISHING_TWIN"},
    {698, "TWISTED_PAIR"},
    {699, "AZAZELS_RAGE"},
    {700, "ECHO_CHAMBER"},
    {701, "ISAACS_TOMB"},
    {702, "VENGEFUL_SPIRIT"},
    {703, "ESAU_JR"},
    {704, "BERSERK"},
    {705, "DARK_ARTS"},
    {706, "ABYSS"},
    {707, "SUPPER"},
    {708, "STAPLER"},
    {709, "SUPLEX"},
    {710, "BAG_OF_CRAFTING"},
    {711, "FLIP"},
    {712, "LEMEGETON"},
    {713, "SUMPTORIUM"},
    {714, "RECALL"},
    {715, "HOLD"},
    {716, "KEEPERS_SACK"},
    {717, "KEEPERS_KIN"},
    {719, "KEEPERS_BOX"},
    {720, "EVERYTHING_JAR"},
    {721, "TMTRAINER"},
    {722, "ANIMA_SOLA"},
    {723, "SPINDOWN_DICE"},
    {724, "HYPERCOAGULATION"},
    {725, "IBS"},
    {726, "HEMOPTYSIS"},
    {727, "GHOST_BOMBS"},
    {728, "GELLO"},
    {729, "DECAP_ATTACK"},
    {730, "GLASS_EYE"},
    {731, "STYE"},
    {732, "MOMS_RING"},
    {733, "NUM_COLLECTIBLES"}
}

-- Linear search, easy to code but inefficient
function Items:GetItemNameById(id)
    if id > 0 and id < CollectibleType.NUM_COLLECTIBLES then

        local i = 1
        while i <= CollectibleType.NUM_COLLECTIBLES do

            local item = Items[i]
            if item[__ID] == id then
                return item[__NAME]
            end
    
            i = i + 1
        end
    end

    return ""
end

-- Determines whether an item, given by its id, is passive or not.
function Items:IsPassiveItem(id)
    local item_config = Isaac.GetItemConfig():GetCollectible(id)

    -- For some reason there is a separate type for familiars (i.e. cube of
    -- meat, brother bobby, dark bum...). So we need to check if the item is
    -- passive or a familiar.
    if item_config.Type == ItemType.ITEM_PASSIVE or
        item_config.Type == ItemType.ITEM_FAMILIAR then
        return true
    end

    return false
end

Trinkets = {
    {0, "NULL"},
    {1, "SWALLOWED_PENNY"},
    {2, "PETRIFIED_POOP"},
    {3, "AAA_BATTERY"},
    {4, "BROKEN_REMOTE"},
    {5, "PURPLE_HEART"},
    {6, "BROKEN_MAGNET"},
    {7, "ROSARY_BEAD"},
    {8, "CARTRIDGE"},
    {9, "PULSE_WORM"},
    {10, "WIGGLE_WORM"},
    {11, "RING_WORM"},
    {12, "FLAT_WORM"},
    {13, "STORE_CREDIT"},
    {14, "CALLUS"},
    {15, "LUCKY_ROCK"},
    {16, "MOMS_TOENAIL"},
    {17, "BLACK_LIPSTICK"},
    {18, "BIBLE_TRACT"},
    {19, "PAPER_CLIP"},
    {20, "MONKEY_PAW"},
    {21, "MYSTERIOUS_PAPER"},
    {22, "DAEMONS_TAIL"},
    {23, "MISSING_POSTER"},
    {24, "BUTT_PENNY"},
    {25, "MYSTERIOUS_CANDY"},
    {26, "HOOK_WORM"},
    {27, "WHIP_WORM"},
    {28, "BROKEN_ANKH"},
    {29, "FISH_HEAD"},
    {30, "PINKY_EYE"},
    {31, "PUSH_PIN"},
    {32, "LIBERTY_CAP"},
    {33, "UMBILICAL_CORD"},
    {34, "CHILDS_HEART"},
    {35, "CURVED_HORN"},
    {36, "RUSTED_KEY"},
    {37, "GOAT_HOOF"},
    {38, "MOMS_PEARL"},
    {39, "CANCER"},
    {40, "RED_PATCH"},
    {41, "MATCH_STICK"},
    {42, "LUCKY_TOE"},
    {43, "CURSED_SKULL"},
    {44, "SAFETY_CAP"},
    {45, "ACE_SPADES"},
    {46, "ISAACS_FORK"},
    {47, "POLAROID_OBSOLETE"},
    {48, "MISSING_PAGE"},
    {49, "BLOODY_PENNY"},
    {50, "BURNT_PENNY"},
    {51, "FLAT_PENNY"},
    {52, "COUNTERFEIT_PENNY"},
    {53, "TICK"},
    {54, "ISAACS_HEAD"},
    {55, "MAGGYS_FAITH"},
    {56, "JUDAS_TONGUE"},
    {57, "SOUL"},
    {58, "SAMSONS_LOCK"},
    {59, "CAINS_EYE"},
    {60, "EVES_BIRD_FOOT"},
    {61, "LEFT_HAND"},
    {62, "SHINY_ROCK"},
    {63, "SAFETY_SCISSORS"},
    {64, "RAINBOW_WORM"},
    {65, "TAPE_WORM"},
    {66, "LAZY_WORM"},
    {67, "CRACKED_DICE"},
    {68, "SUPER_MAGNET"},
    {69, "FADED_POLAROID"},
    {70, "LOUSE"},
    {71, "BOBS_BLADDER"},
    {72, "WATCH_BATTERY"},
    {73, "BLASTING_CAP"},
    {74, "STUD_FINDER"},
    {75, "ERROR"},
    {76, "POKER_CHIP"},
    {77, "BLISTER"},
    {78, "SECOND_HAND"},
    {79, "ENDLESS_NAMELESS"},
    {80, "BLACK_FEATHER"},
    {81, "BLIND_RAGE"},
    {82, "GOLDEN_HORSE_SHOE"},
    {83, "STORE_KEY"},
    {84, "RIB_OF_GREED"},
    {85, "KARMA"},
    {86, "LIL_LARVA"},
    {87, "MOMS_LOCKET"},
    {88, "NO"},
    {89, "CHILD_LEASH"},
    {90, "BROWN_CAP"},
    {91, "MECONIUM"},
    {92, "CRACKED_CROWN"},
    {93, "USED_DIAPER"},
    {94, "FISH_TAIL"},
    {95, "BLACK_TOOTH"},
    {96, "OUROBOROS_WORM"},
    {97, "TONSIL"},
    {98, "NOSE_GOBLIN"},
    {99, "SUPER_BALL"},
    {100, "VIBRANT_BULB"},
    {101, "DIM_BULB"},
    {102, "FRAGMENTED_CARD"},
    {103, "EQUALITY"},
    {104, "WISH_BONE"},
    {105, "BAG_LUNCH"},
    {106, "LOST_CORK"},
    {107, "CROW_HEART"},
    {108, "WALNUT"},
    {109, "DUCT_TAPE"},
    {110, "SILVER_DOLLAR"},
    {111, "BLOODY_CROWN"},
    {112, "PAY_TO_WIN"},
    {113, "LOCUST_OF_WRATH"},
    {114, "LOCUST_OF_PESTILENCE"},
    {115, "LOCUST_OF_FAMINE"},
    {116, "LOCUST_OF_DEATH"},
    {117, "LOCUST_OF_CONQUEST"},
    {118, "BAT_WING"},
    {119, "STEM_CELL"},
    {120, "HAIRPIN"},
    {121, "WOODEN_CROSS"},
    {122, "BUTTER"},
    {123, "FILIGREE_FEATHERS"},
    {124, "DOOR_STOP"},
    {125, "EXTENSION_CORD"},
    {126, "ROTTEN_PENNY"},
    {127, "BABY_BENDER"},
    {128, "FINGER_BONE"},
    {129, "JAW_BREAKER"},
    {130, "CHEWED_PEN"},
    {131, "BLESSED_PENNY"},
    {132, "BROKEN_SYRINGE"},
    {133, "SHORT_FUSE"},
    {134, "GIGANTE_BEAN"},
    {135, "LIGHTER"},
    {136, "BROKEN_PADLOCK"},
    {137, "MYOSOTIS"},
    {138, "M"},
    {139, "TEARDROP_CHARM"},
    {140, "APPLE_OF_SODOM"},
    {141, "FORGOTTEN_LULLABY"},
    {142, "BETHS_FAITH"},
    {143, "OLD_CAPACITOR"},
    {144, "BRAIN_WORM"},
    {145, "PERFECTION"},
    {146, "DEVILS_CROWN"},
    {147, "CHARGED_PENNY"},
    {148, "FRIENDSHIP_NECKLACE"},
    {149, "PANIC_BUTTON"},
    {150, "BLUE_KEY"},
    {151, "FLAT_FILE"},
    {152, "TELESCOPE_LENS"},
    {153, "MOMS_LOCK"},
    {154, "DICE_BAG"},
    {155, "HOLY_CROWN"},
    {156, "MOTHERS_KISS"},
    {157, "TORN_CARD"},
    {158, "TORN_POCKET"},
    {159, "GILDED_KEY"},
    {160, "LUCKY_SACK"},
    {161, "WICKED_CROWN"},
    {162, "AZAZELS_STUMP"},
    {163, "DINGLE_BERRY"},
    {164, "RING_CAP"},
    {165, "NUH_UH"},
    {166, "MODELING_CLAY"},
    {167, "POLISHED_BONE"},
    {168, "HOLLOW_HEART"},
    {169, "KIDS_DRAWING"},
    {170, "CRYSTAL_KEY"},
    {171, "KEEPERS_BARGAIN"},
    {172, "CURSED_PENNY"},
    {173, "YOUR_SOUL"},
    {174, "NUMBER_MAGNET"},
    {175, "STRANGE_KEY"},
    {176, "LIL_CLOT"},
    {177, "TEMPORARY_TATTOO"},
    {178, "SWALLOWED_M"},
    {179, "RC_REMOTE"},
    {180, "FOUND_SOUL"},
    {181, "EXPANSION_PACK"},
    {182, "BETHS_ESSENCE"},
    {183, "THE_TWINS"},
    {184, "ADOPTION_PAPERS"},
    {185, "CRICKET_LEG"},
    {186, "APOLLYONS_BEST_FRIEND"},
    {187, "BROKEN_GLASSES"},
    {188, "ICE_CUBE"},
    {189, "SIGIL_OF_BAPHOMET"},
    {190, "NUM_TRINKETS"}
}

-- Linear search, easy to code but inefficient
function Trinkets:GetTrinketNameById(id)
    if id > 0 and id < TrinketType.NUM_TRINKETS then

        local i = 1
        while i <= TrinketType.NUM_TRINKETS do

            local trinket = Trinkets[i]
            if trinket[__ID] == id then
                return trinket[__NAME]
            end
    
            i = i + 1
        end
    end

    return ""
end

