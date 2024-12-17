import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:dating_app/app/modules/reels/models/reel_model.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:video_player/video_player.dart';
import 'components/like_icon.dart';
import 'components/screen_options.dart';

class ReelsPage extends StatefulWidget {
  final ReelModel item;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;
  final SwiperController swiperController;
  final bool showProgressIndicator;
  const ReelsPage({
    Key? key,
    required this.item,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
    this.showProgressIndicator = true,
    required this.swiperController,
  }) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
    print('========');
    // if (!UrlChecker.isImageUrl(widget.item.url) &&
    //     UrlChecker.isValid(widget.item.url)) {
    //
    //
    // }
  }

  Future<void> initializePlayer() async {
    try {
      _videoPlayerController = VideoPlayerController.network(widget.item.url);
      await _videoPlayerController!.initialize();
      final aspectRatio = MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height;

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        showControls: false,
        looping: false,
        aspectRatio: aspectRatio,
      );
      setState(() {});
      _videoPlayerController!.addListener(() {
        if (_videoPlayerController!.value.position ==
            _videoPlayerController!.value.duration) {
          widget.swiperController.next();
        }
      });
    } catch (e) {
      debugPrint('Error initializing video player: $e');
    }
  }

  @override
  void dispose() {
    // Safe disposal
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
    }
    if (_chewieController != null) {
      _chewieController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getVideoView();
  }

  Widget getVideoView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _videoPlayerController != null &&
                _videoPlayerController!.value.isInitialized
            ? FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GestureDetector(
                    onDoubleTap: () {
                      if (!widget.item.isLiked) {
                        _liked = true;
                        widget.onLike?.call(widget.item.url);
                        setState(() {});
                      }
                    },
                    child: Chewie(
                      controller: _chewieController!,
                    ),
                  ),
                ),
              )
            : Skeletonizer(
                enabled:
                    true, // Enable skeleton effect based on the loading state
                effect: PulseEffect(
                    from: AppColors.black.withOpacity(0.5),
                    to: AppColors.black.withOpacity(
                        0.40)), // The animation effect for the skeleton // Placeholder container color
                child: Container(
                  height:
                      MediaQuery.of(context).size.height * 1, // Example child
                  width: MediaQuery.of(context).size.width * 1,
                  color: Colors.white, // Background of the actual content
                ),
              ),
        if (_liked)
          const Center(
            child: LikeIcon(),
          ),
        if (widget.showProgressIndicator &&
            _videoPlayerController != null &&
            _videoPlayerController!.value.isInitialized)
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: VideoProgressIndicator(
              _videoPlayerController!,
              allowScrubbing: false,
              colors: VideoProgressColors(
                backgroundColor: AppColors.white,
                bufferedColor: AppColors.white,
                playedColor: AppColors.primary,
              ),
            ),
          ),
        ScreenOptions(
          onClickMoreBtn: widget.onClickMoreBtn,
          onComment: widget.onComment,
          onFollow: widget.onFollow,
          onLike: widget.onLike,
          onShare: widget.onShare,
          showVerifiedTick: widget.showVerifiedTick,
          item: widget.item,
        )
      ],
    );
  }
}
