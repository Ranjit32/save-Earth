import 'story.dart';

class StoryBrain {
  int _storyIndex = 0;
  List<Story> _storyData = [
    Story(
      storyTitle:
          'There used to live villagers who cut down all the tress from the forest of their village.After some months their village was badly affected by flood and landslide and of them got killed.Would you have cut down the trees if you were one of the villagers?".',
      choice1:
          'That was just the natural disaster.Natural resources is for everyone.',
      choice2: 'Earth is our home and It\s our responsibility to  preserve it.',
    ),
    Story(
        storyTitle:
            'Your  thinking is great.What are you currently doing to protect and preserve our earth?',
        choice1: 'To be honest ,I am not doing anything.',
        choice2:
            'I am oraganizing different plantation programs and doing everything ithat I can do from my side,'),
    Story(
        storyTitle:
            'Don\'t you know the flood and landslide was because of deforestation.What if you are the next victim?',
        choice1: 'Are you serious?',
        choice2:
            'Yeah! I know.But only a single person can not change the world.'),
    Story(
        storyTitle:
            'What? That sounds really bad',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'Let us remember: One book, one pen, one child, and one teacher, can change the world. Never doubt that a small group of thoughtful committed citizens can change the world.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'What? That sounds really bad.',
        choice1: 'Restart',
        choice2: '')
  ];

  String getStory() {
    return _storyData[_storyIndex].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyIndex].choice1;
  }

  String getChoice2() {
    return _storyData[_storyIndex].choice2;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyIndex == 0) {
      _storyIndex = 2;
    } else if (choiceNumber == 2 && _storyIndex == 0) {
      _storyIndex = 1;
    } else if (choiceNumber == 1 && _storyIndex == 2) {
      _storyIndex = 5;
    } else if (choiceNumber == 2 && _storyIndex == 1) {
      _storyIndex = 3;
    } else if (choiceNumber == 1 && _storyIndex == 1) {
      _storyIndex = 2;
    } else if (choiceNumber == 2 && _storyIndex == 2) {
      _storyIndex = 4;
    } else if (_storyIndex == 3 || _storyIndex == 4 || _storyIndex == 5) {
      restart();
    }
  }

  void restart() {
    _storyIndex = 0;
  }

  bool buttonShouldBeVisible() {
    if (_storyIndex == 0 || _storyIndex == 1 || _storyIndex == 2) {
      return true;
    } else {
      return false;
    }
  }
}
