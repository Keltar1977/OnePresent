/*
 * Copyright (c) 2013-2014 Razeware LLC
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import AVFoundation
import UIKit

/**
 * Audio player that uses AVFoundation to play looping background music and
 * short sound effects. For when using SKActions just isn't good enough.
 */
public class SKTAudio {
  public var backgroundMusicPlayer: AVAudioPlayer?
  public var soundEffectPlayer: AVAudioPlayer?
  public var narrationEffectPlayer: AVAudioPlayer?
  public var withNarration = true
  public var daySeven = false

  public class func sharedInstance() -> SKTAudio {
    return SKTAudioInstance
  }

  public func playBackgroundMusic(_ filename: String) {
    guard let sound = NSDataAsset(name: filename) else {
        print("Could not find file: \(filename)")
        return
    }
    do {
        backgroundMusicPlayer = try AVAudioPlayer(data: sound.data)
        if let player = backgroundMusicPlayer {
            player.volume = 0.3
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
        }
    } catch {
        print(error)
    }
    }

  public func pauseBackgroundMusic() {
    if let player = backgroundMusicPlayer {
      if player.isPlaying {
        player.pause()
      }
    }
  }

  public func resumeBackgroundMusic() {
    if let player = backgroundMusicPlayer {
      if !player.isPlaying {
        player.play()
      }
    }
  }

  public func playSoundEffect(_ filename: String) {
    guard let sound = NSDataAsset(name: filename) else {
        print("Could not find file: \(filename)")
        return
    }
    do {
        soundEffectPlayer = try AVAudioPlayer(data: sound.data)
        if let player = soundEffectPlayer {
          player.volume = 1.0
          player.numberOfLoops = 0
          player.prepareToPlay()
          player.play()
        }
    } catch {
        print(error)
    }
    }
    
    public func pauseSoundEffect() {
        if let player = soundEffectPlayer {
            if player.isPlaying {
                player.pause()
            }
        }
    }
    
    public func playNarration(_ filename: String) {
        guard let sound = NSDataAsset(name: filename), (withNarration || daySeven) else {
            return
        }
        do {
            narrationEffectPlayer = try AVAudioPlayer(data: sound.data)
            if let player = narrationEffectPlayer {
                player.volume = 1.0
                player.numberOfLoops = 0
                player.prepareToPlay()
                player.play()
            }
        } catch {
            print(error)
        }
    }
    
    public func pauseNarration() {
        if let player = narrationEffectPlayer {
            if player.isPlaying {
                player.pause()
            }
        }
    }
    
    
}

private let SKTAudioInstance = SKTAudio()
