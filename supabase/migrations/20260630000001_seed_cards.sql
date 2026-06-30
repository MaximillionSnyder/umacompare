INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_kitasan_black',
  'Kitasan Black',
  'Road to the Top',
  'cards/kitasan_black.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":25,"mood_effect":30,"power_bonus":4,"initial_bond":35,"specialty_priority":65}'::jsonb,
  '["Speed Star","Black Thunder"]'::jsonb,
  'Increases speed training appearance rate by 20%'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_super_creek',
  'Super Creek',
  'Creek of Miracles',
  'cards/super_creek.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":22,"initial_stamina":35,"initial_bond":30,"stamina_bonus":4,"wit_recovery":25}'::jsonb,
  '["Endurance Star","Miracle Creek"]'::jsonb,
  'Recovers energy when training on Wit facility'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_gold_ship',
  'Gold Ship',
  'Golden Voyage',
  'cards/gold_ship.png',
  'speed',
  'ssr',
  '{"friendship_bonus":40,"training_effectiveness":10,"mood_effect":20,"initial_bond":20,"event_effectiveness":35,"speed_bonus":3,"stamina_bonus":3,"power_bonus":3,"guts_bonus":3,"wit_bonus":3}'::jsonb,
  '["Golden Ship","Voyager"]'::jsonb,
  '+3 all stats, +10 energy recovery per event'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_silence_suzuka',
  'Silence Suzuka',
  'Silent Star',
  'cards/silence_suzuka.png',
  'speed',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":32,"initial_speed":30,"specialty_priority":65,"speed_bonus":5}'::jsonb,
  '["Silent Star","Escape Velocity"]'::jsonb,
  'Increases escape ability training effect'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_fine_motion',
  'Fine Motion',
  'Elegant Dancer',
  'cards/fine_motion.png',
  'power',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":25,"power_bonus":4,"initial_bond":30,"race_bonus":15,"hint_levels":3}'::jsonb,
  '["Power Dancer","Elegant Move"]'::jsonb,
  'Increases Power training effect during races'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_tokai_teio',
  'Tokai Teio',
  'Miracle Run',
  'cards/tokai_teio.png',
  'guts',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":28,"mood_effect":60,"race_bonus":10,"fan_bonus":20,"guts_bonus":4}'::jsonb,
  '["Miracle Run","Last Spurt Hero"]'::jsonb,
  'Increases last spurt performance dramatically'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_nice_nature',
  'Nice Nature',
  'Third Time''s the Charm',
  'cards/nice_nature.png',
  'friend',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"initial_bond":25,"mood_effect":15,"event_effectiveness":25}'::jsonb,
  '["Lucky Break","Determination"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mejiro_mcqueen',
  'Mejiro McQueen',
  'Elegant Master',
  'cards/mejiro_mcqueen.png',
  'wit',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":25,"skill_pt_bonus":60,"hint_levels":3,"wit_bonus":5,"initial_wit":30}'::jsonb,
  '["Master''s Wisdom","Elegant Strategy"]'::jsonb,
  'Increases Skill Point gain by 60'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_daiwa_scarlet',
  'Daiwa Scarlet',
  'Scarlet Sky',
  'cards/daiwa_scarlet.png',
  'power',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":30,"power_bonus":4,"initial_bond":30,"hint_levels":3,"hint_frequency":40}'::jsonb,
  '["Scarlet Runner","Sky High"]'::jsonb,
  'Increases hint appearance rate significantly'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_rice_shower',
  'Rice Shower',
  'Blue Rose',
  'cards/rice_shower.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":20,"initial_stamina":30,"stamina_bonus":6,"specialty_priority":65,"initial_bond":30}'::jsonb,
  '["Blue Rose","Endurance Champion"]'::jsonb,
  'Increases long distance race effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_king_halo',
  'King Halo',
  'King''s Pride',
  'cards/king_halo.png',
  'speed',
  'sr',
  '{"friendship_bonus":20,"training_effectiveness":15,"initial_speed":15,"hint_levels":2}'::jsonb,
  '["Royal Speed","King''s Dash"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_grass_wonder',
  'Grass Wonder',
  'Wonder Charge',
  'cards/grass_wonder.png',
  'guts',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":27,"guts_bonus":5,"initial_guts":30,"initial_bond":25,"race_bonus":15}'::jsonb,
  '["Wonder Guts","Charge Up"]'::jsonb,
  'Increases rain race performance'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_symboli_rudolf',
  'Symboli Rudolf',
  'Emperor''s Road',
  'cards/symboli_rudolf.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":38,"training_effectiveness":25,"initial_stamina":35,"stamina_bonus":5,"wit_recovery":30,"specialty_priority":65}'::jsonb,
  '["Emperor''s Stamina","Royal Endurance"]'::jsonb,
  'Increases energy recovery after Wit training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_sweep_tosho',
  'Sweep Tosho',
  'Sweeper',
  'cards/sweep_tosho.png',
  'speed',
  'sr',
  '{"friendship_bonus":21,"training_effectiveness":17,"initial_speed":20,"speed_bonus":3}'::jsonb,
  '["Speed Sweep","Clean Run"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mihono_bourbon',
  'Mihono Bourbon',
  'Cyborg',
  'cards/mihono_bourbon.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":28,"mood_effect":40,"initial_stamina":30,"stamina_bonus":5,"initial_bond":30}'::jsonb,
  '["Cyborg Runner","Pace Keeper"]'::jsonb,
  'Increases pace-keeping ability'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_narita_brian',
  'Narita Brian',
  'Shadow Roll',
  'cards/narita_brian.png',
  'power',
  'ssr',
  '{"friendship_bonus":40,"training_effectiveness":35,"power_bonus":6,"initial_bond":25,"hint_levels":3,"race_bonus":15}'::jsonb,
  '["Shadow Roll","Power Dash"]'::jsonb,
  'Highest training effectiveness for Power type'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_tamamo_cross',
  'Tamamo Cross',
  'Cross Attack',
  'cards/tamamo_cross.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":20,"initial_stamina":30,"initial_bond":35,"hint_levels":3,"stamina_bonus":5}'::jsonb,
  '["Cross Stamina","Fox Run"]'::jsonb,
  'High initial bond for fast friendship training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_twin_turbo',
  'Twin Turbo',
  'Turbo Engine',
  'cards/twin_turbo.png',
  'guts',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":35,"initial_guts":30,"guts_bonus":4,"race_bonus":10,"hint_frequency":35}'::jsonb,
  '["Turbo Dash","Last Guts"]'::jsonb,
  'Highest training effectiveness for Guts type'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_air_groove',
  'Air Groove',
  'Empress',
  'cards/air_groove.png',
  'wit',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":22,"skill_pt_bonus":50,"wit_bonus":6,"initial_wit":30,"hint_levels":3}'::jsonb,
  '["Empress Wisdom","Strategic Mind"]'::jsonb,
  'Increases Skill Point gain +50'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_el_condor_pasa',
  'El Condor Pasa',
  'Condor Flight',
  'cards/el_condor_pasa.png',
  'power',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":29,"power_bonus":4,"initial_bond":30,"race_bonus":15,"fan_bonus":15}'::jsonb,
  '["Condor Flight","Power Surge"]'::jsonb,
  'Increases race bonus and fan gain'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_special_week',
  'Special Week',
  'Made for the Turf',
  'cards/special_week.png',
  'speed',
  'ssr',
  '{"friendship_bonus":38,"training_effectiveness":30,"initial_speed":35,"speed_bonus":5,"specialty_priority":70,"initial_bond":25}'::jsonb,
  '["Special Speed","Weekend Runner"]'::jsonb,
  'Increases speed training effectiveness by 30%'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_maruzensky',
  'Maruzensky',
  'Mr. Civilian',
  'cards/maruzensky.png',
  'speed',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":25,"initial_speed":25,"hint_levels":3,"hint_frequency":45,"speed_bonus":4}'::jsonb,
  '["Civilian Dash","Speed Master"]'::jsonb,
  'Increases hint frequency for speed skills'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_oguri_cap',
  'Oguri Cap',
  'The Living Legend',
  'cards/oguri_cap.png',
  'power',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":28,"power_bonus":5,"initial_bond":30,"race_bonus":20,"fan_bonus":20}'::jsonb,
  '["Legendary Power","Cap''s Charge"]'::jsonb,
  'Increases race and fan bonuses by 20%'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_tm_opera_o',
  'T.M. Opera O',
  'Opera King',
  'cards/tm_opera_o.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":24,"initial_stamina":35,"stamina_bonus":5,"mood_effect":30,"initial_bond":30}'::jsonb,
  '["Opera''s Stamina","Royal Melody"]'::jsonb,
  'Increases stamina training appearance rate'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_mejiro_ryan',
  'Mejiro Ryan',
  'Turbulent Wind',
  'cards/mejiro_ryan.png',
  'speed',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":16,"initial_speed":18,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Wind Runner","Speed Burst"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_narita_taishin',
  'Narita Taishin',
  'Shining Star',
  'cards/narita_taishin.png',
  'guts',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":10,"initial_guts":10,"guts_bonus":2}'::jsonb,
  '["Guts Shine"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_seeking_the_pearl',
  'Seeking the Pearl',
  'Pearl Diver',
  'cards/seeking_the_pearl.png',
  'wit',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":25,"skill_pt_bonus":55,"hint_levels":3,"wit_bonus":5,"initial_wit":30}'::jsonb,
  '["Pearl Strategy","Diver''s Insight"]'::jsonb,
  'Increases Skill Point gain by 55'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_biwa_hayahide',
  'Biwa Hayahide',
  'Divine Wind',
  'cards/biwa_hayahide.png',
  'speed',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":28,"initial_speed":30,"speed_bonus":5,"specialty_priority":65,"mood_effect":25}'::jsonb,
  '["Divine Wind","Swift Strike"]'::jsonb,
  'Increases early speed training efficiency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mayano_top_gun',
  'Mayano Top Gun',
  'Top Gun',
  'cards/mayano_top_gun.png',
  'power',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":30,"power_bonus":5,"initial_bond":28,"race_bonus":12,"hint_levels":2}'::jsonb,
  '["Top Gun","Maverick Power"]'::jsonb,
  'Increases target race effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_hishi_amazon',
  'Hishi Amazon',
  'Amazon''s Roar',
  'cards/hishi_amazon.png',
  'guts',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":26,"guts_bonus":5,"initial_guts":28,"initial_bond":30,"hint_frequency":30}'::jsonb,
  '["Amazon Roar","Spirit Charge"]'::jsonb,
  'Recovers energy when training Guts'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_eishin_flash',
  'Eishin Flash',
  'Flash of Light',
  'cards/eishin_flash.png',
  'speed',
  'sr',
  '{"friendship_bonus":24,"training_effectiveness":18,"initial_speed":20,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Flash Speed","Light Dash"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mejiro_dober',
  'Mejiro Dober',
  'Dober''s Pride',
  'cards/mejiro_dober.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":23,"initial_stamina":30,"stamina_bonus":5,"initial_bond":32,"wit_recovery":30}'::jsonb,
  '["Dober''s Stamina","Prideful Endurance"]'::jsonb,
  'Recovers energy with Wit training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_ines_fujin',
  'Ines Fujin',
  'Storm Wind',
  'cards/ines_fujin.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"initial_speed":28,"speed_bonus":5,"mood_effect":30,"initial_bond":25}'::jsonb,
  '["Storm Runner","Gale Force"]'::jsonb,
  'Increases mood effect for speed training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_neo_universe',
  'Neo Universe',
  'Cosmic Dream',
  'cards/neo_universe.png',
  'wit',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":24,"skill_pt_bonus":60,"hint_levels":3,"wit_bonus":6,"hint_frequency":40}'::jsonb,
  '["Cosmic Wisdom","Star Gaze"]'::jsonb,
  'Increases skill hints and levels'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_admire_vega',
  'Admire Vega',
  'Northern Star',
  'cards/admire_vega.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":26,"initial_stamina":32,"stamina_bonus":5,"specialty_priority":68,"initial_bond":28}'::jsonb,
  '["Vega''s Endurance","North Star Run"]'::jsonb,
  'Increases specialty priority for stamina'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_agnes_tachyon',
  'Agnes Tachyon',
  'Tachyon Burst',
  'cards/agnes_tachyon.png',
  'power',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":32,"power_bonus":6,"initial_bond":25,"hint_levels":3,"hint_frequency":35}'::jsonb,
  '["Tachyon Burst","Particle Charge"]'::jsonb,
  'Highest power training efficiency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_narita_top_road',
  'Narita Top Road',
  'Pinnacle Path',
  'cards/narita_top_road.png',
  'guts',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":30,"guts_bonus":5,"initial_guts":30,"race_bonus":15,"fan_bonus":15}'::jsonb,
  '["Top Road","Guts Climber"]'::jsonb,
  'Increases race and fan gain for Guts'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_manhattan_cafe',
  'Manhattan Cafe',
  'Midnight Brew',
  'cards/manhattan_cafe.png',
  'wit',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":22,"skill_pt_bonus":50,"hint_levels":3,"wit_bonus":5,"wit_recovery":30,"initial_wit":28}'::jsonb,
  '["Cafe Wisdom","Midnight Strategy"]'::jsonb,
  'Recovers energy during Wit training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_zenno_rob_roy',
  'Zenno Rob Roy',
  'Steel Heart',
  'cards/zenno_rob_roy.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":25,"initial_stamina":33,"stamina_bonus":5,"mood_effect":25,"initial_bond":30}'::jsonb,
  '["Steel Heart","Roy''s Stamina"]'::jsonb,
  'Increases mood stability during training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_copano_rickey',
  'Copano Rickey',
  'Fierce Spirit',
  'cards/copano_rickey.png',
  'power',
  'sr',
  '{"friendship_bonus":23,"training_effectiveness":19,"power_bonus":3,"initial_bond":22,"hint_levels":2}'::jsonb,
  '["Fierce Power","Ricky''s Charge"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_wonder_acute',
  'Wonder Acute',
  'Acute Mind',
  'cards/wonder_acute.png',
  'wit',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":26,"skill_pt_bonus":50,"hint_levels":4,"wit_bonus":5,"initial_wit":30}'::jsonb,
  '["Acute Mind","Wonder Wisdom"]'::jsonb,
  'Increases hint level by 4'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_vermilion',
  'Vermilion',
  'Crimson Flame',
  'cards/vermilion.png',
  'power',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"power_bonus":5,"initial_bond":30,"race_bonus":18,"fan_bonus":18}'::jsonb,
  '["Crimson Flame","Vermilion Charge"]'::jsonb,
  'Increases race performance significantly'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_gold_city',
  'Gold City',
  'Golden Street',
  'cards/gold_city.png',
  'speed',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":27,"initial_speed":28,"speed_bonus":4,"hint_frequency":40,"hint_levels":3}'::jsonb,
  '["Golden Sprint","City Dash"]'::jsonb,
  'Increases hint frequency for speed'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_sakura_bakushin_o',
  'Sakura Bakushin O',
  'Explosive Speed',
  'cards/sakura_bakushin_o.png',
  'speed',
  'ssr',
  '{"friendship_bonus":40,"training_effectiveness":25,"initial_speed":35,"speed_bonus":6,"specialty_priority":70,"initial_bond":20}'::jsonb,
  '["Bakushin Dash","Sakura Storm"]'::jsonb,
  'Highest speed stat bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_taiki_shuttle',
  'Taiki Shuttle',
  'Shuttle Run',
  'cards/taiki_shuttle.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":29,"initial_speed":30,"speed_bonus":5,"initial_bond":28,"mood_effect":30}'::jsonb,
  '["Shuttle Speed","Taiki Flight"]'::jsonb,
  'Increases training effectiveness for speed'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_fuji_kiseki',
  'Fuji Kiseki',
  'Mt. Fuji''s Miracle',
  'cards/fuji_kiseki.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":27,"initial_stamina":32,"stamina_bonus":5,"mood_effect":35,"initial_bond":25}'::jsonb,
  '["Fuji''s Miracle","Mountain Endurance"]'::jsonb,
  'Increases stamina training effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_bubble_gum_joke',
  'Bubble Gum Joke',
  'Sweet Comedy',
  'cards/bubble_gum_joke.png',
  'friend',
  'sr',
  '{"friendship_bonus":20,"training_effectiveness":15,"mood_effect":20,"initial_bond":20,"event_effectiveness":30}'::jsonb,
  '["Sweet Joke","Bubble Laugh"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_heiden',
  'Heiden',
  'Hidden Power',
  'cards/heiden.png',
  'guts',
  'r',
  '{"friendship_bonus":12,"training_effectiveness":10,"initial_guts":12,"guts_bonus":2}'::jsonb,
  '["Hidden Power"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_astromon',
  'Astromon',
  'Star Walker',
  'cards/astromon.png',
  'guts',
  'ssr',
  '{"friendship_bonus":29,"training_effectiveness":33,"guts_bonus":5,"initial_guts":30,"race_bonus":12,"hint_frequency":30}'::jsonb,
  '["Star Walker","Astromon Guts"]'::jsonb,
  'Increases training effectiveness for Guts'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_hishi_akebono',
  'Hishi Akebono',
  'Dawn Runner',
  'cards/hishi_akebono.png',
  'power',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":17,"power_bonus":3,"initial_bond":20,"race_bonus":10}'::jsonb,
  '["Dawn Charge","Akebono Power"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_yamanin_zephyr',
  'Yamanin Zephyr',
  'Gentle Breeze',
  'cards/yamanin_zephyr.png',
  'friend',
  'ssr',
  '{"friendship_bonus":25,"training_effectiveness":20,"initial_bond":40,"mood_effect":30,"event_effectiveness":30,"wit_recovery":20}'::jsonb,
  '["Zephyr''s Cheer","Breeze Support"]'::jsonb,
  'Increases initial bond by 40 for fast friendship'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_matikane_tannhauser',
  'Matikane Tannhauser',
  'Iron Will',
  'cards/matikane_tannhauser.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":24,"initial_stamina":35,"stamina_bonus":6,"specialty_priority":65,"initial_bond":28}'::jsonb,
  '["Iron Will","Tannhauser Stamina"]'::jsonb,
  'Increases stamina bonus significantly'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_sakura_laurel',
  'Sakura Laurel',
  'Laurel Wreath',
  'cards/sakura_laurel.png',
  'speed',
  'sr',
  '{"friendship_bonus":21,"training_effectiveness":16,"initial_speed":18,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Laurel Dash","Sakura Sprint"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_narita_brian_alt',
  'Narita Brian',
  'Blazing Soul',
  'cards/narita_brian_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":38,"training_effectiveness":33,"power_bonus":5,"initial_bond":30,"race_bonus":20,"fan_bonus":20}'::jsonb,
  '["Blazing Power","Soul Charge"]'::jsonb,
  'Critical power training boost'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_meisho_doto',
  'Meisho Doto',
  'Doto''s Poem',
  'cards/meisho_doto.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":22,"initial_stamina":30,"stamina_bonus":4,"hint_levels":3,"wit_recovery":25}'::jsonb,
  '["Poetic Endurance","Doto''s Rhythm"]'::jsonb,
  'Increases hint level for stamina skills'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_daitaku_helios',
  'Daitaku Helios',
  'Sun Runner',
  'cards/daitaku_helios.png',
  'speed',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":26,"initial_speed":30,"speed_bonus":5,"mood_effect":35,"initial_bond":25}'::jsonb,
  '["Helios Dash","Sunlight Sprint"]'::jsonb,
  'Increases mood effect for speed training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_win_variation',
  'Win Variation',
  'Victory Dance',
  'cards/win_variation.png',
  'friend',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":16,"initial_bond":25,"mood_effect":20,"event_effectiveness":25}'::jsonb,
  '["Victory Dance","Win Cheer"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_satono_diamond',
  'Satono Diamond',
  'Diamond Princess',
  'cards/satono_diamond.png',
  'power',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"power_bonus":5,"initial_bond":32,"hint_levels":3,"hint_frequency":35}'::jsonb,
  '["Diamond Power","Princess Charge"]'::jsonb,
  'Increases hint probability for power skills'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_kitasan_black_alt',
  'Kitasan Black',
  'Northern Ace',
  'cards/kitasan_black_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":28,"initial_speed":32,"speed_bonus":5,"specialty_priority":70,"initial_bond":30}'::jsonb,
  '["Northern Ace","Black Flash"]'::jsonb,
  'Increased speed specialty priority'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_duramante',
  'Duramente',
  'Durable Heart',
  'cards/duramante.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":26,"initial_stamina":35,"stamina_bonus":5,"initial_bond":30,"wit_recovery":30}'::jsonb,
  '["Durable Heart","Iron Lung"]'::jsonb,
  'Increases stamina recovery efficiency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_sound_barrier',
  'Sound Barrier',
  'Sonic Boom',
  'cards/sound_barrier.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":30,"initial_speed":30,"speed_bonus":5,"hint_levels":3,"hint_frequency":35}'::jsonb,
  '["Sonic Boom","Sound Dash"]'::jsonb,
  'Increases speed skill hint frequency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_air_spinel',
  'Air Spinel',
  'Crystal Wind',
  'cards/air_spinel.png',
  'wit',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":25,"skill_pt_bonus":55,"hint_levels":3,"wit_bonus":6,"initial_wit":32}'::jsonb,
  '["Crystal Strategy","Spinel Wisdom"]'::jsonb,
  'Increases skill point and wit bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_mejiro_mcqueen_alt',
  'Mejiro McQueen',
  'Elegant Lady',
  'cards/mejiro_mcqueen_alt.png',
  'wit',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"initial_wit":20,"wit_bonus":3,"hint_levels":2}'::jsonb,
  '["Elegant Grace","McQueen''s Wisdom"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_oguri_cap_alt',
  'Oguri Cap',
  'Legendary Ace',
  'cards/oguri_cap_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":38,"training_effectiveness":30,"power_bonus":6,"initial_bond":28,"race_bonus":20,"fan_bonus":25}'::jsonb,
  '["Legendary Ace","Cap''s Power"]'::jsonb,
  'Highest fan gain for Power type'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_tokai_teio_alt',
  'Tokai Teio',
  'Miracle Child',
  'cards/tokai_teio_alt.png',
  'guts',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_guts":15,"guts_bonus":2}'::jsonb,
  '["Miracle Guts"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_special_week_alt',
  'Special Week',
  'Turf Queen',
  'cards/special_week_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":28,"initial_speed":32,"speed_bonus":5,"specialty_priority":68,"initial_bond":28}'::jsonb,
  '["Turf Queen","Weekend Special"]'::jsonb,
  'Increases turf race performance'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mihono_bourbon_alt',
  'Mihono Bourbon',
  'Perfect Machine',
  'cards/mihono_bourbon_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":28,"initial_stamina":32,"stamina_bonus":5,"mood_effect":35,"initial_bond":30}'::jsonb,
  '["Perfect Machine","Bourbon System"]'::jsonb,
  'Increases training consistency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_el_condor_pasa_alt',
  'El Condor Pasa',
  'Soaring Eagle',
  'cards/el_condor_pasa_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"power_bonus":5,"initial_bond":28,"race_bonus":18,"fan_bonus":18}'::jsonb,
  '["Soaring Eagle","Condor Power"]'::jsonb,
  'Increases race effectiveness for Power'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_rice_shower_alt',
  'Rice Shower',
  'Gentle Rain',
  'cards/rice_shower_alt.png',
  'stamina',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":17,"initial_stamina":20,"stamina_bonus":3,"initial_bond":20}'::jsonb,
  '["Gentle Rain","Rice''s Support"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_tamamo_cross_alt',
  'Tamamo Cross',
  'Nine-Tailed Fox',
  'cards/tamamo_cross_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":24,"initial_stamina":32,"initial_bond":35,"stamina_bonus":5,"hint_levels":3}'::jsonb,
  '["Nine-Tails","Fox Flame"]'::jsonb,
  'High bond gain for stamina training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_gold_ship_alt',
  'Gold Ship',
  'Golden Trickster',
  'cards/gold_ship_alt.png',
  'speed',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_speed":15,"speed_bonus":2}'::jsonb,
  '["Trickster Run"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_silence_suzuka_alt',
  'Silence Suzuka',
  'Silent Night',
  'cards/silence_suzuka_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":30,"initial_speed":30,"speed_bonus":5,"specialty_priority":68,"mood_effect":30}'::jsonb,
  '["Silent Night","Escape Dream"]'::jsonb,
  'Increases escape ability effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_maruzensky_alt',
  'Maruzensky',
  'Free Spirit',
  'cards/maruzensky_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":26,"initial_speed":28,"hint_levels":3,"hint_frequency":50,"speed_bonus":4}'::jsonb,
  '["Free Spirit","Civilian Run"]'::jsonb,
  'Highest hint frequency for speed'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_grass_wonder_alt',
  'Grass Wonder',
  'Green Flash',
  'cards/grass_wonder_alt.png',
  'guts',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":28,"guts_bonus":5,"initial_guts":30,"race_bonus":15,"hint_frequency":35}'::jsonb,
  '["Green Flash","Grass Sprint"]'::jsonb,
  'Increases training effectiveness for Guts'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_air_groove_alt',
  'Air Groove',
  'Royal Empress',
  'cards/air_groove_alt.png',
  'wit',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":24,"skill_pt_bonus":55,"wit_bonus":6,"initial_wit":32,"hint_levels":3}'::jsonb,
  '["Royal Wisdom","Empress Strategy"]'::jsonb,
  'High skill point gain for Wit'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_fine_motion_alt',
  'Fine Motion',
  'Graceful Dance',
  'cards/fine_motion_alt.png',
  'power',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"power_bonus":3,"initial_bond":22,"hint_levels":2}'::jsonb,
  '["Graceful Dance","Fine Power"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_neptune',
  'Neptune',
  'Ocean King',
  'cards/neptune.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":26,"initial_stamina":34,"stamina_bonus":5,"wit_recovery":35,"initial_bond":28}'::jsonb,
  '["Ocean King","Tidal Wave"]'::jsonb,
  'Increases Wit recovery after stamina training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_jupiter',
  'Jupiter',
  'Thunder God',
  'cards/jupiter.png',
  'power',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":31,"power_bonus":6,"initial_bond":26,"race_bonus":15,"hint_levels":3}'::jsonb,
  '["Thunder God","Jupiter''s Bolt"]'::jsonb,
  'Increases power training effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_venus',
  'Venus',
  'Lovely Star',
  'cards/venus.png',
  'friend',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":22,"initial_bond":38,"mood_effect":35,"event_effectiveness":30,"wit_recovery":25}'::jsonb,
  '["Venus Love","Star Support"]'::jsonb,
  'High friendship and mood effect'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_saturn',
  'Saturn',
  'Ring of Light',
  'cards/saturn.png',
  'wit',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":24,"skill_pt_bonus":58,"hint_levels":3,"wit_bonus":6,"initial_wit":30}'::jsonb,
  '["Ring Strategy","Saturn Wisdom"]'::jsonb,
  'Increases skill point gain by 58'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mercury',
  'Mercury',
  'Swift Wing',
  'cards/mercury.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"initial_speed":33,"speed_bonus":5,"specialty_priority":68,"initial_bond":26}'::jsonb,
  '["Swift Wing","Mercury Dash"]'::jsonb,
  'Increased speed training priority'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mars',
  'Mars',
  'Red Planet',
  'cards/mars.png',
  'guts',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":30,"guts_bonus":5,"initial_guts":32,"race_bonus":15,"fan_bonus":20}'::jsonb,
  '["Red Planet","Mars Charge"]'::jsonb,
  'Increases guts and fan bonuses'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_tsurumaru_miracle',
  'Tsurumaru Miracle',
  'Wonder Boy',
  'cards/tsurumaru_miracle.png',
  'speed',
  'sr',
  '{"friendship_bonus":23,"training_effectiveness":18,"initial_speed":20,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Miracle Runner","Tsurumaru Dash"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mejiro_arnold',
  'Mejiro Arnold',
  'Iron Horse',
  'cards/mejiro_arnold.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":25,"initial_stamina":33,"stamina_bonus":5,"mood_effect":30,"specialty_priority":65}'::jsonb,
  '["Iron Horse","Arnold Endurance"]'::jsonb,
  'Increases stamina specialty appearance'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_mejiro_alden',
  'Mejiro Alden',
  'Forest Runner',
  'cards/mejiro_alden.png',
  'speed',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_speed":14,"speed_bonus":2}'::jsonb,
  '["Forest Run"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mejiro_palma',
  'Mejiro Palma',
  'Palm Tree',
  'cards/mejiro_palma.png',
  'friend',
  'ssr',
  '{"friendship_bonus":26,"training_effectiveness":20,"initial_bond":35,"mood_effect":35,"event_effectiveness":30,"wit_recovery":25}'::jsonb,
  '["Palm Cheer","Tropical Support"]'::jsonb,
  'High event effectiveness for friend type'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_mejiro_espar',
  'Mejiro Espan',
  'Spanish Wind',
  'cards/mejiro_espan.png',
  'speed',
  'sr',
  '{"friendship_bonus":21,"training_effectiveness":16,"initial_speed":18,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Spanish Wind","Espan Sprint"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mejiro_arc',
  'Mejiro Arc',
  'Rainbow Bridge',
  'cards/mejiro_arc.png',
  'wit',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":24,"skill_pt_bonus":55,"hint_levels":3,"wit_bonus":5,"initial_wit":30}'::jsonb,
  '["Rainbow Strategy","Arc Mind"]'::jsonb,
  'Increases skill point gain for Wit'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_moon',
  'Miracle Moon',
  'Night Glow',
  'cards/miracle_moon.png',
  'power',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"power_bonus":5,"initial_bond":30,"race_bonus":18,"fan_bonus":18}'::jsonb,
  '["Night Glow","Moon Power"]'::jsonb,
  'Increases power training at night'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_sky',
  'Miracle Sky',
  'Blue Horizon',
  'cards/miracle_sky.png',
  'guts',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":32,"guts_bonus":5,"initial_guts":30,"race_bonus":12,"hint_frequency":35}'::jsonb,
  '["Blue Horizon","Sky Guts"]'::jsonb,
  'Higher training effectiveness for Guts'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_star',
  'Miracle Star',
  'Sparkle',
  'cards/miracle_star.png',
  'speed',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":17,"initial_speed":18,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Sparkle Run","Star Dash"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_rain',
  'Miracle Rain',
  'Rain Drop',
  'cards/miracle_rain.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":24,"initial_stamina":32,"stamina_bonus":5,"wit_recovery":30,"initial_bond":30}'::jsonb,
  '["Rain Drop","Miracle Endurance"]'::jsonb,
  'Recovers energy after stamina training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_bloom',
  'Miracle Bloom',
  'Flower Garden',
  'cards/miracle_bloom.png',
  'friend',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":20,"initial_bond":36,"mood_effect":35,"event_effectiveness":32,"wit_recovery":22}'::jsonb,
  '["Flower Cheer","Bloom Support"]'::jsonb,
  'High event effectiveness and bond'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_miracle_leaf',
  'Miracle Leaf',
  'Green Sprout',
  'cards/miracle_leaf.png',
  'guts',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":10,"initial_guts":12,"guts_bonus":2}'::jsonb,
  '["Leaf Guts"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_snow',
  'Miracle Snow',
  'White Winter',
  'cards/miracle_snow.png',
  'power',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"power_bonus":3,"initial_bond":22,"hint_levels":2}'::jsonb,
  '["White Power","Snow Charge"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_narita_top_road_alt',
  'Narita Top Road',
  'Summit',
  'cards/narita_top_road_alt.png',
  'guts',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":30,"guts_bonus":5,"initial_guts":30,"race_bonus":18,"fan_bonus":18}'::jsonb,
  '["Summit Guts","Top Climber"]'::jsonb,
  'Increases top-tier race performance'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_agnes_tachyon_alt',
  'Agnes Tachyon',
  'Quantum Leap',
  'cards/agnes_tachyon_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":38,"training_effectiveness":32,"power_bonus":6,"initial_bond":28,"hint_levels":3,"hint_frequency":38}'::jsonb,
  '["Quantum Leap","Tachyon Charge"]'::jsonb,
  'Highest power training efficiency with hints'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_manhattan_cafe_alt',
  'Manhattan Cafe',
  'Night Owl',
  'cards/manhattan_cafe_alt.png',
  'wit',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":24,"skill_pt_bonus":52,"hint_levels":3,"wit_bonus":5,"wit_recovery":35,"initial_wit":30}'::jsonb,
  '["Night Owl","Cafe Strategy"]'::jsonb,
  'Best Wit recovery for Wit training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_satono_diamond_alt',
  'Satono Diamond',
  'Jewel Princess',
  'cards/satono_diamond_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"power_bonus":5,"initial_bond":34,"hint_levels":3,"hint_frequency":35}'::jsonb,
  '["Jewel Princess","Diamond Charge"]'::jsonb,
  'High initial bond for power training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_satono_crown',
  'Satono Crown',
  'Royal Tiara',
  'cards/satono_crown.png',
  'wit',
  'sr',
  '{"friendship_bonus":21,"training_effectiveness":16,"initial_wit":18,"wit_bonus":3,"hint_levels":2}'::jsonb,
  '["Royal Tiara","Crown Wisdom"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_meisho_doto_alt',
  'Meisho Doto',
  'Autumn Leaves',
  'cards/meisho_doto_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":24,"initial_stamina":32,"stamina_bonus":5,"hint_levels":3,"wit_recovery":28}'::jsonb,
  '["Autumn Leaves","Doto''s Poem"]'::jsonb,
  'Increases hints for stamina'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_daitaku_helios_alt',
  'Daitaku Helios',
  'Sunbeam',
  'cards/daitaku_helios_alt.png',
  'speed',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_speed":14,"speed_bonus":2}'::jsonb,
  '["Sunbeam"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_symboli_rudolf_alt',
  'Symboli Rudolf',
  'Emperor''s March',
  'cards/symboli_rudolf_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":26,"initial_stamina":34,"stamina_bonus":5,"wit_recovery":30,"specialty_priority":68}'::jsonb,
  '["Emperor''s March","Royal Procession"]'::jsonb,
  'Increased specialty and stamina'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_biwa_hayahide_alt',
  'Biwa Hayahide',
  'Morning Breeze',
  'cards/biwa_hayahide_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"initial_speed":32,"speed_bonus":5,"specialty_priority":66,"mood_effect":28}'::jsonb,
  '["Morning Breeze","Biwa Wind"]'::jsonb,
  'Speed specialty and mood boost'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_hishi_amazon_alt',
  'Hishi Amazon',
  'Jungle Queen',
  'cards/hishi_amazon_alt.png',
  'guts',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":28,"guts_bonus":5,"initial_guts":30,"initial_bond":32,"hint_frequency":32}'::jsonb,
  '["Jungle Queen","Amazon Spirit"]'::jsonb,
  'Increases bond gain for Guts'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_admire_vega_alt',
  'Admire Vega',
  'Northern Lights',
  'cards/admire_vega_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":26,"initial_stamina":33,"stamina_bonus":5,"specialty_priority":68,"initial_bond":28}'::jsonb,
  '["Northern Lights","Vega''s Shine"]'::jsonb,
  'Enhanced stamina specialty priority'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_neutral_moon',
  'Neutral Moon',
  'Half Moon',
  'cards/neutral_moon.png',
  'friend',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":16,"initial_bond":25,"mood_effect":25,"event_effectiveness":25}'::jsonb,
  '["Half Moon","Neutral Cheer"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_copano_rickey_alt',
  'Copano Rickey',
  'Wild Spirit',
  'cards/copano_rickey_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"power_bonus":5,"initial_bond":28,"race_bonus":18,"hint_levels":3}'::jsonb,
  '["Wild Spirit","Ricky Burst"]'::jsonb,
  'Increases power race effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_daiwa_scarlet_alt',
  'Daiwa Scarlet',
  'Scarlet Blaze',
  'cards/daiwa_scarlet_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"power_bonus":5,"initial_bond":30,"hint_levels":3,"hint_frequency":42}'::jsonb,
  '["Scarlet Blaze","Blaze Runner"]'::jsonb,
  'High hint frequency for power'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_king_halo_alt',
  'King Halo',
  'Royal Coronation',
  'cards/king_halo_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":27,"initial_speed":30,"speed_bonus":5,"hint_levels":3,"hint_frequency":40}'::jsonb,
  '["Royal Coronation","King''s Sprint"]'::jsonb,
  'Speed training with high hint rate'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_narita_brian_alt2',
  'Narita Brian',
  'Wild Flame',
  'cards/narita_brian_alt2.png',
  'power',
  'sr',
  '{"friendship_bonus":24,"training_effectiveness":20,"power_bonus":3,"initial_bond":22,"hint_levels":2}'::jsonb,
  '["Wild Flame","Brian Power"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_taiki_shuttle_alt',
  'Taiki Shuttle',
  'Space Run',
  'cards/taiki_shuttle_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":29,"initial_speed":32,"speed_bonus":5,"initial_bond":30,"mood_effect":32}'::jsonb,
  '["Space Run","Shuttle Boost"]'::jsonb,
  'High speed training with mood'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_sakura_bakushin_o_alt',
  'Sakura Bakushin O',
  'Cherry Bomb',
  'cards/sakura_bakushin_o_alt.png',
  'speed',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_speed":16,"speed_bonus":2}'::jsonb,
  '["Cherry Bomb"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_fuji_kiseki_alt',
  'Fuji Kiseki',
  'Sacred Peak',
  'cards/fuji_kiseki_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":26,"initial_stamina":33,"stamina_bonus":5,"mood_effect":35,"initial_bond":28}'::jsonb,
  '["Sacred Peak","Fuji Summit"]'::jsonb,
  'Mood and stamina training boost'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_gold_city_alt',
  'Gold City',
  'Golden Rush',
  'cards/gold_city_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":28,"initial_speed":30,"speed_bonus":4,"hint_frequency":42,"hint_levels":3}'::jsonb,
  '["Golden Rush","City Sprint"]'::jsonb,
  'High speed hint frequency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_seeking_the_pearl_alt',
  'Seeking the Pearl',
  'Deep Diver',
  'cards/seeking_the_pearl_alt.png',
  'wit',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":25,"skill_pt_bonus":58,"hint_levels":3,"wit_bonus":5,"initial_wit":32}'::jsonb,
  '["Deep Diver","Pearl Wisdom"]'::jsonb,
  'High skill point gain'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_wonder_acute_alt',
  'Wonder Acute',
  'Brilliant Mind',
  'cards/wonder_acute_alt.png',
  'wit',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":26,"skill_pt_bonus":52,"hint_levels":4,"wit_bonus":5,"initial_wit":30}'::jsonb,
  '["Brilliant Mind","Acute Wisdom"]'::jsonb,
  'Highest hint level for Wit'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_vermilion_alt',
  'Vermilion',
  'Red Sunset',
  'cards/vermilion_alt.png',
  'power',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"power_bonus":3,"initial_bond":22,"race_bonus":12}'::jsonb,
  '["Red Sunset","Vermilion Power"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_yamanin_zephyr_alt',
  'Yamanin Zephyr',
  'Spring Wind',
  'cards/yamanin_zephyr_alt.png',
  'friend',
  'ssr',
  '{"friendship_bonus":26,"training_effectiveness":22,"initial_bond":38,"mood_effect":32,"event_effectiveness":32,"wit_recovery":22}'::jsonb,
  '["Spring Wind","Zephyr Support"]'::jsonb,
  'High event and mood effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_matikane_tannhauser_alt',
  'Matikane Tannhauser',
  'Iron Wall',
  'cards/matikane_tannhauser_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":25,"initial_stamina":35,"stamina_bonus":6,"specialty_priority":66,"initial_bond":28}'::jsonb,
  '["Iron Wall","Tannhauser Guard"]'::jsonb,
  'Highest stamina bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_twin_turbo_alt',
  'Twin Turbo',
  'Dual Engine',
  'cards/twin_turbo_alt.png',
  'guts',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":20,"initial_guts":20,"guts_bonus":3,"race_bonus":10}'::jsonb,
  '["Dual Engine","Turbo Spirit"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_sweep_tosho_alt',
  'Sweep Tosho',
  'Clean Sweep',
  'cards/sweep_tosho_alt.png',
  'speed',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_speed":14,"speed_bonus":2}'::jsonb,
  '["Clean Sweep"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_zenno_rob_roy_alt',
  'Zenno Rob Roy',
  'Iron Heart',
  'cards/zenno_rob_roy_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":26,"initial_stamina":34,"stamina_bonus":5,"mood_effect":28,"initial_bond":30}'::jsonb,
  '["Iron Heart","Roy''s Will"]'::jsonb,
  'Stamina training with mood stability'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_sound_barrier_alt',
  'Sound Barrier',
  'Supersonic',
  'cards/sound_barrier_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"initial_speed":32,"speed_bonus":5,"hint_levels":3,"hint_frequency":38}'::jsonb,
  '["Supersonic","Sound Boost"]'::jsonb,
  'High speed hint rate'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_air_spinel_alt',
  'Air Spinel',
  'Gem Wind',
  'cards/air_spinel_alt.png',
  'wit',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":26,"skill_pt_bonus":55,"hint_levels":3,"wit_bonus":6,"initial_wit":32}'::jsonb,
  '["Gem Wind","Spinel Strategy"]'::jsonb,
  'Wit and skill point bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_neo_universe_alt',
  'Neo Universe',
  'Galaxy',
  'cards/neo_universe_alt.png',
  'wit',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"initial_wit":20,"wit_bonus":3,"hint_levels":2}'::jsonb,
  '["Galaxy Mind","Universe Wisdom"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_ines_fujin_alt',
  'Ines Fujin',
  'Typhoon',
  'cards/ines_fujin_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":30,"initial_speed":30,"speed_bonus":5,"mood_effect":32,"initial_bond":26}'::jsonb,
  '["Typhoon Run","Fujin Storm"]'::jsonb,
  'Good mood and speed training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mejiro_dober_alt',
  'Mejiro Dober',
  'Fang of Justice',
  'cards/mejiro_dober_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":24,"initial_stamina":32,"stamina_bonus":5,"initial_bond":34,"wit_recovery":30}'::jsonb,
  '["Fang of Justice","Dober Guard"]'::jsonb,
  'High bond and recovery'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_mejiro_ryan_alt',
  'Mejiro Ryan',
  'Gentle Wind',
  'cards/mejiro_ryan_alt.png',
  'speed',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_speed":14,"speed_bonus":2}'::jsonb,
  '["Gentle Wind"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mayano_top_gun_alt',
  'Mayano Top Gun',
  'Ace Pilot',
  'cards/mayano_top_gun_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":30,"power_bonus":5,"initial_bond":30,"race_bonus":15,"hint_levels":3}'::jsonb,
  '["Ace Pilot","Top Gunner"]'::jsonb,
  'Power race effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_eishin_flash_alt',
  'Eishin Flash',
  'Lightning',
  'cards/eishin_flash_alt.png',
  'speed',
  'sr',
  '{"friendship_bonus":23,"training_effectiveness":18,"initial_speed":20,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Lightning","Flash Sprint"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_astromon_alt',
  'Astromon',
  'Galaxy Walker',
  'cards/astromon_alt.png',
  'guts',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":33,"guts_bonus":5,"initial_guts":32,"race_bonus":14,"hint_frequency":32}'::jsonb,
  '["Galaxy Walker","Astro Guts"]'::jsonb,
  'High Guts training effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_duramante_alt',
  'Duramente',
  'Diamond Heart',
  'cards/duramante_alt.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":26,"initial_stamina":35,"stamina_bonus":5,"initial_bond":30,"wit_recovery":32}'::jsonb,
  '["Diamond Heart","Durable Will"]'::jsonb,
  'Recovery and stamina bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_mejiro_palma_alt',
  'Mejiro Palma',
  'Tropical Paradise',
  'cards/mejiro_palma_alt.png',
  'friend',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":20,"initial_bond":36,"mood_effect":35,"event_effectiveness":30,"wit_recovery":25}'::jsonb,
  '["Tropical Cheer","Palma Support"]'::jsonb,
  'Friend type with high event effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_super_creek_alt',
  'Super Creek',
  'Stream of Life',
  'cards/super_creek_alt.png',
  'stamina',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":17,"initial_stamina":20,"stamina_bonus":3,"initial_bond":22}'::jsonb,
  '["Stream of Life","Creek Flow"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_nice_nature_alt',
  'Nice Nature',
  'Kind Heart',
  'cards/nice_nature_alt.png',
  'friend',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_bond":15,"mood_effect":10}'::jsonb,
  '["Kind Heart"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_narita_taishin_alt',
  'Narita Taishin',
  'Comet',
  'cards/narita_taishin_alt.png',
  'guts',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":30,"guts_bonus":5,"initial_guts":30,"race_bonus":15,"fan_bonus":18}'::jsonb,
  '["Comet Guts","Taishin Spirit"]'::jsonb,
  'Guts race effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_bubble_gum_joke_alt',
  'Bubble Gum Joke',
  'Sweet Laughter',
  'cards/bubble_gum_joke_alt.png',
  'friend',
  'ssr',
  '{"friendship_bonus":25,"training_effectiveness":20,"initial_bond":35,"mood_effect":35,"event_effectiveness":30,"wit_recovery":25}'::jsonb,
  '["Sweet Laughter","Joke Support"]'::jsonb,
  'Mood and bond for friend type'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_hishi_akebono_alt',
  'Hishi Akebono',
  'First Light',
  'cards/hishi_akebono_alt.png',
  'power',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"power_bonus":5,"initial_bond":30,"race_bonus":18,"hint_levels":3}'::jsonb,
  '["First Light","Akebono Power"]'::jsonb,
  'Power training with race bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_sakura_laurel_alt',
  'Sakura Laurel',
  'Spring Wreath',
  'cards/sakura_laurel_alt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":28,"initial_speed":30,"speed_bonus":5,"hint_levels":3,"hint_frequency":40}'::jsonb,
  '["Spring Wreath","Laurel Sprint"]'::jsonb,
  'Speed training with hints'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_heiden_alt',
  'Heiden',
  'Secret Power',
  'cards/heiden_alt.png',
  'guts',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"initial_guts":20,"guts_bonus":3,"race_bonus":10}'::jsonb,
  '["Secret Power","Heiden Guts"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_win_variation_alt',
  'Win Variation',
  'Champion Dance',
  'cards/win_variation_alt.png',
  'friend',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":22,"initial_bond":35,"mood_effect":30,"event_effectiveness":30,"wit_recovery":25}'::jsonb,
  '["Champion Dance","Win Cheer"]'::jsonb,
  'Friend type with balanced support'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_admire_vega_third',
  'Admire Vega',
  'Star Compass',
  'cards/admire_vega_third.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":27,"initial_stamina":34,"stamina_bonus":5,"specialty_priority":68,"initial_bond":30}'::jsonb,
  '["Star Compass","Vega Navigate"]'::jsonb,
  'Stamina specialty and bond'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_narita_top_road_third',
  'Narita Top Road',
  'Peak Performance',
  'cards/narita_top_road_third.png',
  'guts',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":32,"guts_bonus":5,"initial_guts":32,"race_bonus":18,"fan_bonus":20}'::jsonb,
  '["Peak Performance","Top Guts"]'::jsonb,
  'Guts training effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_manhattan_cafe_third',
  'Manhattan Cafe',
  'Starry Night',
  'cards/manhattan_cafe_third.png',
  'wit',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":25,"skill_pt_bonus":55,"hint_levels":3,"wit_bonus":5,"wit_recovery":35,"initial_wit":30}'::jsonb,
  '["Starry Night","Cafe Brew"]'::jsonb,
  'Wit recovery bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_flower',
  'Miracle Flower',
  'Cherry Blossom',
  'cards/miracle_flower.png',
  'friend',
  'ssr',
  '{"friendship_bonus":27,"training_effectiveness":22,"initial_bond":36,"mood_effect":35,"event_effectiveness":32,"wit_recovery":24}'::jsonb,
  '["Cherry Blossom","Flower Cheer"]'::jsonb,
  'Mood and event effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_ocean',
  'Miracle Ocean',
  'Deep Blue',
  'cards/miracle_ocean.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":25,"initial_stamina":34,"stamina_bonus":5,"wit_recovery":32,"initial_bond":30}'::jsonb,
  '["Deep Blue","Ocean Endurance"]'::jsonb,
  'Stamina and recovery'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_forest',
  'Miracle Forest',
  'Woodland',
  'cards/miracle_forest.png',
  'power',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"power_bonus":3,"initial_bond":22,"hint_levels":2}'::jsonb,
  '["Woodland Power","Forest Charge"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_mountain',
  'Miracle Mountain',
  'Summit Peak',
  'cards/miracle_mountain.png',
  'guts',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":32,"guts_bonus":5,"initial_guts":32,"race_bonus":15,"fan_bonus":18}'::jsonb,
  '["Summit Peak","Mountain Guts"]'::jsonb,
  'Guts training with fans'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_galaxy',
  'Miracle Galaxy',
  'Milky Way',
  'cards/miracle_galaxy.png',
  'wit',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":25,"skill_pt_bonus":58,"hint_levels":3,"wit_bonus":6,"initial_wit":32}'::jsonb,
  '["Milky Way","Galaxy Mind"]'::jsonb,
  'Skill point and wit bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_thunder',
  'Miracle Thunder',
  'Lightning Bolt',
  'cards/miracle_thunder.png',
  'power',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":30,"power_bonus":6,"initial_bond":28,"race_bonus":18,"fan_bonus":18}'::jsonb,
  '["Lightning Bolt","Thunder Power"]'::jsonb,
  'Power training with race'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_aurora',
  'Miracle Aurora',
  'Northern Lights',
  'cards/miracle_aurora.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"initial_speed":32,"speed_bonus":5,"specialty_priority":68,"mood_effect":30}'::jsonb,
  '["Northern Lights","Aurora Dash"]'::jsonb,
  'Speed with mood and specialty'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_sunset',
  'Miracle Sunset',
  'Golden Hour',
  'cards/miracle_sunset.png',
  'friend',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":16,"initial_bond":25,"mood_effect":20,"event_effectiveness":25}'::jsonb,
  '["Golden Hour","Sunset Cheer"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_crystal',
  'Miracle Crystal',
  'Prism Light',
  'cards/miracle_crystal.png',
  'wit',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":24,"skill_pt_bonus":55,"hint_levels":3,"wit_bonus":5,"initial_wit":30}'::jsonb,
  '["Prism Light","Crystal Strategy"]'::jsonb,
  'Balanced Wit training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_miracle_dream',
  'Miracle Dream',
  'Sweet Dream',
  'cards/miracle_dream.png',
  'power',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"power_bonus":2,"initial_bond":12}'::jsonb,
  '["Sweet Dream"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_phoenix',
  'Miracle Phoenix',
  'Flame Reborn',
  'cards/miracle_phoenix.png',
  'guts',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":33,"guts_bonus":5,"initial_guts":30,"race_bonus":15,"hint_frequency":35}'::jsonb,
  '["Flame Reborn","Phoenix Guts"]'::jsonb,
  'Guts hint frequency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_ice',
  'Miracle Ice',
  'Frozen Heart',
  'cards/miracle_ice.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":24,"initial_stamina":33,"stamina_bonus":5,"mood_effect":30,"initial_bond":30}'::jsonb,
  '["Frozen Heart","Ice Endurance"]'::jsonb,
  'Stamina with mood'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_fire',
  'Miracle Fire',
  'Burning Soul',
  'cards/miracle_fire.png',
  'power',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"power_bonus":5,"initial_bond":30,"race_bonus":18,"hint_levels":3}'::jsonb,
  '["Burning Soul","Fire Power"]'::jsonb,
  'Power with race'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_wind',
  'Miracle Wind',
  'Breeze',
  'cards/miracle_wind.png',
  'speed',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":17,"initial_speed":18,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Breeze Dash","Wind Runner"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_storm',
  'Miracle Storm',
  'Tempest',
  'cards/miracle_storm.png',
  'guts',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":31,"guts_bonus":5,"initial_guts":30,"fan_bonus":20,"race_bonus":12}'::jsonb,
  '["Tempest Guts","Storm Spirit"]'::jsonb,
  'Guts with fan bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_miracle_river',
  'Miracle River',
  'Stream',
  'cards/miracle_river.png',
  'stamina',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_stamina":14,"stamina_bonus":2}'::jsonb,
  '["Stream Flow"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_star_ssr',
  'Miracle Star',
  'Shining Light',
  'cards/miracle_star_ssr.png',
  'friend',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":22,"initial_bond":36,"mood_effect":35,"event_effectiveness":32,"wit_recovery":25}'::jsonb,
  '["Shining Light","Star Support"]'::jsonb,
  'Friend type balanced'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_light',
  'Miracle Light',
  'Photon',
  'cards/miracle_light.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"initial_speed":32,"speed_bonus":5,"specialty_priority":68,"initial_bond":28}'::jsonb,
  '["Photon Dash","Light Speed"]'::jsonb,
  'Speed specialty'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_shadow',
  'Miracle Shadow',
  'Darkness',
  'cards/miracle_shadow.png',
  'power',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":30,"power_bonus":5,"initial_bond":28,"race_bonus":20,"hint_levels":3}'::jsonb,
  '["Darkness Power","Shadow Charge"]'::jsonb,
  'Power with race bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_silver',
  'Miracle Silver',
  'Moonlight',
  'cards/miracle_silver.png',
  'wit',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"initial_wit":20,"wit_bonus":3,"hint_levels":2}'::jsonb,
  '["Moonlight Wisdom","Silver Mind"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_gold',
  'Miracle Gold',
  'Sunlight',
  'cards/miracle_gold.png',
  'guts',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":32,"guts_bonus":5,"initial_guts":32,"race_bonus":15,"fan_bonus":20}'::jsonb,
  '["Sunlight Guts","Gold Spirit"]'::jsonb,
  'Guts with fan bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_rainbow',
  'Miracle Rainbow',
  'Colorful',
  'cards/miracle_rainbow.png',
  'friend',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":20,"initial_bond":38,"mood_effect":35,"event_effectiveness":32,"wit_recovery":25}'::jsonb,
  '["Colorful Cheer","Rainbow Support"]'::jsonb,
  'Friend with max bond'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_spring',
  'Miracle Spring',
  'Fresh Start',
  'cards/miracle_spring.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":25,"initial_stamina":33,"stamina_bonus":5,"wit_recovery":32,"initial_bond":30}'::jsonb,
  '["Fresh Start","Spring Endurance"]'::jsonb,
  'Stamina recovery'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_summer',
  'Miracle Summer',
  'Hot Sun',
  'cards/miracle_summer.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"initial_speed":30,"speed_bonus":5,"mood_effect":35,"initial_bond":28}'::jsonb,
  '["Hot Sun Dash","Summer Sprint"]'::jsonb,
  'Speed with mood'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_miracle_autumn',
  'Miracle Autumn',
  'Falling Leaves',
  'cards/miracle_autumn.png',
  'guts',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":10,"initial_guts":12,"guts_bonus":2}'::jsonb,
  '["Falling Leaves"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_winter',
  'Miracle Winter',
  'Snowfall',
  'cards/miracle_winter.png',
  'stamina',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":17,"initial_stamina":20,"stamina_bonus":3,"initial_bond":20}'::jsonb,
  '["Snowfall","Winter Endurance"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_cosmos',
  'Miracle Cosmos',
  'Universe',
  'cards/miracle_cosmos.png',
  'wit',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":25,"skill_pt_bonus":58,"hint_levels":3,"wit_bonus":6,"initial_wit":32}'::jsonb,
  '["Universe Mind","Cosmos Strategy"]'::jsonb,
  'Wit with skill points'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_solar',
  'Miracle Solar',
  'Sun Power',
  'cards/miracle_solar.png',
  'power',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"power_bonus":5,"initial_bond":30,"race_bonus":18,"fan_bonus":20}'::jsonb,
  '["Sun Power","Solar Charge"]'::jsonb,
  'Power with fan gain'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_lunar',
  'Miracle Lunar',
  'Moon Power',
  'cards/miracle_lunar.png',
  'friend',
  'ssr',
  '{"friendship_bonus":27,"training_effectiveness":20,"initial_bond":36,"mood_effect":35,"event_effectiveness":32,"wit_recovery":24}'::jsonb,
  '["Moon Power","Lunar Cheer"]'::jsonb,
  'Friend event effectiveness'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_comet',
  'Miracle Comet',
  'Tails of Light',
  'cards/miracle_comet.png',
  'speed',
  'sr',
  '{"friendship_bonus":23,"training_effectiveness":18,"initial_speed":20,"speed_bonus":3,"hint_levels":2}'::jsonb,
  '["Comet Dash","Tail Light"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_echo',
  'Miracle Echo',
  'Resonance',
  'cards/miracle_echo.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":26,"initial_stamina":34,"stamina_bonus":5,"wit_recovery":30,"specialty_priority":66}'::jsonb,
  '["Resonance","Echo Endurance"]'::jsonb,
  'Stamina specialty recovery'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_blaze',
  'Miracle Blaze',
  'Firestorm',
  'cards/miracle_blaze.png',
  'power',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":30,"power_bonus":6,"initial_bond":28,"race_bonus":20,"fan_bonus":20}'::jsonb,
  '["Firestorm","Blaze Power"]'::jsonb,
  'Power race bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_frost',
  'Miracle Frost',
  'Ice Age',
  'cards/miracle_frost.png',
  'guts',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":33,"guts_bonus":5,"initial_guts":32,"race_bonus":15,"hint_frequency":35}'::jsonb,
  '["Ice Age","Frost Guts"]'::jsonb,
  'Guts hint frequency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_volt',
  'Miracle Volt',
  'Electric',
  'cards/miracle_volt.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"initial_speed":32,"speed_bonus":5,"specialty_priority":68,"mood_effect":30}'::jsonb,
  '["Electric Dash","Volt Sprint"]'::jsonb,
  'Speed specialty'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_miracle_wave',
  'Miracle Wave',
  'Tidal',
  'cards/miracle_wave.png',
  'stamina',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"initial_stamina":14,"stamina_bonus":2}'::jsonb,
  '["Tidal Flow"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_symphony',
  'Miracle Symphony',
  'Harmony',
  'cards/miracle_symphony.png',
  'wit',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":25,"skill_pt_bonus":55,"hint_levels":4,"wit_bonus":5,"initial_wit":30}'::jsonb,
  '["Harmony","Symphony Mind"]'::jsonb,
  'Wit with highest hint level'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_rhythm',
  'Miracle Rhythm',
  'Beat',
  'cards/miracle_rhythm.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"initial_speed":30,"speed_bonus":5,"mood_effect":35,"specialty_priority":65}'::jsonb,
  '["Beat Dash","Rhythm Sprint"]'::jsonb,
  'Speed with mood and specialty'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_melody',
  'Miracle Melody',
  'Song',
  'cards/miracle_melody.png',
  'friend',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":22,"initial_bond":36,"mood_effect":35,"event_effectiveness":30,"wit_recovery":25}'::jsonb,
  '["Song of Cheer","Melody Support"]'::jsonb,
  'Friend with event focus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_harmony',
  'Miracle Harmony',
  'Balance',
  'cards/miracle_harmony.png',
  'guts',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":32,"guts_bonus":5,"initial_guts":30,"race_bonus":15,"fan_bonus":18}'::jsonb,
  '["Balance Guts","Harmony Spirit"]'::jsonb,
  'Guts with fan bonus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_crescendo',
  'Miracle Crescendo',
  'Climax',
  'cards/miracle_crescendo.png',
  'power',
  'ssr',
  '{"friendship_bonus":37,"training_effectiveness":30,"power_bonus":5,"initial_bond":30,"race_bonus":20,"hint_levels":3}'::jsonb,
  '["Climax Power","Crescendo Charge"]'::jsonb,
  'Power with race'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_ballad',
  'Miracle Ballad',
  'Story',
  'cards/miracle_ballad.png',
  'stamina',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":17,"initial_stamina":20,"stamina_bonus":3,"initial_bond":22}'::jsonb,
  '["Story Endurance","Ballad Flow"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_sonic',
  'Miracle Sonic',
  'Supersonic Wave',
  'cards/miracle_sonic.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"initial_speed":32,"speed_bonus":5,"hint_levels":3,"hint_frequency":40}'::jsonb,
  '["Supersonic Wave","Sonic Dash"]'::jsonb,
  'Speed hint frequency'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_radiant',
  'Miracle Radiant',
  'Glow',
  'cards/miracle_radiant.png',
  'wit',
  'ssr',
  '{"friendship_bonus":32,"training_effectiveness":24,"skill_pt_bonus":55,"hint_levels":3,"wit_bonus":6,"initial_wit":32}'::jsonb,
  '["Glow Wisdom","Radiant Strategy"]'::jsonb,
  'Wit with skill points'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_miracle_spark',
  'Miracle Spark',
  'Little Light',
  'cards/miracle_spark.png',
  'power',
  'r',
  '{"friendship_bonus":10,"training_effectiveness":8,"power_bonus":2,"initial_bond":12}'::jsonb,
  '["Little Light"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_beacon',
  'Miracle Beacon',
  'Guide',
  'cards/miracle_beacon.png',
  'friend',
  'ssr',
  '{"friendship_bonus":28,"training_effectiveness":20,"initial_bond":38,"mood_effect":35,"event_effectiveness":30,"wit_recovery":25}'::jsonb,
  '["Guide Light","Beacon Support"]'::jsonb,
  'Friend bond focus'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_ember',
  'Miracle Ember',
  'Small Flame',
  'cards/miracle_ember.png',
  'guts',
  'ssr',
  '{"friendship_bonus":30,"training_effectiveness":32,"guts_bonus":5,"initial_guts":30,"race_bonus":15,"hint_frequency":35}'::jsonb,
  '["Small Flame","Ember Guts"]'::jsonb,
  'Guts hint'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_wildfire',
  'Miracle Wildfire',
  'Inferno',
  'cards/miracle_wildfire.png',
  'power',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"power_bonus":6,"initial_bond":28,"race_bonus":18,"fan_bonus":20}'::jsonb,
  '["Inferno","Wildfire Power"]'::jsonb,
  'Power with fan'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_glacier',
  'Miracle Glacier',
  'Ice Flow',
  'cards/miracle_glacier.png',
  'stamina',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":17,"initial_stamina":22,"stamina_bonus":3,"initial_bond":20}'::jsonb,
  '["Ice Flow","Glacier Endurance"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_zenith',
  'Miracle Zenith',
  'Peak',
  'cards/miracle_zenith.png',
  'speed',
  'ssr',
  '{"friendship_bonus":35,"training_effectiveness":28,"initial_speed":32,"speed_bonus":5,"specialty_priority":68,"initial_bond":30}'::jsonb,
  '["Peak Dash","Zenith Sprint"]'::jsonb,
  'Speed peak performance'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_abyss',
  'Miracle Abyss',
  'Deep',
  'cards/miracle_abyss.png',
  'stamina',
  'ssr',
  '{"friendship_bonus":34,"training_effectiveness":26,"initial_stamina":34,"stamina_bonus":5,"wit_recovery":32,"mood_effect":25}'::jsonb,
  '["Deep Endurance","Abyss Flow"]'::jsonb,
  'Stamina with recovery'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_horizon',
  'Miracle Horizon',
  'Far Away',
  'cards/miracle_horizon.png',
  'guts',
  'ssr',
  '{"friendship_bonus":31,"training_effectiveness":30,"guts_bonus":5,"initial_guts":30,"fan_bonus":20,"race_bonus":15}'::jsonb,
  '["Far Away","Horizon Guts"]'::jsonb,
  'Guts far training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_nexus',
  'Miracle Nexus',
  'Center',
  'cards/miracle_nexus.png',
  'wit',
  'ssr',
  '{"friendship_bonus":33,"training_effectiveness":25,"skill_pt_bonus":58,"hint_levels":3,"wit_bonus":6,"initial_wit":30}'::jsonb,
  '["Center Mind","Nexus Strategy"]'::jsonb,
  'Wit center training'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'r_miracle_coral',
  'Miracle Coral',
  'Reef',
  'cards/miracle_coral.png',
  'friend',
  'r',
  '{"friendship_bonus":8,"training_effectiveness":6,"initial_bond":14,"mood_effect":10}'::jsonb,
  '["Reef Cheer"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'sr_miracle_tide',
  'Miracle Tide',
  'Ebb and Flow',
  'cards/miracle_tide.png',
  'power',
  'sr',
  '{"friendship_bonus":22,"training_effectiveness":18,"power_bonus":3,"initial_bond":22,"hint_levels":2}'::jsonb,
  '["Ebb and Flow","Tide Power"]'::jsonb,
  NULL
) ON CONFLICT (id) DO NOTHING;

INSERT INTO cards (id, name, title, image, type, rarity, effects, skills, unique_effect) VALUES (
  'ssr_miracle_asteroid',
  'Miracle Asteroid',
  'Shooting Star',
  'cards/miracle_asteroid.png',
  'speed',
  'ssr',
  '{"friendship_bonus":36,"training_effectiveness":30,"initial_speed":32,"speed_bonus":5,"specialty_priority":68,"initial_bond":28}'::jsonb,
  '["Shooting Star","Asteroid Dash"]'::jsonb,
  'Speed shooting star effect'
) ON CONFLICT (id) DO NOTHING;

