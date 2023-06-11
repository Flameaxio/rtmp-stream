import { Controller } from '@hotwired/stimulus'
import OvenPlayer from 'ovenplayer'

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
    const player = OvenPlayer.create('video', {
      autoStart: true,
      autoFallback: true,
      mute: false,
      sources: [
        {
          type: 'webrtc',
          file: 'ws://127.0.0.1:3333/app/stream',
        },
      ],
    })
  }
}
