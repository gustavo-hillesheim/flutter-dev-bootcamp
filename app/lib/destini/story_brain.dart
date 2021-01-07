import 'package:flutter_dev_bootcamp/destini/story.dart';

class StoryBrain {
  int _currentStoryIndex = 0;
  final List<Story> _storyData = [
    Story(
        title:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        firstChoice: 'I\'ll hop in. Thanks for the help!',
        secondChoice: 'Better ask him if he\'s a murderer first.'),
    Story(
        title: 'He nods slowly, unphased by the question.',
        firstChoice: 'At least he\'s honest. I\'ll climb in.',
        secondChoice: 'Wait, I know how to change a tire.'),
    Story(
        title:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        firstChoice: 'I love Elton John! Hand him the cassette tape.',
        secondChoice: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        title:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        firstChoice: 'Restart',
        secondChoice: ''),
    Story(
        title:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        firstChoice: 'Restart',
        secondChoice: ''),
    Story(
        title:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        firstChoice: 'Restart',
        secondChoice: '')
  ];

  String getStoryTitle() {
    return this._storyData[_currentStoryIndex].title;
  }

  String getFirstChoice() {
    return this._storyData[_currentStoryIndex].firstChoice;
  }

  String getSecondChoice() {
    return this._storyData[_currentStoryIndex].secondChoice;
  }

  void nextStory(int choosenChoice) {
    if (choosenChoice == 1) {
      switch (_currentStoryIndex) {
        case 0:
        case 1:
          _currentStoryIndex = 2;
          break;
        case 2:
          _currentStoryIndex = 5;
          break;
        default:
          restart();
      }
    } else {
      switch (_currentStoryIndex) {
        case 0:
          _currentStoryIndex = 1;
          break;
        case 1:
          _currentStoryIndex = 3;
          break;
        case 2:
          _currentStoryIndex = 4;
          break;
        default:
          restart();
      }
    }
  }

  void restart() {
    _currentStoryIndex = 0;
  }

  bool buttonShouldBeVisible() {
    return [0, 1, 2].contains(_currentStoryIndex);
  }
}
