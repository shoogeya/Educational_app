import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:masar/app/core/theme/app_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  List<Map<String, dynamic>> downloadedVideos = [];

  @override
  void initState() {
    super.initState();
    checkStoragePermission().then((_) {
      loadDownloadedVideos();
    });
  }

  Future<void> checkStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        return;
      }
    }
  }

  Future<void> loadDownloadedVideos() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final files = directory.listSync().where((file) {
        return file.path.endsWith('.mp4'); // عرض فقط الملفات بصيغة mp4
      }).toList();

      // الحصول على أسماء الملفات المحفوظة محليًا
      final downloadedFiles =
          files.map((file) => file.path.split('/').last).toList();

      // تحديث قائمة الكورسات بناءً على الفيديوهات التي تم تنزيلها
      setState(() {
        downloadedVideos = allCourses.where((course) {
          course['videos'] = course['videos'].where((video) {
            return downloadedFiles.contains(video['fileName']);
          }).toList();
          return course['videos']
              .isNotEmpty; // فقط الكورسات التي تحتوي على فيديوهات
        }).toList();
      });
    } catch (e) {
      print("Error loading videos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('التنزيلات'),
      ),
      body: downloadedVideos.isEmpty
          ? const Center(child: Text("لا توجد فيديوهات محمّلة"))
          : ListView.builder(
              itemCount: downloadedVideos.length,
              itemBuilder: (context, courseIndex) {
                final course = downloadedVideos[courseIndex];
                return ExpansionTile(
                  title: Text(course['courseName']),
                  children: course['videos'].map<Widget>((video) {
                    return ListTile(
                      title: Text(video['title']),
                      trailing: Icon(Icons.play_circle, color: Colors.green),
                      onTap: () {
                        if (File(video['filePath']).existsSync()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocalVideoPlayerScreen(
                                videoFile: File(video['filePath']),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("ملف الفيديو غير موجود"),
                            ),
                          );
                        }
                      },
                    );
                  }).toList(),
                );
              },
            ),
    );
  }
}

class LocalVideoPlayerScreen extends StatefulWidget {
  final File videoFile;

  const LocalVideoPlayerScreen({Key? key, required this.videoFile})
      : super(key: key);

  @override
  _LocalVideoPlayerScreenState createState() => _LocalVideoPlayerScreenState();
}

class _LocalVideoPlayerScreenState extends State<LocalVideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          looping: false,
        );
        setState(() {});
      }).catchError((error) {
        print("Error initializing video player: $error");
        print("Video file path: ${widget.videoFile.path}");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("فشل في تحميل الفيديو"),
          ),
        );
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // استخراج اسم الفيديو من الملف
    final videoName = widget.videoFile.path.split('/').last;

    return Scaffold(
      appBar: AppBar(
        title: Text(videoName), // عرض اسم الفيديو في العنوان
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), // زر الرجوع
          onPressed: () {
            Navigator.pop(context); // الرجوع إلى الصفحة السابقة
          },
        ),
      ),
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Column(
                children: [
                  Expanded(
                    child: Chewie(controller: _chewieController!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "اسم الفيديو: $videoName", // عرض اسم الفيديو
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            : const CircularProgressIndicator(), // يظهر مؤشراً في حال لم يتم التهيئة بعد
      ),
    );
  }
}

final List<Map<String, dynamic>> allCourses = [
  {
    "courseName": "Mathematics",
    "videos": [
      {
        "title": "Introduction to Algebra",
        "fileName": "algebra.mp4",
        "filePath": "/path/to/algebra.mp4"
      },
      {
        "title": "Geometry Basics",
        "fileName": "geometry.mp4",
        "filePath": "/path/to/geometry.mp4"
      },
    ]
  },
  {
    "courseName": "Physics",
    "videos": [
      {
        "title": "Newton's Laws",
        "fileName": "newton.mp4",
        "filePath": "/path/to/newton.mp4"
      },
      {
        "title": "Thermodynamics Basics",
        "fileName": "thermodynamics.mp4",
        "filePath": "/path/to/thermodynamics.mp4"
      },
    ]
  },
];
