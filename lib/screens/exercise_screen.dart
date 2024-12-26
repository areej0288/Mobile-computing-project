import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExerciseScreen extends StatefulWidget {
  final String categoryName;
  final List<Map<String, String>> exercises;

  const ExerciseScreen({
    super.key,
    required this.categoryName,
    required this.exercises,
  });

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _currentExerciseIndex = 0;
  bool _isTimerRunning = false;
  final int _timerSeconds = 30;
  late int _remainingSeconds;
  VideoPlayerController? _videoController;
  bool _isPlaying = false;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = _timerSeconds;
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      // Dispose of previous controller if it exists
      await _videoController?.dispose();

      final currentExercise = widget.exercises[_currentExerciseIndex];
      _videoController =
          VideoPlayerController.asset(currentExercise['videoPath']!);

      setState(() {
        _isVideoInitialized = false;
        _isPlaying = false;
      });

      await _videoController!.initialize();
      await _videoController!.setLooping(true);

      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });
      }
    } catch (e) {
      print('Error initializing video: $e');
      if (mounted) {
        setState(() {
          _isVideoInitialized = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading video: ${e.toString()}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _startStopTimer() {
    if (_isTimerRunning) {
      setState(() {
        _isTimerRunning = false;
      });
    } else {
      setState(() {
        _isTimerRunning = true;
        _remainingSeconds = _timerSeconds;
      });

      Future.doWhile(() async {
        if (!mounted) return false;
        await Future.delayed(const Duration(seconds: 1));
        if (_remainingSeconds > 0 && _isTimerRunning) {
          setState(() {
            _remainingSeconds--;
          });
          return true;
        } else {
          setState(() {
            _isTimerRunning = false;
          });
          return false;
        }
      });
    }
  }

  void _playPauseVideo() {
    if (_videoController == null || !_isVideoInitialized) return;

    setState(() {
      if (_isPlaying) {
        _videoController!.pause();
      } else {
        _videoController!.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  Future<void> _changeExercise(int newIndex) async {
    if (newIndex < 0 || newIndex >= widget.exercises.length) return;

    setState(() {
      _currentExerciseIndex = newIndex;
      _isTimerRunning = false;
      _remainingSeconds = _timerSeconds;
    });

    await _initializeVideo();
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentExercise = widget.exercises[_currentExerciseIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryName} Exercises'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentExercise['name']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              currentExercise['description']!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _videoController != null && _isVideoInitialized
                    ? AspectRatio(
                        aspectRatio: _videoController!.value.aspectRatio,
                        child: VideoPlayer(_videoController!),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: IconButton(
                onPressed: _isVideoInitialized ? _playPauseVideo : null,
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                  color: _isVideoInitialized ? Colors.teal : Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                _isTimerRunning
                    ? 'Time Remaining: $_remainingSeconds seconds'
                    : 'Timer Stopped',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _startStopTimer,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _isTimerRunning ? 'Stop Timer' : 'Start Timer',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentExerciseIndex > 0
                      ? () => _changeExercise(_currentExerciseIndex - 1)
                      : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _currentExerciseIndex < widget.exercises.length - 1
                      ? () => _changeExercise(_currentExerciseIndex + 1)
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
