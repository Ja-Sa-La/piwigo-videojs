{html_head}
<link href="{$VIDEOJS_PATH}video-js-7/video-js.min.css" rel="stylesheet">
<script src="{$VIDEOJS_PATH}video-js-7/video.min.js"></script>
<style>
.video-js{ margin: 0 auto; }
</style>
{/html_head}

{literal}
<video id="my_video_1" class="video-js" {/literal}{$OPTIONS}{literal} poster={/literal}"{$VIDEOJS_POSTER_URL}"{literal} datasetup='{}' x-webkit-airplay="allow">
{/literal}
{if not empty($videos)}
{foreach from=$videos item=video}
{literal}    <source src={/literal}"{$video.src}"{literal} type='{/literal}{$video.ext}{literal}'>{/literal}
{/foreach}
{/if}
{literal}
    <p>Video Playback Not Supported<br/>Your browser does not support the video tag.</p>
</video>
{/literal}

{footer_script}
{literal}
    function setVideoDimensions() {
    function adjustPlayerSize() {
    var screenWidth = window.innerWidth;
    var newPlayerWidth = screenWidth > 1300 ? screenWidth / 1.5 : screenWidth;
    player.width(newPlayerWidth);
    var aspectRatio = 16 / 9;
    var newPlayerHeight = newPlayerWidth / aspectRatio;
    player.height(newPlayerHeight);
    }

    adjustPlayerSize();

    window.addEventListener("resize", adjustPlayerSize);};

    const player = videojs("my_video_1");

    player.ready(function(){
    player.loop(true);
    setVideoDimensions();
    player.play();
    });

{/literal}
{/footer_script}
