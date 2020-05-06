@echo off    
for /R %%f in (*.mp4 *.mkv *.avi) do (call :detect "%%f")
goto :EOF


rem Begin String Detection

:detect
setlocal enableextensions enabledelayedexpansion
set input=%~1
set str1=%~nx1
set qual=18

rem Filenames with groups
if not x%str1:x264.ac3-=%==x%str1% goto :x264_ac3
if not x%str1:x264.aac-=%==x%str1% goto :x264_aac
if not x%str1:x264-=%==x%str1% goto :x264_noaudio
if not x%str1:x264.eac3-=%==x%str1% goto :x264_eac3
if not x%str1:h264.ac3-=%==x%str1% goto :h264_ac3
if not x%str1:h264.aac-=%==x%str1% goto :h264_aac
if not x%str1:h264.eac3-=%==x%str1% goto :h264_eac3
if not x%str1:xvid.mp3-=%==x%str1% goto :xvid_mp3

rem filenames without groups
if not x%str1:x264.ac3.=%==x%str1% goto :x264_ac3_ng
if not x%str1:x264.aac.=%==x%str1% goto :x264_aac_ng
if not x%str1:x264.=%==x%str1% goto :x264_noaudio_ng
if not x%str1:x264.eac3.=%==x%str1% goto :x264_eac3_ng
if not x%str1:h264.ac3.=%==x%str1% goto :h264_ac3_ng
if not x%str1:h264.aac.=%==x%str1% goto :h264_aac_ng
if not x%str1:h264.eac3.=%==x%str1% goto :h264_eac3_ng
if not x%str1:xvid.mp3.=%==x%str1% goto :xvid_mp3_ng

echo No strings found
goto :EOF


:x264_ac3

set end=ReEncodedByBallzTV.mkv
set output=%input:x264=HEVC%
set endbit=%output:*HEVC.AC3-=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)
goto :EOF

:x264_aac

set end=ReEncodedByBallzTV.mkv
set output=%input:x264=HEVC%
set endbit=%output:*HEVC.AAC-=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:x264_noaudio

set end=ReEncodedByBallzTV.mkv
set output=%input:x264=HEVC%
set endbit=%output:*HEVC-=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:x264_eac3

set end=ReEncodedByBallzTV.mkv
set output=%input:x264=HEVC%
set endbit=%output:*HEVC.EAC3-=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:h264_ac3

set end=ReEncodedByBallzTV.mkv
set output=%input:h264=HEVC%
set endbit=%output:*HEVC.AC3-=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:h264_aac

set end=ReEncodedByBallzTV.mkv
set output=%input:h264=HEVC%
set endbit=%output:*HEVC.AAC-=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:h264_eac3

set end=ReEncodedByBallzTV.mkv
set output=%input:h264=HEVC%
set endbit=%output:*HEVC.EAC3-=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:xvid_mp3

set end=ReEncodedByBallzTV.mkv
set output=%input:XviD.MP3=HEVC.AAC%
set endbit=%output:*HEVC.AAC-=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a aac -b:a 128k -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:x264_ac3_ng

set end=-ReEncodedByBallzTV.mkv
set output=%input:x264=HEVC%
set endbit=%output:*HEVC.AC3=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)
goto :EOF

:x264_aac_ng

set end=-ReEncodedByBallzTV.mkv
set output=%input:x264=HEVC%
set endbit=%output:*HEVC.AAC=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:x264_noaudio_ng

set end=-ReEncodedByBallzTV.mkv
set output=%input:x264=HEVC%
set endbit=%output:*HEVC=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:x264_eac3_ng

set end=-ReEncodedByBallzTV.mkv
set output=%input:x264=HEVC%
set endbit=%output:*HEVC.EAC3=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:h264_ac3_ng

set end=-ReEncodedByBallzTV.mkv
set output=%input:h264=HEVC%
set endbit=%output:*HEVC.AC3=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:h264_aac_ng

set end=-ReEncodedByBallzTV.mkv
set output=%input:h264=HEVC%
set endbit=%output:*HEVC.AAC=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:h264_eac3_ng

set end=-ReEncodedByBallzTV.mkv
set output=%input:h264=HEVC%
set endbit=%output:*HEVC.EAC3=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a copy -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:xvid_mp3_ng

set end=-ReEncodedByBallzTV.mkv
set output=%input:XviD.MP3=HEVC.AAC%
set endbit=%output:*HEVC.AAC=%
call set output=%%output:!endbit!=!end!%%

title "Current File - %output%"
IF NOT EXIST "%output%" (
ffmpeg -i "%input%" -metadata title="%output%" -c:v hevc_nvenc -rc constqp -cq %qual% -rc-lookahead 32 -g 600 -c:a aac -b:a 128k -c:s copy "%output%"
) ELSE (
echo File Exists - Skipping
)

goto :EOF

:EOF
