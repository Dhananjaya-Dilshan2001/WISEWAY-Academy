'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "4e920c850faec35e9c0036331e565d4b",
".git/config": "5533656a72c35fc53c805789eb7cd11b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "35d89f8f480f20b956eb432be6951fa0",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "d2def394f3430d9ca1becaa6fc452e44",
".git/logs/refs/heads/main": "0d22f090bc9d87033258cafbbaa268ef",
".git/logs/refs/remotes/origin/main": "abb07bae9fb54c7137d2648226ab49c4",
".git/objects/03/2fe904174b32b7135766696dd37e9a95c1b4fd": "80ba3eb567ab1b2327a13096a62dd17e",
".git/objects/1e/53fdf24ade71c5313b7f9ca8fcf0279887d7f3": "2d1e390684dbb67b694639547c68b684",
".git/objects/1f/c0f33705c4aed6eadac32364f27fe1fe5e0e10": "270715b914224470d2fd561523965556",
".git/objects/20/6381891dfcb979a90f07aaa788b1815f245bfd": "fcc18b7d6763fcf26f5c0751355b7c87",
".git/objects/20/6aa4ada75714e2df6709c7b51bc1276c191388": "66f3be8d7c9e195e0ac70b5829e68407",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/26/108184661e36329982e148ea35a5143d6f577a": "f8cc1eeca18bd01b4724b8c2fb5cbebb",
".git/objects/33/31d9290f04df89cea3fb794306a371fcca1cd9": "e54527b2478950463abbc6b22442144e",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/38/f72c3b661274731c0dca4263c6147292c3313e": "06ec909689545717240ec77454003efe",
".git/objects/3c/8137deb82507613577b6015521d4170903a97d": "def68eae75d2ebaf481a1830b7f59e75",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/47/4ac8fb5f7d186064fe80f2b26bb33006e17ab2": "20f7790ac60c48c4b1f25f4efc410a7d",
".git/objects/47/74555e347bb70351c4af2db9932a0cd039cf9a": "63a02b04d5c84ceb0a33b53404a5fa70",
".git/objects/4d/2210bd02dbfb529a9114e54551c1b8c4f3b283": "b2ada57b7fe589c9dc07dcae9f86a9da",
".git/objects/4f/02e9875cb698379e68a23ba5d25625e0e2e4bc": "254bc336602c9480c293f5f1c64bb4c7",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/5a/13bd5a18e506d22647433b1980295ce67bcebe": "50b077c2b68b737800ac0d99a322b746",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/63/6a0f9972cb52c405fcefcb30f2ff1549d67529": "d79974cd07387eb256b5846bc4c49c91",
".git/objects/64/5116c20530a7bd227658a3c51e004a3f0aefab": "f10b5403684ce7848d8165b3d1d5bbbe",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/73/d99001496b5606ba0e67b9289aa8b96e8f7ac4": "b3dc6083da961ed682b515dc63298d50",
".git/objects/78/2a63765671ec8c45bdc6756d91dd9228d60e6f": "9f342fe851c26b6d2206b3626aa417ea",
".git/objects/7c/047e2db1c1f74f315d43cf8057e94851a5136a": "daade07ffc3e6a96ce2755fa9db93712",
".git/objects/7c/5dcebe26f55305b1db9b5b134aa372814da5c0": "9cb53c7abce905a9ae5774ad29c1db2c",
".git/objects/82/370d128e0d3cbc6da491d7fbfeda64ca3cfb44": "ef2cd1c4252bbdc8da80ef99facfca0b",
".git/objects/86/a90168ae8b5f9ec67e0c5285e171f408039f36": "d4c03b159abffef416278ecd315b22ba",
".git/objects/87/6f9955fd3f15a7a323734f7a58d5caba80dd44": "9319ce02fc9bb966c7c4db499ca5c160",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/88/f0fa3f98162fea81d5364e5620e0ab0e7188d8": "2b0bb075b8e80e327e7fb384e52bff53",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/9e/7c215af8040988219e2b195a37fb4cd1fdcdd5": "65e52e807a5843aa75497344cc44c74e",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/a6/fa3b623aa46f90acd1749a8ff841d1fea3c980": "864a3fbe97548e81746b0118377ccd93",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/ac/a8f6b4f7d59fe6dda6428cf26676a579a7a244": "c918e4e44d443d27fd103e624a96fb3f",
".git/objects/b0/56fc07720b92f64d0188e8f39a9471ef41f330": "99f9ac47d404cdc5d817a3a8b1ae8cd8",
".git/objects/b7/39a891efaa14b1e7cfd534e38e5c9a2dd2a681": "ca51401bbd45ed666c4f68e9a6b70e23",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/78b84572dcce4a93487c320dfa43e582b6d073": "dd35d19a1df010fb9b2c451c7953fb15",
".git/objects/bc/7390243567abe2e5bf5b4028ad9bb9802761d2": "fcb26753e9bedfb84561cb6cb47bb4e8",
".git/objects/c7/351e2bdd29bad7c61c46821274c58a1695377f": "a3113d66f92895c7864af01a260195f2",
".git/objects/ce/c6ef8344d319751d3e6542efe66b4c89af1231": "8e141bb5b6879f7fd96b05a4d4f76f35",
".git/objects/ce/e3c5bb4ad9ca1b7e02e3391cc1cbba998308b7": "8e23cc0d8eea61c17a30b19ec3ccb417",
".git/objects/d4/0e0881a7d58683a5c8e9b7180a0f8cb920cd65": "204ecff5f056e5b819758e4bb4bfd797",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/47a0c2e637d91652c4820bcb9f9c923ac64157": "090690f81764b1525c0068677e55c902",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/e5/c26f7793334a9b4c4629e4b45ab284924bdf11": "83b9ccd99de7752850c9b90d957c8d44",
".git/objects/e9/16d47008084689055cf100440ed0dfa7bf4765": "43edcabb77113e1e2bb86d4cf95ac07f",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/f1/c8827ac7d7f42599afb993465ce7e62d3892c9": "9a3cbed7e957284041112ab617b8a9ee",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/f4/ebae7c665bb7a67425b109dbc6ddaaefb08dfd": "6ab0583ad7c1e28009e53007a23aa22e",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/d4bf6102491a7358ca7905a6d6f0632c9aa262": "652377bef1995c2e8afc647c551794f2",
".git/objects/fb/301c741336e74099007467f023ee191d2df57a": "6e126c9be7e86429f165ccd9764149c9",
".git/refs/heads/main": "50cc2ac1fd8fba140050e4aa50e29eb9",
".git/refs/remotes/origin/main": "50cc2ac1fd8fba140050e4aa50e29eb9",
"assets/AssetManifest.bin": "f6f7c16cf2e82759c01b059f1c5421a6",
"assets/AssetManifest.bin.json": "0e0e53dfa8e4fe913438c90bca365124",
"assets/AssetManifest.json": "a777fba24646911be99ad4a0b63ed0de",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "ca9f22d1b08aa7b011f6fbf9f33ba410",
"assets/Image/appIcon%2520-%2520old.png": "205565d3aada0804526616453d5cd5ab",
"assets/Image/appIcon.png": "baf1bc4e9eee856d20bd6bbdf3e2715b",
"assets/Image/cash%2520flow.png": "85026aeea3b15673a0372a41f79cca69",
"assets/Image/fb.png": "d7d2b17c1c33013f2083d314315b9f79",
"assets/Image/generate.png": "26dd2cd7af5687165773fddbb5aac5ec",
"assets/Image/insta.png": "82c1ca1c6a22b900d07697f41aab3c65",
"assets/Image/linked.png": "062f55b7fb89f6ab2d5149871be8352d",
"assets/Image/pending.png": "20acac0b976d5bb8de374b878b1dfb1e",
"assets/Image/scan.png": "1fbb1d3415aa161c59aa2782c290c613",
"assets/Image/search.png": "d16c8801280ffaa9e064e11137d96d4d",
"assets/Image/star.png": "59428dc22ba25cb56e88d78a7df4b6ad",
"assets/Image/start%2520paper.png": "0a0d03d124bbe829a117aff9ad7d5be0",
"assets/Image/student%2520list.png": "be17f1be6871e256c6049fa7f2155b8e",
"assets/Image/studentP.png": "bb8eafc70aba834fda2c26ff13d9c3cd",
"assets/Image/wiseway%2520logo%2520-%2520old.png": "8ed690df8b2eaff6f8dd3ba74f0fb44f",
"assets/Image/wiseway%2520logo.png": "baf1bc4e9eee856d20bd6bbdf3e2715b",
"assets/NOTICES": "799151e738b15cf12888c456cbf5123e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "c7748fbfad80e80e4172a748a944a890",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "c83f127256ec9da97efc55d89e45c715",
"/": "c83f127256ec9da97efc55d89e45c715",
"main.dart.js": "95de441859cbe0777889ba407f532f89",
"manifest.json": "ecb1911cb08f2a244c3fa759b313c755",
"version.json": "d1c724c29524d22d4ed69cfddb6f52c1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
