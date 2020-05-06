# batch_scripts
My Batch File Collection. Mainly for converting media files using NVIDIA HEVC with FFMpeg.

Usage - no_spaces.bat

Does exactly what it says, removes spaces and replaces with . (period) on all files in a folder


Usage - all_files.bat

**NOTE** This script is designed to work with scene style filenames only!
If you have filenames with spaces in them use my no_spaces.bat script first

1. Place all_files.bat along with ffmpeg.exe (built with nvenc enabled) into a folder
2. Run all_files.bat This will recursively scan folders for mp4, mkv & avi files
3. If any files are found it will look for the following :-

    Files with group names at the end (eg my.file.x264.aac-MyGroup.mkv)
    
    x264.AAC-, x264.AC3-, x264-, h264-, h264.AAC-, h264.AC3-, x264.EAC3-, h264.EAC3-, XviD.MP3- 
    
    Files without group names at the end (eg my.file.x264.aac.mkv)
    
    x264.AAC., x264.AC3., x264., h264., h264.AAC., h264.AC3., x264.EAC3., h264.EAC3., XviD.MP3.
    
4. If found it will replace the video string with HEVC and proceed to convert the file.
5. If the audio detected was mp3, it will encode to AAC. Otherwise audio is stream copied.



