import { Controller } from '@hotwired/stimulus'
import OvenPlayer from 'ovenplayer'

export default class extends Controller {
  static values = { handle: String }

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
    console.log(`ws://127.0.0.1:3333/app/${this.handleValue}/webrtc`)
    OvenPlayer.create('video', {
      autoStart: true,
      autoFallback: true,
      mute: false,
      sources: [
        {
          type: 'webrtc',
          file: `ws://127.0.0.1:3333/app/${this.handleValue}/webrtc`,
        },
      ],
    })
  }
}
