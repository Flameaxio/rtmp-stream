import { Controller } from '@hotwired/stimulus'
import Plyr from 'plyr'
import Hls from 'hls.js'

export default class extends Controller {
  connect() {
    this.loadVideo()
  }

  static targets = ['message']

  submit(e) {
    e.preventDefault()
    e.target.submit()
    e.target.reset()
  }

  loadVideo() {
    const source = `${window.location.protocol}//${window.location.host}/hls/${window.streamKey}.m3u8`
    const video = document.querySelector('video')
    if (!video) {
      return
    }

    const player = new Plyr(video, {
      controls: ['play-large', 'play', 'mute', 'volume', 'pip', 'fullscreen'],
    })

    if (!Hls.isSupported()) {
      video.src = source
    } else {
      const hls = new Hls()
      hls.loadSource(source)
      hls.attachMedia(video)
      window.hls = hls
    }

    // Show the video container
    video.classList.remove('hiddendiv')
    player.play()
  }
}
