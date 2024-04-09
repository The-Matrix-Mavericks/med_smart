'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "2e25d5541cf06e58f1f971d0c999c9cf",
"main.dart.js": "0b9dc33cd6433e542aaabab6244dd276",
"index.html": "3a5a89e98033aa8578d90c1d934b27b1",
"/": "3a5a89e98033aa8578d90c1d934b27b1",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"version.json": "f3ff2a099e28b54b319f65daca5d95ad",
"assets/AssetManifest.bin.json": "c66060d097cb87a14be978c28f495675",
"assets/AssetManifest.json": "90f2e9d13aa2a4684c0155bb18f8862d",
"assets/packages/zego_zpns/assets/zpns.js": "b83a7288dbdd4914da1b0b78576f0ee6",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "413747df271b93ef3d1f5f4b9ecfed63",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "209a53e38b81d7fde0790d8901e7ef9a",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/fluttermoji/attributeicons/eyes.svg": "cfbbbeb9cc3b40c6a561166ad07fc56c",
"assets/packages/fluttermoji/attributeicons/beard.svg": "908ac523ce1c704be65e254aa4a04e31",
"assets/packages/fluttermoji/attributeicons/skin.svg": "5f58e197768b8da582fbe8219daf164d",
"assets/packages/fluttermoji/attributeicons/haircolor.svg": "5756eb4c957d15ea7fcc37c1835488ac",
"assets/packages/fluttermoji/attributeicons/beardcolor.svg": "8fa1ec767cfa14371ca15a47126049ba",
"assets/packages/fluttermoji/attributeicons/outfit.svg": "f36789fda25e7b3746835daf0ec7c0dc",
"assets/packages/fluttermoji/attributeicons/eyebrow.svg": "cf66096dacdfb6af807cd745fc724e9a",
"assets/packages/fluttermoji/attributeicons/outfitcolor.svg": "e8f931206db9c6ab01a6b4c22c23bf4d",
"assets/packages/fluttermoji/attributeicons/mouth.svg": "af3193d2a407e09fa1156f0f3c30ea86",
"assets/packages/fluttermoji/attributeicons/accessories.svg": "0b8839e003a89232edec0e09cb12fa2b",
"assets/packages/fluttermoji/attributeicons/hair.svg": "0044380b1c40c321c8a65da5b8e77a0c",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_aMajor.png": "030070dc46d37e289450f449352a3561",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/im.png": "e69aca2198610729852a6571f06633cb",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_aMajor_selected.png": "09804fe0a91685162fb3fb4ed0b16969",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_cMajor_selected.png": "8ed0db2cc0539b327275ce24e09db037",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/toolbar_beauty.png": "e92042fa28756d017345ec177ae77cc1",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_ktv.png": "e4cc909b4013dab20a4ac7fab9979055",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_harmonicMinor_selected.png": "f742754506d7d89997a29cc82b73fc5f",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_crystalClear_selected.png": "3b4b1c298f16c3fd8e238c47ea704110",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_gramophone.png": "636f6d797079e6f6b0980d42168cee6a",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_cMajor.png": "8e757d359d4c87604ee6d1aacfd25ebc",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_largeRoom.png": "9e4e554ee9af05420e7c0bca9d0c7200",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_concert.png": "077664722133d813171dc253757ffe2d",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_crystalClear.png": "7e59f9c7d71bee52111666a29bd50cad",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/back.png": "1cc8237aa89ef773a1e65d57293a5c06",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_aMajor.png": "9ce03ec5bc9a83d8fce2a19c1f2945fe",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/im.png": "a204a9ee814519e5405e5faa4c3c723e",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_aMajor_selected.png": "4dc9ae05f7a0fd3b398dfa307754c76e",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_cMajor_selected.png": "c57fcd6644395c17a1b384ee804fa7b6",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/toolbar_beauty.png": "4c322ca9d387f9a37f6fe621b2651681",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_ktv.png": "41731583279aff849ff6d504510eb694",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_harmonicMinor_selected.png": "55f8f216d8cac50a119e18dbd3009a19",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_crystalClear_selected.png": "11d65a48e25609aecf88acfece30fe7f",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_gramophone.png": "1228c599f3d4132e6472dd5b2d2b179c",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_cMajor.png": "01e0e75b8c50e4b34871b80285f821b0",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_largeRoom.png": "f63e5f77654e8c1edfaf85c0c75a59ff",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_concert.png": "00f8c1f3dc80e9ea831c750c3302bee5",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_crystalClear.png": "6cfd77baefaa3cf7ad03c02e7d1b325c",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/back.png": "c9d6e68a3c3d1b3b49723eb745b15e09",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_male_selected.png": "869b7fcf4c785a833cc52808fffb8519",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_none.png": "365a13466c16cd47d66ba2344f702939",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/top_im.png": "7c406701f8f17e2d1fda20fbd37aa660",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_robot_selected.png": "da839793f4d697ce3ae15e36b91f7d14",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_littleGirl.png": "c31a474de3e0139214ce1e408c55575b",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_ethereal_selected.png": "d0e71953cabe6570d3f83066eea20a10",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_rock.png": "790ea6ebe10303747a6c2ad7c28882a4",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_optimusPrime_selected.png": "260571eecd08b944743ea9c8601285f2",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_popular.png": "b083051bcb0a7663dfaee95799c627e8",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_harmonicMinor.png": "9a8c17fa6bc894f4b95eb592690ceda7",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/top_member_normal.png": "eb5dee3f434a0a9fc2c601458d608841",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/toolbar_sound.png": "abd3907b4cdc62e0df03514f146c5105",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/top_camera_overturn.png": "522c321eae222817299840e170496638",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_littleBoy_selected.png": "2199c601a7de94ee475270e620523e87",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_recordingStudio.png": "bfcdb1e76b97e8ae199b762ff1f7aee4",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_deep_selected.png": "ec3e2e77c3ccfb3c2829b00a4d52e68a",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_optimusPrime.png": "d23ebe11aad55f3cd15530f7a2ce80cc",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_basement.png": "c554c71d2cbe15fca8a45107c1483200",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_deep.png": "e01e65e07a90e5ed15b0faec85432f4f",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_female.png": "e320240fe4a820206dc08c008663e561",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_smallRoom.png": "b1cd346213b81f5121e24ce1ccf5a7e2",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_male.png": "cbc091194cff935d5c34bf6fcc140061",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_robot.png": "0c29beeee0f933342bc23271cab1c284",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_none.png": "8c4e9ebf9651fb81e6a3078c8593ef23",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_female_selected.png": "b363ce79a5f31149aab4229d86a1ca8f",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_hall.png": "9ae1edc53c88d8278e30fb3d0c818227",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/minimizing.png": "3c3bed57d57bb8bb2ca02fd1427842a8",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_none_selected.png": "c81a57d8d66fcfe5cf557ab6fdf93ad2",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_ethereal.png": "d3f859ea9c50221b0a96795aa67be67d",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/voice_changer_littleGirl_selected.png": "40e23977036f6fc70e416f17e702d612",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/3.0x/reverb_preset_valley.png": "ad3f1fa3f7897d6063d3f4f53e4ec273",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_male_selected.png": "16272fc9fb4fa650cc86abe6248afbc7",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_none.png": "de634617761d70a3365e52a99ca0d9de",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/top_im.png": "eb0fc118673f25f108dae6cf100349bd",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_robot_selected.png": "f408258e194f622ef5a3600d46357532",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_littleGirl.png": "ceb1568a1fd2a8f78175fc4a630edc1d",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_ethereal_selected.png": "32c5275d888a3614d23da5b916b83d0a",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_rock.png": "f241663ae6ef90b0797a2dba607b9089",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_optimusPrime_selected.png": "20d669b777be5740b3992769cd123408",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_popular.png": "ef587ae29fe65e07a50b622184a6c491",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_harmonicMinor.png": "5b8be3359d65f64072719608437de4c9",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_aMajor.png": "011cde25aaf8b511b48dc514ab933133",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/im.png": "5419f695006e601b7bcc4e85e94d177f",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_aMajor_selected.png": "25218c01a531c77ff0cccf0c463abaec",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_cMajor_selected.png": "b248de48ece741c1d4f61bbf842d459b",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/toolbar_beauty.png": "d52d7d2709161d04536c4e79fac7aa21",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_ktv.png": "17b0ee28bdb15fbf0ad7f6e1514432b6",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_harmonicMinor_selected.png": "661889bfb41fca3b62806d0504bd869c",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_crystalClear_selected.png": "4abeabf81fe964549f38f0a9b19cb52c",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_gramophone.png": "182217bd275d013de99d8ee7b31b11a1",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_cMajor.png": "5fde83fe2c9e31a74527712db4d2e397",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_largeRoom.png": "74f81fb5af623d30507fd05de06ad252",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_concert.png": "f6623588f16fc9812e1d5ba0a98eda66",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_crystalClear.png": "a1e877fe0b9dc9dd8a5683815f5511d9",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/back.png": "3a15fb4e9557ed72c77543500486c5fb",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_male_selected.png": "374cb6d4de98c5395007e021c47273d6",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_none.png": "32c045a867607e16593a9885b811ee73",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/top_im.png": "bfae7b2c9d0cc8d79f94310fb3498818",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_robot_selected.png": "323f52b19878239cf4994ad5e1f38907",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_littleGirl.png": "307af2b65a7d9cd8ce44db877eae7ba1",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_ethereal_selected.png": "055dd2cb84c82e1cbca743d997dca5c9",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_rock.png": "65613f2924e7134463bcbe31db8bd8f6",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_optimusPrime_selected.png": "f3395bb1643dbaebcc9befbe2b595f0b",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_popular.png": "66551bb42f5ab16600dfccb0587d0b96",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_harmonicMinor.png": "734fdb49391ec63f03074fb5edda90b8",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/top_member_normal.png": "21a466088f1aa00d0c77260dbea684cb",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/toolbar_sound.png": "e1f5d346e3599e3c4b0a75f1229f4368",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/top_camera_overturn.png": "f648e99e1db0435a3641ef0c59bce702",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_littleBoy_selected.png": "40f9a3c380fce162e39630666ee466cc",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_recordingStudio.png": "67630d5c214946175fd995a98e11cbf4",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_deep_selected.png": "0e7ed98af80aaf07978e884c9f8b200a",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_optimusPrime.png": "1f00d32f094bc36e70da567cdcdda0af",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_basement.png": "93e7430bee05e1661afcf35a6020a41e",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_deep.png": "b52372c35e98c25c82483432fdc36486",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_female.png": "00892f95c2c6ff5fe8bd7620a969ba52",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_littleBoy.png": "693fa23b990e96f209b737afb19da755",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_smallRoom.png": "58d78d9522db5fd6939f4a8d80665111",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_male.png": "e1bd802bbed2c91df340c31116c647d8",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_robot.png": "dfb1887860f92ba8eccbddc005c5db87",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_none.png": "fef3be502e98daf9d9ed8a9b40f07efb",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_female_selected.png": "2740081932474ea4b33e5bfae4b4f02e",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_hall.png": "0bd166cb0d18715f0a1839e489d4fc9c",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/minimizing.png": "a61f210b1f445bfeecf7a23a54e69703",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_none_selected.png": "fe7524fcc61d46e1541df25389d51a50",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_ethereal.png": "c69e053fd734dece26b18b9f25131bc3",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/voice_changer_littleGirl_selected.png": "f10d00e75a44a4131e5875976d98db02",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/2.0x/reverb_preset_valley.png": "1c0454a55543c2addced0283147de6ac",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/top_member_normal.png": "4a669238d6446736c1add5e321688145",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/toolbar_sound.png": "d8f312b7b2b599fff096148ec9c3d46b",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/top_camera_overturn.png": "07d7ce9e0ce2e0d5c3a3e7e3325e036e",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_littleBoy_selected.png": "361f2c7fa875da0a730e441f92d4183c",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_recordingStudio.png": "f26a5667d829d4be03a4153f68ccdf61",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_deep_selected.png": "f26208b2fe8a7ce51ee3ff6a4388357e",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_optimusPrime.png": "0a053221abf30862170f0e224ab60247",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_basement.png": "a65658b4a3ea5afb2072edcfe4020b8e",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_deep.png": "d6c911ebd1e1c99745a25f7cbe3563e9",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_female.png": "8bab155f6cd8f683c08bebb0e600c20f",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_littleBoy.png": "27608915d17c61ba45234ff070163f3d",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_smallRoom.png": "339c1b8207e52e51cc6cba681149742e",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_male.png": "b99d6b8abeb6d60d524150880529513c",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_robot.png": "fb7261581bfbc2dc8cea90f9273669d3",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_none.png": "430231fde4ae736ef74c5cd0fd51d4a3",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_female_selected.png": "7e7b26c234a9688c08a25a87316d7e3d",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_hall.png": "bcffc6864ff474b99065c810514308d9",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/minimizing.png": "de79eb6c8dd6c9e458136bbe6edef3d2",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_none_selected.png": "9caed68a8a8031d9a29e2c4799c4ea20",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_ethereal.png": "4b7ae0ccc70d3d20bdbd02418b959441",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/voice_changer_littleGirl_selected.png": "e569fee89d256032923468d754c9e679",
"assets/packages/zego_uikit_prebuilt_call/assets/icons/reverb_preset_valley.png": "c0dd2097a6f612cd21b105cb5e511ca5",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/toolbar_bottom_cancel.png": "347b08d9cac06094bdfeca7328c4bcb3",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/invite_voice.png": "849a299fd3670fc6693da77d392d4e45",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/toolbar_bottom_cancel.png": "fe6a4bd60a8a56d3375c9c08fcc9eb47",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/invite_voice.png": "f191776d49da7ce3d3f06a557aee74ea",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/toolbar_top_switch_camera.png": "7923152ef405d84ee36d5ce85fca14c4",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/toolbar_bottom_decline.png": "3f7867881527d5258c4e233f3cd02801",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/invite_reject.png": "50fe4208eaf232329d725b6be760ad05",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/toolbar_bottom_video.png": "bd1530d449b8761d956a24b337c704c7",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/invite_video.png": "b3fd4d33ffcc9e0c05ac8353657faf0f",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/toolbar_bottom_voice.png": "33e211177a377dde5abbae46eaa1bb78",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/3.0x/invite_background.png": "8271574223a98576ae28b1639f183976",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/toolbar_top_switch_camera.png": "10c4b42139136e814271aa636a64275e",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/toolbar_bottom_decline.png": "b7f71d65ae2450ab7f2713e5e2e57ab2",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/toolbar_bottom_cancel.png": "dfc5c96309c8761dcf140fce56a5a365",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/invite_voice.png": "24970c6bf9acf13244d9b749e3ea8b4f",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/toolbar_top_switch_camera.png": "ffd33a31458339186b13e9b03435e90e",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/toolbar_bottom_decline.png": "036a95b0857b55a62bc14a9dc7c3e905",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/invite_reject.png": "f967ba275f67032b14a0383d8eff0779",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/toolbar_bottom_video.png": "53008544346348d557cf27ec4ff324f3",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/invite_video.png": "7246561fa86cc404de866e76d9737110",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/toolbar_bottom_voice.png": "a35a18563c555cb305534c2e2f90744b",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/2.0x/invite_background.png": "4c7c5181f0edc3cb1cabfacc36a1bef5",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/invite_reject.png": "aef7ea169c2aa2c1abfaa366fec54da0",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/toolbar_bottom_video.png": "43949026115a3ef277c1453d9ba8d744",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/invite_video.png": "8278efa5e15b6ea4e3af4b408611fe62",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/toolbar_bottom_voice.png": "5e35f466244d20a19dc96cef36aeb43b",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/icons/invite_background.png": "39f2aad363edb5c61d5b55e0f0cf3b63",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/audio/incoming.mp3": "a12f085e3356fc27828901cce14f3db4",
"assets/packages/zego_uikit_prebuilt_call/assets/invitation/audio/outgoing.mp3": "8abea83d18c4e3efa01db3819bfad8cd",
"assets/packages/simple_circular_progress_bar/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "23621397bc1906a79180a918e98f35b2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/zego_express_engine/assets/ZegoExpressWebFlutterWrapper.js": "5fa0708fe0335bf38c9053b8e1b97215",
"assets/packages/zego_zim/assets/index.js": "fba713bf73aa51ffc783024bccd6e3c7",
"assets/packages/zego_uikit/assets/icons/invite_voice.png": "849a299fd3670fc6693da77d392d4e45",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_more_normal.png": "96fb3eb790757ec86896cbdd56953e97",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_camera_off.png": "47c428aed459e061d743f6286c61b0ba",
"assets/packages/zego_uikit/assets/icons/back.png": "1cc8237aa89ef773a1e65d57293a5c06",
"assets/packages/zego_uikit/assets/icons/3.0x/invite_voice.png": "f191776d49da7ce3d3f06a557aee74ea",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_more_normal.png": "45f7fe05bac7f3c1106d63c1078d7a7f",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_camera_off.png": "a1676a233c3fdf883b1b9525c52272c6",
"assets/packages/zego_uikit/assets/icons/3.0x/back.png": "c9d6e68a3c3d1b3b49723eb745b15e09",
"assets/packages/zego_uikit/assets/icons/3.0x/send_disable.png": "61577087db110346c44498944d1f491c",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_end.png": "c0dc110bb095effd61589390546351d3",
"assets/packages/zego_uikit/assets/icons/3.0x/message_loading.png": "567cf9465ee6f9b501bb6438207ae3aa",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_mic_on.png": "2b8b980b6e013bcfdbb0b58f1e5f0640",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_flip_camera.png": "06b289a7d6de55c6f7a5b43d7244afce",
"assets/packages/zego_uikit/assets/icons/3.0x/share_screen_start.png": "be1c3f30eef1e9777618df830e8c406f",
"assets/packages/zego_uikit/assets/icons/3.0x/member_mic_speaking.png": "e1cea5ddeba80a0a16e608f75dcceac5",
"assets/packages/zego_uikit/assets/icons/3.0x/invite_reject.png": "50fe4208eaf232329d725b6be760ad05",
"assets/packages/zego_uikit/assets/icons/3.0x/member_camera_off.png": "0527fda34af9d6369549d7ae54ec467a",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_mic_off.png": "33d5afecd9378cf570271818d4c56667",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_camera_off.png": "5275a3c18503c20b5a6238450272d2be",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_more_checked.png": "c3162cc37bc41fb13957b70b06476c3e",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_mic_speaking.png": "18354ef4c2606bcf96d4a0b3b9065193",
"assets/packages/zego_uikit/assets/icons/3.0x/nav_close.png": "6dd30082ee4dd26b634f2d107a320cda",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_mic_off.png": "d7b3619803222f891f8d1487e2dd95af",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_wifi.png": "0b78795289c2165bd6646f714cd2159c",
"assets/packages/zego_uikit/assets/icons/3.0x/share_screen_stop.png": "210873b802db239aec4c790855ef6d60",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_camera_normal.png": "be38e8cacecd08727f98b23a2cc1b297",
"assets/packages/zego_uikit/assets/icons/3.0x/message_fail.png": "1904f578c97fc26b7ab85980495bb439",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_speaker_off.png": "4f9bd995c5123400a3f13b4e4f1ed90c",
"assets/packages/zego_uikit/assets/icons/3.0x/member_mic_off.png": "a7489c5b6deafcb4eb10a02226bc3d9b",
"assets/packages/zego_uikit/assets/icons/3.0x/member_camera_normal.png": "e0eecc41b8db3333d6e0b73c71af64fb",
"assets/packages/zego_uikit/assets/icons/3.0x/member_mic_normal.png": "8a0ab49718e61d010bf1830f697511ec",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_full_screen_close.png": "8dafedc394aa80ab9370073413e89be7",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_mic_normal.png": "93436ec1f8389307c037521ce840f0a2",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_camera_on.png": "7369f517f02618f0ba7fe5c1e4fe55fd",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_speaker_bluetooth.png": "d15c31d947ce16f9f08ed2066542c629",
"assets/packages/zego_uikit/assets/icons/3.0x/invite_video.png": "b3fd4d33ffcc9e0c05ac8353657faf0f",
"assets/packages/zego_uikit/assets/icons/3.0x/send.png": "024f9c9faa2127335926a4037e23a684",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_speaker_normal.png": "2037c7dec37882bf30049d75dd3740c4",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_full_screen_open.png": "e4e91ee80390a53294a20c1e12dd783c",
"assets/packages/zego_uikit/assets/icons/send_disable.png": "7e80b5c74959ba84cbc7e50beb0e34f1",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_end.png": "3db1588b978af3720d74a5a6dbdb4cff",
"assets/packages/zego_uikit/assets/icons/message_loading.png": "41913c24ab8f26819589af76852f6f4c",
"assets/packages/zego_uikit/assets/icons/video_view_mic_on.png": "5f4a10f968013313145e45051cb20bf7",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_flip_camera.png": "6929bd51a1655cf7df3a23a2f3133ec8",
"assets/packages/zego_uikit/assets/icons/share_screen_start.png": "0cd5f14df5e1bb573d2aef1de2ed32b6",
"assets/packages/zego_uikit/assets/icons/member_mic_speaking.png": "cf6b2e626ec6571f11d8638ae3fb8609",
"assets/packages/zego_uikit/assets/icons/2.0x/invite_voice.png": "24970c6bf9acf13244d9b749e3ea8b4f",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_more_normal.png": "e8cf0cb5b4ae57f3634325200b340aef",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_camera_off.png": "c0901dd816919eb4e6ffffd5f7239184",
"assets/packages/zego_uikit/assets/icons/2.0x/back.png": "3a15fb4e9557ed72c77543500486c5fb",
"assets/packages/zego_uikit/assets/icons/2.0x/send_disable.png": "8e810767d851b09a84eb05580e7e83d4",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_end.png": "cb7886e14a43a4d7c6315025032a0272",
"assets/packages/zego_uikit/assets/icons/2.0x/message_loading.png": "dc31511440f51dbf93422c6288644247",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_mic_on.png": "85b79b0c60b1781019350176881d2006",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_flip_camera.png": "a5e90392059a2957af9e255023ab7c73",
"assets/packages/zego_uikit/assets/icons/2.0x/share_screen_start.png": "dab73df5268a057e660fcab1861a11ca",
"assets/packages/zego_uikit/assets/icons/2.0x/member_mic_speaking.png": "16b678656c45cd19cd11baec8c8ac751",
"assets/packages/zego_uikit/assets/icons/2.0x/invite_reject.png": "f967ba275f67032b14a0383d8eff0779",
"assets/packages/zego_uikit/assets/icons/2.0x/member_camera_off.png": "fab9cc0caa1ed63244039a2ac50af5a4",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_mic_off.png": "ab6fdc4bef804d7470fa95ab724a3493",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_camera_off.png": "a5c8ecf7492e0f8a1487513a4c0ceef9",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_more_checked.png": "86a57573701177bf50526ddf8919257d",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_mic_speaking.png": "017fb1acbfeafeab17d3119af65dc61b",
"assets/packages/zego_uikit/assets/icons/2.0x/nav_close.png": "faf29b14204b46842cc095efc4131686",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_mic_off.png": "0e0d07c9e48304166ba2963ce85c1cba",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_wifi.png": "d201ad7f9e9401f7fe60f79cd69e807c",
"assets/packages/zego_uikit/assets/icons/2.0x/share_screen_stop.png": "28751ac6943d6195c81351dd954c9d7e",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_camera_normal.png": "f9749113cfcdcf507dba5962aa71efec",
"assets/packages/zego_uikit/assets/icons/2.0x/message_fail.png": "d0fb57427a0074f574aef0d474f213d8",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_speaker_off.png": "3d36462e98a3dd959cdede0b81c3d311",
"assets/packages/zego_uikit/assets/icons/2.0x/member_mic_off.png": "4eda86a0a0a6ae75cf8521f63834a54d",
"assets/packages/zego_uikit/assets/icons/2.0x/member_camera_normal.png": "0a0decead6773a2ae1b1fc726cb2dba7",
"assets/packages/zego_uikit/assets/icons/2.0x/member_mic_normal.png": "e2788b3c2302b8b561e29c064e9a99ff",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_full_screen_close.png": "e5d96585b746432238b0c6eec6857526",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_mic_normal.png": "bb82e53aa5e2da3ee06e82f1d788c992",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_camera_on.png": "ceb2dfe462b738ad547939b553ff314d",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_speaker_bluetooth.png": "d24d7aeca55782323f36427f9f68889f",
"assets/packages/zego_uikit/assets/icons/2.0x/invite_video.png": "7246561fa86cc404de866e76d9737110",
"assets/packages/zego_uikit/assets/icons/2.0x/send.png": "ade012f5e004a41459da5d44bfd2957f",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_speaker_normal.png": "f280aecd1664df5ddb9b41a3265fbc96",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_full_screen_open.png": "655a9f372024d96fca06c6a39d7e80d7",
"assets/packages/zego_uikit/assets/icons/invite_reject.png": "aef7ea169c2aa2c1abfaa366fec54da0",
"assets/packages/zego_uikit/assets/icons/member_camera_off.png": "7e4da8fda7851b9c07bdb16e54532021",
"assets/packages/zego_uikit/assets/icons/video_view_mic_off.png": "ffcd14ed2c2e4d68554bbab32ca83a7e",
"assets/packages/zego_uikit/assets/icons/video_view_camera_off.png": "00241c1e4517457be35ec8235b848633",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_more_checked.png": "3573c99e2a7720ff2092e4f572b00012",
"assets/packages/zego_uikit/assets/icons/video_view_mic_speaking.png": "f36f281fee197efe2eabc76b1355bc88",
"assets/packages/zego_uikit/assets/icons/nav_close.png": "d5a4f6a62cf4761f787d0b2e718e535e",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_mic_off.png": "d522490af830e751a9735927194c2e8b",
"assets/packages/zego_uikit/assets/icons/video_view_wifi.png": "15ceb63b27034d03ae339e78c63238a6",
"assets/packages/zego_uikit/assets/icons/share_screen_stop.png": "abef995e3768c42d16ac5e1b05120cb5",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_camera_normal.png": "101da6ff95cb34d25aaef7a1c058c473",
"assets/packages/zego_uikit/assets/icons/message_fail.png": "c4f7303a3963fa31acd74ca482d4e097",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_speaker_off.png": "941cd4e186d9feeda35b793a55ab05cf",
"assets/packages/zego_uikit/assets/icons/member_mic_off.png": "da54635dfe0e424047509267c747c683",
"assets/packages/zego_uikit/assets/icons/member_camera_normal.png": "0c9b7ef19613acc4f7b45b03eaa8c05a",
"assets/packages/zego_uikit/assets/icons/member_mic_normal.png": "9c6cc34ee53802ea794e0d9e55b92124",
"assets/packages/zego_uikit/assets/icons/video_view_full_screen_close.png": "347b5c7e154224cbe561f5d7a4a02bab",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_mic_normal.png": "05b63e5db51f06fcf2fe8d8f2ffe9669",
"assets/packages/zego_uikit/assets/icons/video_view_camera_on.png": "767c529173c084143074a6a97e32f16f",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_speaker_bluetooth.png": "c803bf03b3df3af7a34d36f895c8d0bb",
"assets/packages/zego_uikit/assets/icons/invite_video.png": "8278efa5e15b6ea4e3af4b408611fe62",
"assets/packages/zego_uikit/assets/icons/send.png": "b6f3a4923052cce9db8ef6fc39d2c90b",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_speaker_normal.png": "3783636d5601e7cba03cbefbfc9d9e93",
"assets/packages/zego_uikit/assets/icons/video_view_full_screen_open.png": "c0fdccb5b807c1d25e9de110a2f24e46",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "779afef2847bb90c164e00b185147ee6",
"assets/NOTICES": "771ef62e0043d16883b0c540a7b9bd26",
"assets/assets/icons/ic_assistant.png": "e435cf7fcfd24cbc15ae98ae62541702",
"assets/assets/icons/pill.svg": "3d24d1cf0bf1e584481f35e178b13af4",
"assets/assets/icons/tab_3.png": "2a8f733675e2d8a7c6e9ac67a535bbf2",
"assets/assets/icons/tab_4s.png": "40c45bbb7601c039da61be3e3c0f7520",
"assets/assets/icons/ic_wiki.png": "4cc163dd8af55529edc7f3b9341dd062",
"assets/assets/icons/ic_drugs.png": "b15c225f327b56df142b5888d166a785",
"assets/assets/icons/ic_appicon.png": "2e1ec8865cfad0635c6e37b2b1d8ca14",
"assets/assets/icons/hair.png": "a5f0069e2928f9656a78cfdbeb0ad08f",
"assets/assets/icons/user_apothecary.png": "ea1b2d9d5c5bf3e73191ba015afbca17",
"assets/assets/icons/ic_healthcare.png": "9d80a01cf4daf63f5ea7d4a257cabefa",
"assets/assets/icons/tooth.png": "e34d5a7b7ab40c363154ad8931e16d08",
"assets/assets/icons/nose.png": "72b89fddc6517e7091ed9be2a738f8e6",
"assets/assets/icons/ic_launcher.png": "d0c64f4d3eb917adf19854fdd71ae514",
"assets/assets/icons/syringe.svg": "cfbdb6d248c59954ad7a330de4616e50",
"assets/assets/icons/user-doctor.png": "5377ba906b122c9f8093a0a6fe3d0bf7",
"assets/assets/icons/tab_1s.png": "fbd3aa5ed884a724f0435521586f6585",
"assets/assets/icons/eye.png": "dae0b8454bb8cca3051fa8662c176711",
"assets/assets/icons/heart.png": "9adf2e1b664202691f813fd188b0328f",
"assets/assets/icons/ic_user.png": "d51af15366079e64c0b512c0efb8e3d2",
"assets/assets/icons/tab_2s.png": "d270e94953ae9b7f377c5b253345374d",
"assets/assets/icons/tab_1.png": "629111ba46f6559071bcf25d2859a7ad",
"assets/assets/icons/aidoc.png": "81c17026696c975099fb3c9a34b7cfea",
"assets/assets/icons/bone.png": "dce191cd9a1602dcbbcfc9732d3dacf8",
"assets/assets/icons/tablet.svg": "5e4ee411b21d0c1995198f4153c4ae7a",
"assets/assets/icons/ic_feedback.png": "8b561625dba0eeabac207668d50d59e5",
"assets/assets/icons/ic_appointment.png": "91f8f8cf504ec3575f784bd5a9f5fe20",
"assets/assets/icons/ic_community.png": "fff8560b27e481979224832b9f08c1a5",
"assets/assets/icons/tab_3s.png": "a9093dcadf7724797ee22a5a802da7ad",
"assets/assets/icons/stomach.png": "7be0bfb92626507ca27bb83e9f247f61",
"assets/assets/icons/tab_2.png": "6506b7480618968b3daee97570927f65",
"assets/assets/icons/ic_delivery.png": "586742b627e7974e5b9b486ebbfecb25",
"assets/assets/icons/lungs.png": "a8ec4c13743d7f94990ace0b8933d30d",
"assets/assets/icons/ear.png": "04cf47af883175200039769acdf34bc1",
"assets/assets/icons/skin.png": "50e6d357b64c4b8cb3ea95287653a2d4",
"assets/assets/icons/bottle.svg": "ac69fdf5d81855de04c97fe67364e750",
"assets/assets/icons/icons8-google-48.png": "937c87b4439809d5b17b82728df09639",
"assets/assets/icons/Tic_appicon.png": "a50eee0ebdb04210ed23c66740d6f714",
"assets/assets/icons/icons8-google-480.png": "5305ab182caeb619650da7e39019d8d1",
"assets/assets/icons/tab_4.png": "f679006d5a49884f9ae89628d1d62d88",
"assets/assets/data/schema.db": "93ba5e6a845daa725c04437c406b14bf",
"assets/assets/data/schema.db.sql": "b5b2a055dd0141a3c3fe258a239fad63",
"assets/assets/success1.json": "f40cdc322aa8ac3cf6591bd77cda605d",
"assets/assets/hi.json": "ac9443057b6613ef8fe4ebcf2063479c",
"assets/assets/fonts/Inter-SemiBold.ttf": "3e87064b7567bef4ecd2ba977ce028bc",
"assets/assets/fonts/Inter-Regular.ttf": "eba360005eef21ac6807e45dc8422042",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-Medium.ttf": "614a91afc751f09d049231f828801c20",
"assets/assets/fonts/Poppins-Regular.ttf": "cd6b896a19b4babd1a2fa07498e9fc47",
"assets/assets/img/m_4.png": "113af868d9dc7001bc0194a4c842e62c",
"assets/assets/img/google.png": "cc4e8e2c7da85fe08e9dc9e683d8b147",
"assets/assets/img/sub_menu.png": "ad51c55e5465a042f0adc930aea52214",
"assets/assets/img/Workout3.png": "1f901588cf4f70415799042f9461df96",
"assets/assets/img/pp_7.png": "00809ae4cd76ccede8a375b0ae50d9aa",
"assets/assets/img/eggs.png": "bea3949cd7f1a860f8b457b591211e9f",
"assets/assets/img/Play.png": "6fe0b583cf13dd9741e09d604106262f",
"assets/assets/img/email.png": "d2f4af3eeb0c123001cc3ab0bb9fa3cf",
"assets/assets/img/time_workout.png": "7c6fff5fd87150f728a21ed7e2067f80",
"assets/assets/img/m_3.png": "ecd381a0819bc7f23dddaaddb443ddbc",
"assets/assets/img/weight.png": "59de5012690875925187797b6042fcd9",
"assets/assets/img/pic_4.png": "2c634aa7520a0c17abaec78fb1416618",
"assets/assets/img/difficulity.png": "50e0f9837c13341b6e033f150c932355",
"assets/assets/img/Vibrate.png": "71dc36bdf9f6951434a97453d3d9c2e7",
"assets/assets/img/c_4.png": "452bec9e3c2df63cd38c4346919e16d2",
"assets/assets/img/video_temp.png": "62d70e69c81c4379c18c7050866367b6",
"assets/assets/img/home_tab_select.png": "c0ad01173170887e957088d97d0a8f85",
"assets/assets/img/bottle.png": "c9a766c83933219b445c136ab6d4afa3",
"assets/assets/img/progress_each_photo.png": "58c9d3e90c32443f69fa3e3467dd0eb9",
"assets/assets/img/p_workout.png": "4306f1a6d5338148718edfb2167ce527",
"assets/assets/img/orange.png": "9f35e183c2114c9da372b9a2f38cd0a0",
"assets/assets/img/carbo.png": "a87eb510fe9ebb1550f869f3dca5b1be",
"assets/assets/img/water.png": "958e11dee246b568c1a62fad96a32bf5",
"assets/assets/img/search.png": "9378acaaa6bf2e5a110765b9e2ff5b44",
"assets/assets/img/pp_6.png": "b42ec377d80ec9daecf4b38afcb127c5",
"assets/assets/img/f_2.png": "4ed558298af87d48e17de474160d17b6",
"assets/assets/img/c_2.png": "5a303550d11c7b374f2df9a5a5af0c1e",
"assets/assets/img/more_btn.png": "b90f7cf197769b41b90f27bb2a19b797",
"assets/assets/img/baking_soda.png": "4e786b515a9451f155fae200d7a6c57f",
"assets/assets/img/foot.png": "aca6345f7d4d2085dc5ce50ef8422c7f",
"assets/assets/img/goal_1.png": "bad78ea317d106357b465583538db194",
"assets/assets/img/what_2.png": "b18b7b48207f52b6f823467d2496a9de",
"assets/assets/img/apple_pie.png": "0cef7515c3409890d43800e22a3234f9",
"assets/assets/img/sugar.png": "36ede388264d49457ffa048bcc22cfe8",
"assets/assets/img/u1.png": "0b18e804f9d85de0ce024ce038f07e53",
"assets/assets/img/on_3.png": "be89f95af32d38ec0d9e33534388485f",
"assets/assets/img/Workout1.png": "2b9c12fd71e4823078db48227e90f78b",
"assets/assets/img/detail_top.png": "a9f86053cd38f40ec9b879679e3fc2e7",
"assets/assets/img/More_V.png": "ad51c55e5465a042f0adc930aea52214",
"assets/assets/img/complete_profile.png": "d1509c21363f4719bc071bcacaf7b8c3",
"assets/assets/img/Repeat.png": "5dd7eaa858fc61351c851569811a54ec",
"assets/assets/img/facebook.png": "42c906f0d34da4e3770aadc5cf7d2e65",
"assets/assets/img/pp_3.png": "7be85b5f3a9e33ebff897776873e7dc7",
"assets/assets/img/share.png": "b89db17802981588cccd5b75c9b463ef",
"assets/assets/img/egg.png": "8a89eaff0fef9107e848ff8cdf0baee7",
"assets/assets/img/p_setting.png": "c864f9c5b5327cccfb8bc4836192bc34",
"assets/assets/img/pic_5.png": "359f407ce96e1ab88e8258a0f3620e6e",
"assets/assets/img/date.png": "70ba8304724724aeff6f08247cc837f5",
"assets/assets/img/HoursTime.png": "fc5a55ccd5ad51c6b90bbf2d57aefdfd",
"assets/assets/img/goal_3.png": "a56df4aef8ee73574056fbfa9976a8b4",
"assets/assets/img/honey_pan.png": "5d6dcb7439762cd7ebe15fd9db905fde",
"assets/assets/img/complete_workout.png": "1a2fdd3d161cf0a3c143bc4f3d3e1e24",
"assets/assets/img/gender.png": "d44e6c85a791dd87a97298481134add6",
"assets/assets/img/u2.png": "315d3ff825b0429749752ffc0a7886a5",
"assets/assets/img/flour.png": "f412ca83c871a5cf3dd2262c3f9a525c",
"assets/assets/img/what_3.png": "ec2ddc1e72ed6f7994691241f89cca5e",
"assets/assets/img/no_bell.png": "9c04457f4509adff045093ba6ce93d21",
"assets/assets/img/closed_btn.png": "c29df36cc5c7711b6021c919bb79c9ac",
"assets/assets/img/salad.png": "c6e962f8fa2352befab89908d9219653",
"assets/assets/img/camera_tab.png": "b08e251b48c001f67c82cf289c60c655",
"assets/assets/img/repetitions.png": "7e71b4eb6bf5810a388fca2c78bf8a6a",
"assets/assets/img/p_privacy.png": "bcc561265d23c7b110074030884402a5",
"assets/assets/img/on_4.png": "57b99c73ce80f7b60a83cd7bf4aa5c51",
"assets/assets/img/notification_active.png": "db4c7abdc4cf2b209ae81875dbcf365b",
"assets/assets/img/img_2.png": "471f944dfdf868745493e1becd64a570",
"assets/assets/img/chicken.png": "0e4481ce6f5454a34f95bf2c65037d08",
"assets/assets/img/skipping_rope.png": "91d0e971e9cbefbbbfbd835b24a25515",
"assets/assets/img/bg_dots.png": "16bdc38a7993e02d0d67a6938eb2238d",
"assets/assets/img/p_notification.png": "cc949cfd7015cddc282bf9b8aa2e63c9",
"assets/assets/img/show_password.png": "35352e98ec8698964e09326a5fadfddc",
"assets/assets/img/pp_5.png": "d65ce0863a86e637f52e274e369c1fba",
"assets/assets/img/pp_1.png": "0f03efa1f146eeb6fdc2f3107b59ef39",
"assets/assets/img/next_go.png": "6d77535e183de2a793a02292bbc4d5cc",
"assets/assets/img/SleepGraph.png": "a12468292443db7920e7004a513f9342",
"assets/assets/img/c_1.png": "3fa8c36d01badbd33c987662c2d06409",
"assets/assets/img/user_text.png": "4422f218035fcab41c5442e4219755e5",
"assets/assets/img/p_activity.png": "27b0cb855b791f5cae13a55935b64c37",
"assets/assets/img/m_2.png": "09dec36ba1164f0f7a694dd78d637125",
"assets/assets/img/bell.png": "246d571e40ba4640b9db9e31a4ae5bc1",
"assets/assets/img/sleep_grap.png": "682a09560018a218a8caf7bcd7ed9a25",
"assets/assets/img/coffee.png": "ef209ff13093591a1d8b6bfbbe1a05df",
"assets/assets/img/choose_workout.png": "285f331dcb1739643d7c769770b9574b",
"assets/assets/img/alaarm.png": "b5e07134440910f3396d98f235205edb",
"assets/assets/img/barbell.png": "1d95fb3c9b45a111dfc24c80d4475e3d",
"assets/assets/img/img_1.png": "95abfbc6eefe555064069b10d3983998",
"assets/assets/img/hight.png": "21b888394dc1e5abeadcc6d03d9d8116",
"assets/assets/img/goal_2.png": "122c69b1648686c3b47307128a8c0d99",
"assets/assets/img/on_1.png": "8752f9226301744c7bd7bfe1afd4ec34",
"assets/assets/img/Bed_Add.png": "3437c345b6eba582f9bc6d55b5ba8134",
"assets/assets/img/Workout2.png": "4cd14acf50e32484599c2f0cbc435b0c",
"assets/assets/img/glass-of-milk%25201.png": "68788d9ebb5c01092e47c22271f9cb25",
"assets/assets/img/f_1.png": "c18c0a00f6d81b7d0b3e760c80023684",
"assets/assets/img/next_icon.png": "55ca725fe292918a5bffdbc0011e4ffc",
"assets/assets/img/m_1.png": "4ed558298af87d48e17de474160d17b6",
"assets/assets/img/black_btn.png": "3a3b2c24f00138d8bff3c81abde5b227",
"assets/assets/img/pp_8.png": "b0f379ffa3d5e8948da53ff07f30554b",
"assets/assets/img/bed.png": "5d392213c160f9b97b321572bd0e75bd",
"assets/assets/img/nigiri.png": "d543a124da90eba3cff311f4a6bf89eb",
"assets/assets/img/activity_tab_select.png": "c5a2764036d64c02db99ea63d99a9768",
"assets/assets/img/what_1.png": "f7960487a861a0040791cd3dd44d328c",
"assets/assets/img/pp_2.png": "e3ff03e36f4b5fdefddb8ab53dd832f3",
"assets/assets/img/c_3.png": "285c30cec225f867bcfbc7b25dcf077d",
"assets/assets/img/profile_tab.png": "f689c938459a11180f06704c144229d8",
"assets/assets/img/profile_tab_select.png": "f9af02d4abd7a90657470a42375e3d07",
"assets/assets/img/date_notifi.png": "cdc49e084478b7476edcb451a81dd0ed",
"assets/assets/img/camera_tab_select.png": "0339805d5f7b96695286bec9476ee154",
"assets/assets/img/p_contact.png": "22e33b39d659e370d9783ce6970a40ba",
"assets/assets/img/on_2.png": "3a8845e6ad6f7f1b6664795ac1350af4",
"assets/assets/img/Filter.png": "2d5797099749326d650a48e3a59631ff",
"assets/assets/img/sleep_schedule.png": "20856764be5386b2520f502220ff0db7",
"assets/assets/img/activity_tab.png": "657b2889675a91e857c3241b6b0bb29e",
"assets/assets/img/oatmeal.png": "cfb9742c991c92b67a238b9bdfed5bd5",
"assets/assets/img/rd_1.png": "28597ee3e19abca071fd5e84382e6d82",
"assets/assets/img/ArrowLeft.png": "8232bb5f5ccb3d7eee261bef19d84ef3",
"assets/assets/img/fav.png": "b294e1ea492d61321c83a09cf19def92",
"assets/assets/img/welcome.png": "1d1809e2d4c0702be86b4e016d9062c0",
"assets/assets/img/proteins.png": "6d32c61e949866a6b3a1f0c22db1744b",
"assets/assets/img/pp_4.png": "edc467882c4dfe237cc5ec4bdbbab7e0",
"assets/assets/img/lock.png": "f309389b6ae1525868b4b020a484a3bb",
"assets/assets/img/burn.png": "5054e701f1b6bcfab8b175d91e196ea9",
"assets/assets/img/ArrowRight.png": "03379d566b66af009ad1a496e068a2ec",
"assets/assets/img/time.png": "fbc700b6a013c881eacbc8078ec59dc9",
"assets/assets/img/p_achi.png": "db47a038d2147d75f2bb717fefd8b30e",
"assets/assets/img/p_next.png": "64742f0e884fc4cd1dd1d3fdd869cf6d",
"assets/assets/img/home_tab.png": "3bde55559793407d1e59d4ea4548f26c",
"assets/assets/img/pancake_1.png": "80f0e91ea47e494aaf324253ffc79493",
"assets/assets/img/p_personal.png": "b656b2a75dd1437862f544c182af5c6d",
"assets/assets/samples/animations/grid_magnification.png": "41f29b27e0ebe06677eb922e2d0662a9",
"assets/assets/samples/animations/custom_caret.png": "20981f24710cf990547de0fc7afeb02b",
"assets/assets/samples/ui/rive_app/course_rive.png": "d44d0e167f27418546a2d99637026da7",
"assets/assets/samples/ui/rive_app/images/google.png": "95a2a6024c4a7e190802c77310a26b8b",
"assets/assets/samples/ui/rive_app/images/logo_apple.png": "0076612741142de81e9fb1f30143fa84",
"assets/assets/samples/ui/rive_app/images/logo_google.png": "3820293fc4e437b143f322f9508e53e8",
"assets/assets/samples/ui/rive_app/images/logo_email.png": "5fe423ad3604e1dbe76d28abb4e5ff32",
"assets/assets/samples/ui/rive_app/images/backgrounds/spline.png": "ff232f0cf3ebd732ca4383c381450714",
"assets/assets/samples/ui/rive_app/images/icon_email.png": "d51efbd50789a569a1e4a37c261ba1ab",
"assets/assets/samples/ui/rive_app/images/icon_lock.png": "6304d0d510c62248bdd66496eda1aa29",
"assets/assets/samples/ui/rive_app/images/logo_google111.png": "2b6687b80bdccdf64a6ebccb12aefc80",
"assets/assets/samples/ui/rive_app/images/topics/day.png": "43db5d757865c1c713d63da0677c7a40",
"assets/assets/samples/ui/rive_app/images/topics/exam.png": "9746cec71d25bd4bce0a7c752c309cd0",
"assets/assets/samples/ui/rive_app/images/topics/topic_1.png": "39f4beb48bac22f2e10895a831a4e7a6",
"assets/assets/samples/ui/rive_app/images/topics/mood.png": "28c7c2ef4d6ea3068caa8e40db4e4a6d",
"assets/assets/samples/ui/rive_app/images/topics/topic_2.png": "6890179d440608f2f6795e9ee8e6c288",
"assets/assets/samples/ui/rive_app/images/topics/smart.png": "514e72cee45fcfa8c0a70de78be8ff51",
"assets/assets/samples/ui/rive_app/images/topics/brain.png": "86835ffa75fab62680ec5b703b65a465",
"assets/assets/samples/ui/rive_app/images/topics/beat.png": "25689ed0924f28f7d54f19c5481dee70",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_2.jpg": "9eecb4a8f2da90198bf8c4f8c3e8c527",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_4.jpg": "95617f142e8dcfa6547ea80557eee016",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_5.jpg": "405a74c93f4806312fcd25e7722d9f90",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_3.jpg": "4431bc261ac4f57a09dc1e041b32b4d1",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_default.jpg": "fe9d7eaf1b437a1e6c84f1e6fdb77dcf",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_1.jpg": "60f969aae689291e30cffc6deafd1ec2",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_6.jpg": "57b1f154ef47c7a76a78544e9e6af44f",
"assets/assets/samples/ui/rive_app/rive/shapes.riv": "8839d67714d5e9c52b3e0dbb2b1e89c1",
"assets/assets/samples/ui/rive_app/rive/confetti.riv": "ad0d13cbea799085305316f0e8118274",
"assets/assets/samples/ui/rive_app/rive/check.riv": "14f9269423eabd7e2e10cafdc6ad4d41",
"assets/assets/samples/ui/rive_app/rive/icons.riv": "3d29f9acebef13f01f371b59e84e664b",
"assets/assets/samples/ui/rive_app/rive/button.riv": "c8ffe2900d31d8236247928cd7c2b5f3",
"assets/assets/samples/ui/rive_app/rive/menu_button.riv": "f8fdfd9fd8dc7873dfac6f005f3233c1",
"assets/assets/load.gif": "27cb154468c0b7b0e53ddbbb5f371b8b",
"assets/assets/Animation%2520-%25201710690508452.json": "f40cdc322aa8ac3cf6591bd77cda605d",
"assets/assets/success.json": "394a29335d1047fd4cc193884f887f66",
"assets/assets/loading.json": "2dbb8becdab761137771650f03eb0ff2",
"assets/assets/images/doc_icon.png": "8ec4b30a103dc007f0d30c57a2f648ab",
"assets/assets/images/doctor_5.png": "1256378e995d092978eb4c6dacf88b1b",
"assets/assets/images/icon-config.png": "544b1f9d52969d86233ae8d2dc914417",
"assets/assets/images/timesnewroman.ttf": "6ec58d1ea836b7ef69f94ea6770972a3",
"assets/assets/images/avatar.webp": "82797187a600f5ea58280c1463f110e9",
"assets/assets/images/man1.png": "07b50ee4618e0c61bd37a2f0b393f50e",
"assets/assets/images/feedbackImage.png": "5f8e9064f54cf51a70fee2da78a5b014",
"assets/assets/images/doc3.jpg": "72ad828c25d5c34fe9bd85ba7fd6582f",
"assets/assets/images/doc2.jpg": "86d47f090f85f30f6febf1ec0415e05e",
"assets/assets/images/9.jpg": "45cb232a09c8dcc97c58a35b5104e8b8",
"assets/assets/images/doctor_4.png": "12a79947c97041cb700a0cf4aea77d76",
"assets/assets/images/info-pattern.png": "2c3e10c009d6778410a92c794023b881",
"assets/assets/images/logooo.png": "f692e11b6fe41775523ec3da8ad69d4e",
"assets/assets/images/woman.png": "277f563539ec1c890966d9d6cdecb7a8",
"assets/assets/images/assess.png": "c4317f471160a4d18b10332dd754a79f",
"assets/assets/images/no_data.jpg": "7b8f996f00e9adcdb963d2e5befb5a41",
"assets/assets/images/4.jpeg": "0c4bc590aa5b96fa93bb7dfd562fd0ed",
"assets/assets/images/home_doc.png": "f400d30481b5d3f2d3325dbf1bc6737b",
"assets/assets/images/check.gif": "617d50c87990907ebe372950082dd40d",
"assets/assets/images/splash.jpg": "04a9f8d7ac1047a738dc4bef769571f6",
"assets/assets/images/doc1.png": "7044bd9338088baf55d02189f78c0f65",
"assets/assets/images/doctor_1.png": "6d3550b615ac00eb558978b4318ede92",
"assets/assets/images/mood-1.png": "a7d4bc82fbd28df17cfcdd58f7344d6a",
"assets/assets/images/pacman.svg": "a0b93ff48db0ca5d0bcdc417f0aabb6f",
"assets/assets/images/photo_2019-05-05_15-18-38.jpg": "23ec1e4366dd0862dc1393ad67e222b2",
"assets/assets/images/person.svg": "a7244c96f59b6e302e7718f8f7a9ad0d",
"assets/assets/images/icon-fingerprint.png": "028685a721b441d85109ad98b99f7846",
"assets/assets/images/info-goal.png": "72695131eb3e662cd6f25f24f7e7b46c",
"assets/assets/images/icon-info.png": "5de0f3aba2162f304d7388678faedf86",
"assets/assets/images/cat-2.png": "41e01ca310130d03ca2554b364e16ced",
"assets/assets/images/cat-5.png": "4e4b4d098da6043fe51347989b3b3061",
"assets/assets/images/med_rem.png": "2c53425bfd8bfc04b60a7a698fdf38e4",
"assets/assets/images/cat-3.png": "1f583a6e991b15dac97ca66d63c2b0b0",
"assets/assets/images/5.jpg": "1573614982e82f9ce3d54536c9a516c2",
"assets/assets/images/Online%2520Doctor.gif": "70f59ae71a3e1f1ab2a884580062bf12",
"assets/assets/images/6.jpg": "d6ed00f99dea77727392ef0721553e76",
"assets/assets/images/man.png": "91d5ff1e0d69a0a4b1654f7f987a78ea",
"assets/assets/images/Online%2520Doctor%2520(1).gif": "1c3dc4bbdf04b8f4e052f7235c11ecfd",
"assets/assets/images/12.png": "c65e082aba52fef280399661052a72e5",
"assets/assets/images/Doctor.gif": "da401efded8fdd42ac8ac8835a8b9530",
"assets/assets/images/10.jpg": "492c527a5b5ce60c2dea6241b8a0422c",
"assets/assets/images/female.svg": "3e527c900fa16464de86814a4e8ceb5f",
"assets/assets/images/male.svg": "d56e79aabb117e58352111d14d2ab1e8",
"assets/assets/images/info-mental.png": "9fd967b99ed949308187fc7ee602fcd3",
"assets/assets/images/info-awareness.png": "52b4772ff4886d103df70ae27be02462",
"assets/assets/images/chat.png": "385a5c4b4d37594274ebc925f4b54154",
"assets/assets/images/mood-5.png": "01f4bb0ba771161758ce64b65b35e143",
"assets/assets/images/1.jpg": "a0c14fb8f5521c46321949010ebdc8ff",
"assets/assets/images/44.ttf": "bf0b095558051b2104dda386d038d3c2",
"assets/assets/images/7.jpg": "e453e2dd0a93684387b61c0db023237c",
"assets/assets/images/8.png": "6fa9772c546ff5615617b59877e32ada",
"assets/assets/images/other.svg": "404aec44a68588379ce82bf7aaf88bdc",
"assets/assets/images/Retroviruses.gif": "0ef858a507840f96f6d08113209a63b2",
"assets/assets/images/cat-1.png": "2f506ae0a1c3435fc5391ad6603f874c",
"assets/assets/images/icon-marker.png": "2ff3727360b6d7f275e798a0a81cd7c9",
"assets/assets/images/3.jpg": "768f1ca00176c8924b8fbc1d8f94b36e",
"assets/assets/images/gender_arrow.svg": "6dbf710ccb91d31308bde26eedb51487",
"assets/assets/images/ff.gif": "127191d131a93228f3424b8d0be280d5",
"assets/assets/images/2.jpg": "57325fe557a79a73987b9ad2644e1196",
"assets/assets/images/doctor_icon1.png": "44b4e683065077891b9622438fbabae9",
"assets/assets/images/user.svg": "b457841a756b767be761c8c6df53e21a",
"assets/assets/images/app_logo_white.png": "94cee64061d54374f7ba458e8680610e",
"assets/assets/images/doctor_3.png": "16733ed548147699b50ea69ced5b72a1",
"assets/assets/images/Fitness%2520tracker.gif": "e9ee0befae8c8df8126cee7892f52642",
"assets/assets/images/fitness.jpg": "dc3f29b36d16c0554d3b4c5380b56675",
"assets/assets/images/info-track-progress.png": "39c31f52a6551a5b7a2cce0b279d53a4",
"assets/assets/images/app_logo.png": "2854d081b1c78a1d65476d0fef154175",
"assets/assets/images/model.h5": "c72d3ec01059f8ce4cd52bd8bc7f0319",
"assets/assets/images/info-improve.png": "a1e800858a9663f830dfcd807c91577f",
"assets/assets/images/Sport%2520family.gif": "60c0c266170eecaa2fd9155c2213370f",
"assets/assets/images/icon-chart.png": "d48c239c1b9bdf60f56b3ced425c6c58",
"assets/assets/images/photo_2019-05-05_15-18-42.jpg": "e9c518ec97f67cda0e444bb6acf453f6",
"assets/assets/images/mood-4.png": "3881f00f39e2837a7351aa0ec48940f7",
"assets/assets/images/doctor.png": "52b16185f3e39a73959bc292def18ba0",
"assets/assets/images/11.jpg": "72e0fd49be8d7695f7ce22855180e275",
"assets/assets/images/mood-2.png": "54fdcf0f39151cc6634dd37054505eeb",
"assets/assets/images/weight_arrow.svg": "b562dd16b4389a9ca735ccdbb97f19d2",
"assets/assets/images/doc4.jpg": "84c3fdada3b2b9a7e7873dae69e8c806",
"assets/assets/images/mood-3.png": "9e0810ec2acebf1784dcb534ff8ed4e6",
"assets/assets/images/icon-calendar.png": "cd4d3ea7661ea2cc7e04c209df3d6ec9",
"assets/assets/images/cat-4.png": "9f1eac3c6c7a171cad8c12afaa287d3e",
"assets/assets/images/mood-button.png": "89b8ac7199fcb2d4e36d1112f6dcc906",
"assets/FontManifest.json": "ab87b9c822c5cb6d501b45e322d50a94",
"assets/AssetManifest.bin": "5ca8685fa24fb89d6348a9625bba551f",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
