'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/favicon.png": "e94e2a82fde16d2ac04c1ac95f42ce9c",
"/manifest.json": "0869184627e2c20e35064ef8deb13bc8",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/assets/AssetManifest.json": "5e63fdfed0d14c11c5fff28a2e851a46",
"/assets/LICENSE": "39617b510f7572bf4b6938af00e271b5",
"/assets/assets/images/logo.png": "e94e2a82fde16d2ac04c1ac95f42ce9c",
"/assets/assets/fonts/Abel-Regular.ttf": "afc1550a0b170efd8f270a8316c85da7",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "2abd86f90b3fd9d18d950195282cd8d5",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/FontManifest.json": "bb04d3506b9394c37925c466a3696250",
"/main.dart.js": "1af705e03fa93e64c1f3412daa8ba71a",
"/index.html": "3908125d49c1dbe247e9954db5491ed0"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});