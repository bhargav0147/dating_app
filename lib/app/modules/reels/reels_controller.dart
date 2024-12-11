import 'package:get/get.dart';

import 'models/reel_comment_model.dart';
import 'models/reel_model.dart';

class ReelsViewController extends GetxController{
RxList<ReelModel> reelsList = [
  ReelModel(
      'https://scontent-fra3-2.cdninstagram.com/o1/v/t16/f2/m86/AQPBXq72RiSFg7qeR4oebYFOXkeg9Lz2V_kAYVlnwt3GvgOLYukb80UQ8QI8ObnyR90yetZuaujo_E461hnt6GFQ1W8W3wP4AfL9svI.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjYxMjczMTIyMTA5NDQ2NCwidmVuY29kZV90YWciOiJ4cHZfcHJvZ3Jlc3NpdmUuSU5TVEFHUkFNLkNMSVBTLkMzLjcyMC5kYXNoX2Jhc2VsaW5lXzFfdjEifQ&_nc_ht=scontent-fra3-2.cdninstagram.com&_nc_cat=101&vs=f63339aa589bc5b8&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC81NzRBMzlFMDNGMEZFRUM3MjU4QThFRjkyRjg2MDg4Ml92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dETUkteHNSb2ZFSThWVUVBRUI3S3QtLUxWazVicV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJoDBtazT0ZYCFQIoAkMzLBdAQbul41P3zxgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYBAxC8CgZM4b6hxRgIgehkVla6_ia7yutaZN-Xuq4-bQg&oe=675AF9FE&_nc_sid=1d576d',
      'Bhargav Kalariya',
      likeCount: 2000,
      isLiked: true,
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
      'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
      commentList: [
        ReelCommentModel(
          comment: 'Nice...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
        ReelCommentModel(
          comment: 'Superr...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
        ReelCommentModel(
          comment: 'Great...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
      ]
  ),ReelModel(
      'https://scontent-fra3-2.cdninstagram.com/o1/v/t16/f2/m86/AQMsFeu-66qQeD6U-X7DOScHWv5b6gULZZEc9m3r8cZY7fjkeA2CzsAx295oeIV3vZ1JtMjD8vF-n35LntWb9k63meHYVgPhsMKXv4U.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjEyNzI5ODgyNDM5NDAyOTcsInZlbmNvZGVfdGFnIjoieHB2X3Byb2dyZXNzaXZlLklOU1RBR1JBTS5DTElQUy5DMy43MjAuZGFzaF9iYXNlbGluZV8xX3YxIn0&_nc_ht=scontent-fra3-2.cdninstagram.com&_nc_cat=110&vs=7b6ed697e484d0c6&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9ENDRDREUxRjM5MzA2MEIwQUQ1Q0I4RjRGNkJCMTI4Rl92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dMTVRfQnVTZ29JWmQxQUlBSXNFdjcxZHFadzNicV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJpLPqsHV8cIEFQIoAkMzLBdAVkqfvnbItBgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYCoF15PfhsPHvdLVfxnI0bZk6TSALKew-sBbMFCcaya7g&oe=675B27BF&_nc_sid=1d576d',
      'Darshan Patil',
      likeCount: 2000,
      isLiked: true,
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
      'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
      commentList: [
        ReelCommentModel(
          comment: 'Nice...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
        ReelCommentModel(
          comment: 'Superr...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
        ReelCommentModel(
          comment: 'Great...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
      ]
  ),ReelModel(
      'https://scontent-fra3-2.cdninstagram.com/o1/v/t16/f2/m86/AQPvFT-o7vT6LwLtbF5lVR9Nrwzw1I9VtqehMY6izmD6x5rxO2XiINcCukZSRfPN2wvN6h5B7ChFtk_X5K-eMhWwAiu1jZeGmbGBDzs.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjg5OTg1MjcxNTY5MDgyMTYsInZlbmNvZGVfdGFnIjoieHB2X3Byb2dyZXNzaXZlLklOU1RBR1JBTS5DTElQUy5DMy43MjAuZGFzaF9iYXNlbGluZV8xX3YxIn0&_nc_ht=scontent-fra3-2.cdninstagram.com&_nc_cat=100&vs=74ecc39693c554d&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8yNDRBRkI1N0VGMUZENzY4MDZFMEM3Rjc2ODEzMzhCRF92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dPSWQ4aHRUc3lmRkdUa0RBQjU3R00td3NaNUZicV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJvDCg-ubh_wfFQIoAkMzLBdANYAAAAAAABgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYCtHbNzEwlWianNk62w9ggvabYXVGcU8ymIagnjy0QqiA&oe=675AF895&_nc_sid=1d576d',
      'Darshan Patil',
      likeCount: 2000,
      isLiked: true,
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
      'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
      commentList: [
        ReelCommentModel(
          comment: 'Nice...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
        ReelCommentModel(
          comment: 'Superr...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
        ReelCommentModel(
          comment: 'Great...',
          userProfilePic:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
      ]
  ),

].obs;
}