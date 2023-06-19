import { Controller } from '@hotwired/stimulus'
import OvenPlayer from 'ovenplayer'

export default class extends Controller {
  static values = { streamUrl: String }

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
    OvenPlayer.create('video', {
      autoStart: true,
      autoFallback: true,
      mute: false,
      sources: [
        {
          type: 'webrtc',
          file: this.streamUrlValue,
        },
      ],
    })
  }
}
