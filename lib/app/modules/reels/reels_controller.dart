import 'package:get/get.dart';

import 'models/reel_comment_model.dart';
import 'models/reel_model.dart';

class ReelsViewController extends GetxController{
RxList<ReelModel> reelsList = [
  ReelModel(
      'https://scontent-lhr6-2.cdninstagram.com/o1/v/t16/f2/m86/AQPiWdfRZiLcmTk1p-1XZz_gL_hzVLBHiWZv9KvHS-8oKpimDvuBgDN8GN228C_xNsVq3jM6Pvbw0WNmoV0i7xrmu9JNPczRP7kbmTE.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjkyMDUzNzEzOTYxMzQxNywidmVuY29kZV90YWciOiJ4cHZfcHJvZ3Jlc3NpdmUuSU5TVEFHUkFNLkNMSVBTLkMzLjcyMC5kYXNoX2Jhc2VsaW5lXzFfdjEifQ&_nc_ht=scontent-lhr6-2.cdninstagram.com&_nc_cat=107&vs=f9e8cdf5a93c299d&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC83NzQ3QUVDOUEzRDdDNjlEMjlGOTdBOTRDRUU1NkFCNl92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dNN0M2UnZBelBHZjdob0RBSU4yX2QwbDE2VVRicV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJtK7rJOozqIDFQIoAkMzLBdAQZm6XjU_fRgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYDYhBejFKFNnKJ4I50hwgJge46jqK0m14YMlvUU9N8N3w&oe=675E21F0&_nc_sid=1d576d',
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
      'https://scontent-lhr6-2.cdninstagram.com/o1/v/t16/f2/m86/AQNXq_GnOjQgrPfqQ9cF8KknIwtTD1Zcchcd8jP8X_qFWsBuIv3J6luLya-4aqfM56YeRRgz6LX7buAEBn1eN75YG6MRwqwjHPk2WRc.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjEzNDI2NTAwMzM3NzIwOTQsInZlbmNvZGVfdGFnIjoieHB2X3Byb2dyZXNzaXZlLklOU1RBR1JBTS5DTElQUy5DMy43MjAuZGFzaF9iYXNlbGluZV8xX3YxIn0&_nc_ht=scontent-lhr6-2.cdninstagram.com&_nc_cat=109&vs=4d9f608845df7a0a&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC83NTRCNEJGNjExNDdEMzIyMTkxQjhENjg5MDRFQ0I4MF92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dDZk01eHVFLVFyQnpld0RBUFo0Y3plREgxVUhicV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJvzYkKXCyOIEFQIoAkMzLBdAM7xqfvnbIxgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYD0QWyHeUpnTbkSeB_DuKa8iSZapKDiS6QOu73CWMMShg&oe=675E1252&_nc_sid=1d576d',
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
      'https://scontent-lhr6-2.cdninstagram.com/o1/v/t16/f2/m86/AQNZCwYA5kUybaFSBy2cG7BPVoCUt3w9SfGAIakJ2NCITrIi4mYVox2HAjPcekhWwPYwY_nSZszBGALm66cdyobTAJhr1Ky2J2ngyOw.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjk3NDYyMDY5NzgyNDgzNSwidmVuY29kZV90YWciOiJ4cHZfcHJvZ3Jlc3NpdmUuSU5TVEFHUkFNLkNMSVBTLkMzLjcyMC5kYXNoX2Jhc2VsaW5lXzFfdjEifQ&_nc_ht=scontent-lhr6-2.cdninstagram.com&_nc_cat=111&vs=17fb3467840d9f0c&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9DRTQ1MUVEMjNFQTRCNkM4QUVDODk1MDA2NjE3MTNBQl92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dJWHd3aHNBYjgzcGZJWUJBSnJ3cl80Z3UyUkhicV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJoa54IeymrsDFQIoAkMzLBdAQYAgxJul4xgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYDE9aj8K_miK5TECK_wP9dIFMzO5kYgltYdqdpoYUh-Jw&oe=675DFB54&_nc_sid=1d576d',
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