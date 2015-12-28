To get the day 3 stuff to build, I needed to make a couple adjustments:

1. For some reason cmake found an old SYSROOT before I upgraded xcode. This may just be a cache issue, and may not be needed for a clean (no CMakeCache.txt) build.

```cmake -DCMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk```

2. After installing xcode, it did not find the lua shared lib. After much googling determined xcode didn't have ```/usr/local/lib``` on its library search path. Googling suggests this
change won't stick and will be needed in new shells.

```export LIBRARY_PATH=/usr/local/lib```


